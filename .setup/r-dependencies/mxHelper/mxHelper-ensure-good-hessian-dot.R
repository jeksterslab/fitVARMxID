.MxHelperEnsureGoodHessian <- function(model,
                                       tries_explore = 100,
                                       tries_local = 100,
                                       max_attempts = 10,
                                       grad_tol = 1e-2,
                                       hess_tol_abs = 1e-8,
                                       hess_tol_rel = 1e-10,
                                       check_condition = FALSE,
                                       cond_max = 1e12,
                                       abs_bnd_tol = 1e-6,
                                       rel_bnd_tol = 1e-4,
                                       factor = 10,
                                       relax_on_last = TRUE,
                                       relax_exclude = NULL,
                                       protect_lb_zero = TRUE,
                                       ok_codes = 0L,
                                       require_finite_fit = TRUE,
                                       rerun_code6 = TRUE,
                                       relax_streak = 3,
                                       relax_min_attempt = 3,
                                       silent = FALSE) {
  obj <- inherits(model, "MxModel")
  if (isFALSE(obj)) {
    # nolint start
    return(NULL)
    # nolint end
  }
  # Use this function only when an initial fitting attempt (e.g., mxTryHard)
  # did not meet criteria for convergence + PD Hessian + not at bounds.
  model <- .MxHelperForceHessianOptions(model)

  .GetStatusCode <- function(x) {
    tryCatch(
      {
        x$output$status$code
      },
      error = function(e) {
        NA_integer_
      }
    )
  }

  .GetFitValue <- function(x) {
    tryCatch(
      {
        x$output$fit
      },
      error = function(e) {
        NA_real_
      }
    )
  }

  .Check <- function(x) {
    good_fit <- .MxHelperIsGoodFit(
      x = x,
      grad_tol = grad_tol,
      ok_codes = ok_codes,
      require_finite_fit = require_finite_fit
    )
    pd_hessian <- .MxHelperHasPdHessian(
      x = x,
      hess_tol_abs = hess_tol_abs,
      hess_tol_rel = hess_tol_rel,
      check_condition = check_condition,
      cond_max = cond_max
    )
    bd_obj <- .MxHelperAtBounds(
      x = x,
      abs_bnd_tol = abs_bnd_tol,
      rel_bnd_tol = rel_bnd_tol
    )
    list(
      ok = isTRUE(good_fit) &&
        isTRUE(pd_hessian) &&
        !isTRUE(bd_obj$any),
      good_fit = good_fit,
      pd_hessian = pd_hessian,
      bd = bd_obj,
      code = .GetStatusCode(x),
      fit = .GetFitValue(x)
    )
  }

  .Rank <- function(chk) {
    if (isTRUE(chk$ok)) {
      return(0L)
    }
    if (isTRUE(chk$good_fit) && isTRUE(chk$pd_hessian)) {
      return(1L) # only bounds failing
    }
    if (isTRUE(chk$good_fit)) {
      return(2L)
    }
    if (isTRUE(chk$pd_hessian)) {
      return(3L)
    }
    if (is.finite(chk$fit)) {
      return(4L)
    }
    5L
  }

  .Obj <- function(chk) {
    if (is.finite(chk$fit)) {
      chk$fit
    } else {
      Inf
    }
  }

  # --- Decide whether we should do anything ---
  status_code <- .GetStatusCode(model)
  run <- is.null(model$output) ||
    is.na(status_code) ||
    !(status_code %in% ok_codes)

  if (!run) {
    chk0 <- .Check(model)
    run <- !isTRUE(chk0$ok)
  }

  if (!run) {
    return(model)
  }

  # --- Start from the given (failed) fit whenever possible ---
  has_output <- !is.null(model$output) && !is.na(status_code)
  fit <- model

  if (!has_output) {
    if (!silent && interactive()) {
      cat("\nNo valid output; starting wide exploration.\n")
    }
    fit <- OpenMx::mxTryHardWideSearch(
      model = fit,
      extraTries = tries_explore,
      checkHess = FALSE,
      silent = silent
    )
    fit <- OpenMx::mxTryHard(
      model = fit,
      extraTries = tries_local,
      silent = silent,
      jitterDistrib = "rnorm",
      scale = 0.05,
      checkHess = FALSE
    )
  } else {
    if (!silent && interactive()) {
      cat("\nStarting Hessian rescue from existing fit.\n")
    }
  }

  # --- Best-so-far tracking ---
  best_model <- fit
  best_chk <- .Check(fit)
  best_rank <- .Rank(best_chk)
  best_obj <- .Obj(best_chk)

  .UpdateBest <- function(candidate, chk) {
    rk <- .Rank(chk)
    obj <- .Obj(chk)
    improved <- FALSE

    if (rk < best_rank || (rk == best_rank && obj < best_obj)) {
      best_model <<- candidate
      best_chk <<- chk
      best_rank <<- rk
      best_obj <<- obj
      improved <- TRUE
    }

    improved
  }

  attempt <- 1L

  # Bound-hit tracking
  bd_streak <- 0L
  bd_last_labels <- character(0)

  # Progress tracking (based on best-so-far improvement)
  no_improve_streak <- 0L
  no_improve_max <- 3L

  repeat {
    final <- OpenMx::mxRun(model = fit, silent = silent)

    # Code 6 often clears with a single rerun;
    if (isTRUE(rerun_code6)) {
      code_now <- .GetStatusCode(final)
      if (isTRUE(code_now == 6L) && !isTRUE(6L %in% ok_codes)) {
        final <- OpenMx::mxRun(model = final, silent = silent)
      }
    }

    fit <- final
    chk <- .Check(final)

    if (.UpdateBest(candidate = final, chk = chk)) {
      no_improve_streak <- 0L
    } else {
      no_improve_streak <- no_improve_streak + 1L
    }

    if (isTRUE(chk$ok)) {
      return(final)
    }

    if (attempt >= max_attempts) {
      warning(
        paste0(
          "Rescue did not meet criteria after ",
          max_attempts,
          " attempts; returning best candidate encountered."
        )
      )
      return(best_model)
    }

    # --- Track whether the SAME labels keep hitting bounds ---
    if (isTRUE(chk$bd$any)) {
      bd_labels <- sort(unique(c(
        names(chk$bd$at_lb)[chk$bd$at_lb],
        names(chk$bd$at_ub)[chk$bd$at_ub]
      )))
      bd_labels <- bd_labels[!is.na(bd_labels)]

      if (identical(bd_labels, bd_last_labels)) {
        bd_streak <- bd_streak + 1L
      } else {
        bd_streak <- 1L
      }
      bd_last_labels <- bd_labels
    } else {
      bd_streak <- 0L
      bd_last_labels <- character(0)
    }

    # --- If at bounds, try nudging first (cheap; doesn't change bounds) ---
    if (isTRUE(chk$bd$any)) {
      if (!silent && interactive()) {
        cat("\nNudging parameter estimates off bounds.\n")
      }
      fit <- .MxHelperNudgeOffBounds(
        x = fit,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        mult = 10
      )
    }

    # --- Relax bounds late OR when bound-hits persist ---
    relax_now <- isTRUE(relax_on_last) && (
      attempt == (max_attempts - 1L) ||
        (
          isTRUE(chk$bd$any) &&
            attempt >= relax_min_attempt &&
            bd_streak >= relax_streak
        )
    )

    if (isTRUE(relax_now) && isTRUE(chk$bd$any)) {
      if (!silent && interactive()) {
        cat("\nRelaxing bounds for parameters at bounds.\n")
      }
      fit <- .MxHelperRelaxBoundsAtBounds(
        x = fit,
        factor = factor,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        exclude = relax_exclude,
        protect_lb_zero = protect_lb_zero
      )
      fit <- OpenMx::mxTryHardWideSearch(
        model = fit,
        extraTries = tries_explore,
        checkHess = FALSE,
        silent = silent
      )
      no_improve_streak <- 0L
    }

    # --- If we're stuck and not making progress, do a wide exploration bump ---
    if (!isTRUE(chk$bd$any) && no_improve_streak >= no_improve_max) {
      if (!silent && interactive()) {
        cat("\nNo improvement; performing a small wide exploration bump.\n")
      }
      fit <- OpenMx::mxTryHardWideSearch(
        model = fit,
        extraTries = tries_explore,
        checkHess = FALSE,
        silent = silent
      )
      no_improve_streak <- 0L
    }

    # --- Local retry, with shrinking jitter as attempts increase ---
    local_scale <- 0.05 / sqrt(attempt + 1)
    fit <- OpenMx::mxTryHard(
      model = fit,
      extraTries = tries_local,
      silent = silent,
      jitterDistrib = "rnorm",
      scale = local_scale,
      checkHess = FALSE
    )

    attempt <- attempt + 1L
  }
}

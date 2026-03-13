.FitVARMxID <- function(data,
                        observed,
                        id,
                        time,
                        ct,
                        center,
                        mu_fixed,
                        mu_free,
                        mu_values,
                        mu_lbound,
                        mu_ubound,
                        alpha_fixed,
                        alpha_free,
                        alpha_values,
                        alpha_lbound,
                        alpha_ubound,
                        beta_fixed,
                        beta_free,
                        beta_values,
                        beta_lbound,
                        beta_ubound,
                        psi_diag,
                        psi_fixed,
                        psi_d_free,
                        psi_d_values,
                        psi_d_lbound,
                        psi_d_ubound,
                        psi_d_equal,
                        psi_l_free,
                        psi_l_values,
                        psi_l_lbound,
                        psi_l_ubound,
                        nu_fixed,
                        nu_free,
                        nu_values,
                        nu_lbound,
                        nu_ubound,
                        theta_diag,
                        theta_fixed,
                        theta_d_free,
                        theta_d_values,
                        theta_d_lbound,
                        theta_d_ubound,
                        theta_d_equal,
                        theta_l_free,
                        theta_l_values,
                        theta_l_lbound,
                        theta_l_ubound,
                        mu0_fixed,
                        mu0_func,
                        mu0_free,
                        mu0_values,
                        mu0_lbound,
                        mu0_ubound,
                        sigma0_fixed,
                        sigma0_func,
                        sigma0_diag,
                        sigma0_d_free,
                        sigma0_d_values,
                        sigma0_d_lbound,
                        sigma0_d_ubound,
                        sigma0_d_equal,
                        sigma0_l_free,
                        sigma0_l_values,
                        sigma0_l_lbound,
                        sigma0_l_ubound,
                        robust,
                        seed,
                        tries_explore,
                        tries_local,
                        max_attempts,
                        silent,
                        ncores) {
  threads <- OpenMx::mxOption(
    key = "Number of Threads"
  )
  on.exit(
    OpenMx::mxOption(
      key = "Number of Threads",
      value = threads
    ),
    add = TRUE
  )
  grad_tol <- 1e-2
  hess_tol_abs <- 1e-8
  hess_tol_rel <- 1e-10
  check_condition <- FALSE
  cond_max <- 1e12
  abs_bnd_tol <- 1e-6
  rel_bnd_tol <- 1e-4
  ok_codes <- 0L
  require_finite_fit <- TRUE
  factor <- 10
  relax_on_last <- TRUE
  relax_exclude <- NULL
  protect_lb_zero <- TRUE
  rerun_code6 <- TRUE
  relax_streak <- 3
  relax_min_attempt <- 3
  if (is.null(ncores)) {
    ncores <- 1L
  } else {
    ncores <- min(
      as.integer(ncores),
      parallel::detectCores(),
      length(unique(data[, id]))
    )
  }
  fork <- FALSE
  if (ncores > 1) {
    # nocov start
    OpenMx::mxOption(
      key = "Number of Threads",
      value = 1
    )
    os_type <- Sys.info()["sysname"]
    if (os_type == "Darwin") {
      fork <- TRUE
    } else if (os_type == "Linux") {
      fork <- TRUE
    } else {
      fork <- FALSE
    }
    # nocov end
  }
  model <- .FitVARMxIDBuildModelID(
    data = data,
    observed = observed,
    id = id,
    time = time,
    ct = ct,
    center = center,
    mu_fixed = mu_fixed,
    mu_free = mu_free,
    mu_values = mu_values,
    mu_lbound = mu_lbound,
    mu_ubound = mu_ubound,
    alpha_fixed = alpha_fixed,
    alpha_free = alpha_free,
    alpha_values = alpha_values,
    alpha_lbound = alpha_lbound,
    alpha_ubound = alpha_ubound,
    beta_fixed = beta_fixed,
    beta_free = beta_free,
    beta_values = beta_values,
    beta_lbound = beta_lbound,
    beta_ubound = beta_ubound,
    psi_diag = psi_diag,
    psi_fixed = psi_fixed,
    psi_d_free = psi_d_free,
    psi_d_values = psi_d_values,
    psi_d_lbound = psi_d_lbound,
    psi_d_ubound = psi_d_ubound,
    psi_d_equal = psi_d_equal,
    psi_l_free = psi_l_free,
    psi_l_values = psi_l_values,
    psi_l_lbound = psi_l_lbound,
    psi_l_ubound = psi_l_ubound,
    nu_fixed = nu_fixed,
    nu_free = nu_free,
    nu_values = nu_values,
    nu_lbound = nu_lbound,
    nu_ubound = nu_ubound,
    theta_diag = theta_diag,
    theta_fixed = theta_fixed,
    theta_d_free = theta_d_free,
    theta_d_values = theta_d_values,
    theta_d_lbound = theta_d_lbound,
    theta_d_ubound = theta_d_ubound,
    theta_d_equal = theta_d_equal,
    theta_l_free = theta_l_free,
    theta_l_values = theta_l_values,
    theta_l_lbound = theta_l_lbound,
    theta_l_ubound = theta_l_ubound,
    mu0_fixed = mu0_fixed,
    mu0_func = mu0_func,
    mu0_free = mu0_free,
    mu0_values = mu0_values,
    mu0_lbound = mu0_lbound,
    mu0_ubound = mu0_ubound,
    sigma0_fixed = sigma0_fixed,
    sigma0_func = sigma0_func,
    sigma0_diag = sigma0_diag,
    sigma0_d_free = sigma0_d_free,
    sigma0_d_values = sigma0_d_values,
    sigma0_d_lbound = sigma0_d_lbound,
    sigma0_d_ubound = sigma0_d_ubound,
    sigma0_d_equal = sigma0_d_equal,
    sigma0_l_free = sigma0_l_free,
    sigma0_l_values = sigma0_l_values,
    sigma0_l_lbound = sigma0_l_lbound,
    sigma0_l_ubound = sigma0_l_ubound,
    ncores = ncores,
    fork = fork
  )
  model_names <- names(model)
  if (isTRUE(ncores > 1)) {
    # nocov start
    if (isTRUE(fork)) {
      if (!is.null(seed)) {
        set.seed(seed)
      }
      # first pass
      if (isFALSE(silent) && interactive()) {
        # nocov start
        cat("\nModel fitting...\n")
        # nocov end
      }
      fit <- parallel::mclapply(
        X = model,
        FUN = .MxHelperRun,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        silent = silent,
        mc.cores = ncores
      )
      # second pass
      refit <- vapply(
        X = fit,
        FUN = .MxHelperNeedsRescue,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        FUN.VALUE = logical(1)
      )
      if (any(refit)) {
        if (isFALSE(silent) && interactive()) {
          # nocov start
          cat("\nChecking Hessian...\n")
          # nocov end
        }
        fit[refit] <- parallel::mclapply(
          X = fit[refit],
          FUN = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore,
          tries_local = tries_local,
          max_attempts = max_attempts,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor,
          relax_on_last = relax_on_last,
          relax_exclude = relax_exclude,
          protect_lb_zero = protect_lb_zero,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit,
          rerun_code6 = rerun_code6,
          relax_streak = relax_streak,
          relax_min_attempt = relax_min_attempt,
          silent = silent,
          mc.cores = ncores
        )
      }
      still_bad <- vapply(
        X = fit,
        FUN = .MxHelperNeedsRescue,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        FUN.VALUE = logical(1)
      )
      if (any(still_bad)) {
        if (isFALSE(silent) && interactive()) {
          # nocov start
          cat("\nChecking Hessian for a second time...\n")
          # nocov end
        }
        fit[still_bad] <- parallel::mclapply(
          X = fit[still_bad],
          FUN = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore,
          tries_local = tries_local,
          max_attempts = max_attempts,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor,
          relax_on_last = TRUE,
          relax_exclude = relax_exclude,
          protect_lb_zero = protect_lb_zero,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit,
          rerun_code6 = rerun_code6,
          relax_streak = relax_streak,
          relax_min_attempt = relax_min_attempt,
          silent = silent,
          mc.cores = ncores
        )
      }
      if (robust) {
        sandwich <- parallel::mclapply(
          X = fit,
          FUN = .RobustSE,
          mc.cores = ncores
        )
        names(sandwich) <- model_names
      } else {
        sandwich <- NULL
      }
    } else {
      cl <- parallel::makeCluster(ncores)
      parallel::clusterEvalQ(cl = cl, library(OpenMx))
      if (!is.null(seed)) {
        parallel::clusterSetRNGStream(
          cl = cl,
          iseed = seed
        )
      }
      on.exit(
        parallel::stopCluster(cl = cl),
        add = TRUE
      )
      # first pass
      if (isFALSE(silent) && interactive()) {
        # nocov start
        cat("\nModel fitting...\n")
        # nocov end
      }
      fit <- parallel::parLapply(
        cl = cl,
        X = model,
        fun = .MxHelperRun,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        silent = silent,
        mc.cores = ncores
      )
      # second pass
      refit <- vapply(
        X = fit,
        FUN = .MxHelperNeedsRescue,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        FUN.VALUE = logical(1)
      )
      if (any(refit)) {
        if (isFALSE(silent) && interactive()) {
          # nocov start
          cat("\nChecking Hessian...\n")
          # nocov end
        }
        fit[refit] <- parallel::parLapply(
          cl = cl,
          X = fit[refit],
          fun = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore,
          tries_local = tries_local,
          max_attempts = max_attempts,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor,
          relax_on_last = relax_on_last,
          relax_exclude = relax_exclude,
          protect_lb_zero = protect_lb_zero,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit,
          rerun_code6 = rerun_code6,
          relax_streak = relax_streak,
          relax_min_attempt = relax_min_attempt,
          silent = silent
        )
      }
      still_bad <- vapply(
        X = fit,
        FUN = .MxHelperNeedsRescue,
        grad_tol = grad_tol,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        FUN.VALUE = logical(1)
      )
      if (any(still_bad)) {
        if (isFALSE(silent) && interactive()) {
          # nocov start
          cat("\nChecking Hessian for a second time...\n")
          # nocov end
        }
        fit[still_bad] <- parallel::parLapply(
          cl = cl,
          X = fit[still_bad],
          fun = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore,
          tries_local = tries_local,
          max_attempts = max_attempts,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor,
          relax_on_last = TRUE,
          relax_exclude = relax_exclude,
          protect_lb_zero = protect_lb_zero,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit,
          rerun_code6 = rerun_code6,
          relax_streak = relax_streak,
          relax_min_attempt = relax_min_attempt,
          silent = silent
        )
      }
      if (robust) {
        sandwich <- parallel::parLapply(
          cl = cl,
          X = fit,
          fun = .RobustSE
        )
        names(sandwich) <- model_names
      } else {
        sandwich <- NULL
      }
    }
    # nocov end
  } else {
    if (!is.null(seed)) {
      set.seed(seed)
    }
    # first pass
    if (isFALSE(silent) && interactive()) {
      # nocov start
      cat("\nModel fitting...\n")
      # nocov end
    }
    fit <- lapply(
      X = model,
      FUN = .MxHelperRun,
      grad_tol = grad_tol,
      ok_codes = ok_codes,
      require_finite_fit = require_finite_fit,
      hess_tol_abs = hess_tol_abs,
      hess_tol_rel = hess_tol_rel,
      check_condition = check_condition,
      cond_max = cond_max,
      silent = silent
    )
    # second pass
    refit <- vapply(
      X = fit,
      FUN = .MxHelperNeedsRescue,
      grad_tol = grad_tol,
      ok_codes = ok_codes,
      require_finite_fit = require_finite_fit,
      hess_tol_abs = hess_tol_abs,
      hess_tol_rel = hess_tol_rel,
      check_condition = check_condition,
      cond_max = cond_max,
      abs_bnd_tol = abs_bnd_tol,
      rel_bnd_tol = rel_bnd_tol,
      FUN.VALUE = logical(1)
    )
    if (any(refit)) {
      if (isFALSE(silent) && interactive()) {
        # nocov start
        cat("\nChecking Hessian...\n")
        # nocov end
      }
      fit[refit] <- lapply(
        X = fit[refit],
        FUN = .MxHelperEnsureGoodHessian,
        tries_explore = tries_explore,
        tries_local = tries_local,
        max_attempts = max_attempts,
        grad_tol = grad_tol,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        factor = factor,
        relax_on_last = relax_on_last,
        relax_exclude = relax_exclude,
        protect_lb_zero = protect_lb_zero,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        rerun_code6 = rerun_code6,
        relax_streak = relax_streak,
        relax_min_attempt = relax_min_attempt,
        silent = silent
      )
    }
    still_bad <- vapply(
      X = fit,
      FUN = .MxHelperNeedsRescue,
      grad_tol = grad_tol,
      ok_codes = ok_codes,
      require_finite_fit = require_finite_fit,
      hess_tol_abs = hess_tol_abs,
      hess_tol_rel = hess_tol_rel,
      check_condition = check_condition,
      cond_max = cond_max,
      abs_bnd_tol = abs_bnd_tol,
      rel_bnd_tol = rel_bnd_tol,
      FUN.VALUE = logical(1)
    )
    if (any(still_bad)) {
      if (isFALSE(silent) && interactive()) {
        # nocov start
        cat("\nChecking Hessian for a second time...\n")
        # nocov end
      }
      fit[still_bad] <- lapply(
        X = fit[still_bad],
        FUN = .MxHelperEnsureGoodHessian,
        tries_explore = tries_explore,
        tries_local = tries_local,
        max_attempts = max_attempts,
        grad_tol = grad_tol,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        factor = factor,
        relax_on_last = TRUE,
        relax_exclude = relax_exclude,
        protect_lb_zero = protect_lb_zero,
        ok_codes = ok_codes,
        require_finite_fit = require_finite_fit,
        rerun_code6 = rerun_code6,
        relax_streak = relax_streak,
        relax_min_attempt = relax_min_attempt,
        silent = silent
      )
    }
    if (robust) {
      sandwich <- lapply(
        X = fit,
        FUN = .RobustSE
      )
      names(sandwich) <- model_names
    } else {
      sandwich <- NULL
    }
  }
  converged <- vapply(
    X = fit,
    FUN = function(x) {
      if (!inherits(x, "MxModel")) {
        FALSE
      } else {
        !.MxHelperNeedsRescue(
          model = x,
          grad_tol = grad_tol,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol
        )
      }
    },
    FUN.VALUE = logical(1)
  )
  names(fit) <- model_names
  names(converged) <- model_names
  list(
    model = model,
    fit = fit,
    converged = converged,
    robust = sandwich
  )
}

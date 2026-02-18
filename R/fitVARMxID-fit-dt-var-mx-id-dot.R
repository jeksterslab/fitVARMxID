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
                        seed,
                        tries_explore,
                        tries_local,
                        max_attempts,
                        grad_tol,
                        hess_tol_abs,
                        hess_tol_rel,
                        check_condition,
                        cond_max,
                        abs_bnd_tol,
                        rel_bnd_tol,
                        ok_codes,
                        require_finite_fit,
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
  factor <- 10
  relax_on_last <- TRUE
  relax_exclude <- NULL
  protect_lb_zero <- TRUE
  rerun_code6 <- TRUE
  relax_streak <- 3
  relax_min_attempt <- 3
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
    sigma0_l_ubound = sigma0_l_ubound
  )
  # nocov start
  if (is.null(ncores)) {
    par <- FALSE
  } else {
    ncores <- min(
      as.integer(ncores),
      parallel::detectCores(),
      length(model)
    )
    if (ncores > 1) {
      par <- TRUE
    } else {
      par <- FALSE
    }
  }
  # nocov end
  if (isTRUE(par)) {
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
    if (isTRUE(fork)) {
      if (!is.null(seed)) {
        RNGkind("L'Ecuyer-CMRG")
        set.seed(seed)
      }
      # first pass
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
        warning(
          paste0(
            sum(still_bad),
            " model(s) still did not meet convergence criteria after Hessian rescue."
          )
        )
      }
      if (any(still_bad)) {
        fit[still_bad] <- parallel::mclapply(
          X = fit[still_bad],
          FUN = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore * 5,
          tries_local = tries_local * 5,
          max_attempts = max_attempts * 2,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor * 10,
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
      fit <- parallel::parLapply(
        cl = cl,
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
        fit[refit] <- parallel::parLapply(
          cl = cl,
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
        warning(
          paste0(
            sum(still_bad),
            " model(s) still did not meet convergence criteria after Hessian rescue."
          )
        )
      }
      if (any(still_bad)) {
        fit[still_bad] <- parallel::parLapply(
          cl = cl,
          X = fit[still_bad],
          FUN = .MxHelperEnsureGoodHessian,
          tries_explore = tries_explore * 5,
          tries_local = tries_local * 5,
          max_attempts = max_attempts * 2,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          hess_tol_rel = hess_tol_rel,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          factor = factor * 10,
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
    }
    # nocov end
  } else {
    if (!is.null(seed)) {
      set.seed(seed)
    }
    # first pass
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
      silent = silent,
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
      warning(
        paste0(
          sum(still_bad),
          " model(s) still did not meet convergence criteria after Hessian rescue."
        )
      )
    }
    if (any(still_bad)) {
      fit[still_bad] <- lapply(
        X = fit[still_bad],
        FUN = .MxHelperEnsureGoodHessian,
        tries_explore = tries_explore * 5,
        tries_local = tries_local * 5,
        max_attempts = max_attempts * 2,
        grad_tol = grad_tol,
        hess_tol_abs = hess_tol_abs,
        hess_tol_rel = hess_tol_rel,
        check_condition = check_condition,
        cond_max = cond_max,
        abs_bnd_tol = abs_bnd_tol,
        rel_bnd_tol = rel_bnd_tol,
        factor = factor * 10,
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
  }
  fit
}

.FitVARMxIDBuildModelID <- function(data,
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
                                    psi_d_free,
                                    psi_d_values,
                                    psi_d_lbound,
                                    psi_d_ubound,
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
                                    sigma0_l_free,
                                    sigma0_l_values,
                                    sigma0_l_lbound,
                                    sigma0_l_ubound,
                                    overwrite,
                                    path,
                                    prefix) {
  ids <- sort(
    unique(data[, id])
  )
  n <- length(ids)
  k <- length(observed)
  statenames <- paste0(
    "eta",
    seq_len(k)
  )
  data <- lapply(
    X = ids,
    FUN = function(i) {
      data[which(data[, id] == i), , drop = FALSE]
    }
  )
  if (!is.list(beta_values)) {
    beta_values <- list(beta_values)
  }
  beta <- lapply(
    X = rep(x = beta_values, length.out = n),
    FUN = function(beta_values) {
      .FitVARMxIDBeta(
        k = k,
        statenames = statenames,
        beta_fixed = beta_fixed,
        beta_free = beta_free,
        beta_values = beta_values,
        beta_lbound = beta_lbound,
        beta_ubound = beta_ubound,
        ct = ct
      )
    }
  )
  if (center) {
    if (!mu_fixed && !nu_fixed) {
      stop(
        "`mu` and `nu` cannot be modeled at the same time at the moment."
      )
    }
    if (!is.list(mu_values)) {
      mu_values <- list(mu_values)
    }
    mean_str <- lapply(
      X = rep(x = mu_values, length.out = n),
      FUN = function(mu_values) {
        .FitVARMxIDMu(
          k = k,
          statenames = statenames,
          mu_fixed = mu_fixed,
          mu_free = mu_free,
          mu_values = mu_values,
          mu_lbound = mu_lbound,
          mu_ubound = mu_ubound,
          ct = ct
        )
      }
    )
  } else {
    if (!alpha_fixed && !nu_fixed) {
      stop(
        "`alpha` and `nu` cannot be modeled at the same time at the moment."
      )
    }
    if (!is.list(alpha_values)) {
      alpha_values <- list(alpha_values)
    }
    mean_str <- lapply(
      X = rep(x = alpha_values, length.out = n),
      FUN = function(alpha_values) {
        .FitVARMxIDAlpha(
          k = k,
          statenames = statenames,
          alpha_fixed = alpha_fixed,
          alpha_free = alpha_free,
          alpha_values = alpha_values,
          alpha_lbound = alpha_lbound,
          alpha_ubound = alpha_ubound,
          ct = ct
        )
      }
    )
  }
  lambda <- lapply(
    X = seq_len(n),
    FUN = function(i) {
      .FitVARMxIDLambda(
        k = k,
        observed = observed,
        statenames = statenames
      )
    }
  )
  if (!is.list(nu_values)) {
    nu_values <- list(nu_values)
  }
  nu <- lapply(
    X = rep(x = nu_values, length.out = n),
    FUN = function(nu_values) {
      .FitVARMxIDNu(
        k = k,
        observed = observed,
        nu_fixed = nu_fixed,
        nu_free = nu_free,
        nu_values = nu_values,
        nu_lbound = nu_lbound,
        nu_ubound = nu_ubound
      )
    }
  )
  if (!is.list(psi_d_values)) {
    psi_d_values <- list(psi_d_values)
  }
  if (!is.list(psi_l_values)) {
    psi_l_values <- list(psi_l_values)
  }
  psi <- mapply(
    psi_d_values = rep(x = psi_d_values, length.out = n),
    psi_l_values = rep(x = psi_l_values, length.out = n),
    FUN = function(psi_d_values,
                   psi_l_values) {
      .FitVARMxIDPsi(
        k = k,
        statenames = statenames,
        psi_diag = psi_diag,
        psi_d_free = psi_d_free,
        psi_d_values = psi_d_values,
        psi_d_lbound = psi_d_lbound,
        psi_d_ubound = psi_d_ubound,
        psi_l_free = psi_l_free,
        psi_l_values = psi_l_values,
        psi_l_lbound = psi_l_lbound,
        psi_l_ubound = psi_l_ubound
      )
    },
    SIMPLIFY = FALSE
  )
  if (!is.list(theta_d_values)) {
    theta_d_values <- list(theta_d_values)
  }
  theta <- lapply(
    X = rep(x = theta_d_values, length.out = n),
    FUN = function(theta_d_values) {
      .FitVARMxIDTheta(
        k = k,
        observed = observed,
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
        theta_l_ubound = theta_l_ubound
      )
    }
  )
  if (!is.list(mu0_values)) {
    mu0_values <- list(mu0_values)
  }
  mu0 <- lapply(
    X = rep(x = mu0_values, length.out = n),
    FUN = function(mu0_values) {
      .FitVARMxIDMu0(
        k = k,
        statenames = statenames,
        mu0_fixed = mu0_fixed,
        mu0_func = mu0_func,
        mu0_free = mu0_free,
        mu0_values = mu0_values,
        mu0_lbound = mu0_lbound,
        mu0_ubound = mu0_ubound,
        ct = ct
      )
    }
  )
  if (!is.list(sigma0_d_values)) {
    sigma0_d_values <- list(sigma0_d_values)
  }
  if (!is.list(sigma0_l_values)) {
    sigma0_l_values <- list(sigma0_l_values)
  }
  sigma0 <- mapply(
    sigma0_d_values = rep(x = sigma0_d_values, length.out = n),
    sigma0_l_values = rep(x = sigma0_l_values, length.out = n),
    FUN = function(sigma0_d_values,
                   sigma0_l_values) {
      .FitVARMxIDSigma0(
        k = k,
        statenames = statenames,
        sigma0_fixed = sigma0_fixed,
        sigma0_func = sigma0_func,
        sigma0_diag = sigma0_diag,
        sigma0_d_free = sigma0_d_free,
        sigma0_d_values = sigma0_d_values,
        sigma0_d_lbound = sigma0_d_lbound,
        sigma0_d_ubound = sigma0_d_ubound,
        sigma0_l_free = sigma0_l_free,
        sigma0_l_values = sigma0_l_values,
        sigma0_l_lbound = sigma0_l_lbound,
        sigma0_l_ubound = sigma0_l_ubound,
        ct = ct
      )
    },
    SIMPLIFY = FALSE
  )
  covariate <- lapply(
    X = seq_len(n),
    FUN = function(i) {
      .FitVARMxIDX()
    }
  )
  sigma <- lapply(
    X = seq_len(n),
    FUN = function(i) {
      .FitVARMxIDSigma(
        k = k,
        statenames = statenames,
        ct = ct
      )
    }
  )
  matrices <- lapply(
    X = seq_len(n),
    FUN = function(i) {
      list(
        id = ids[i],
        data = data[[i]],
        beta = beta[[i]],
        mean_str = mean_str[[i]],
        lambda = lambda[[i]],
        nu = nu[[i]],
        psi = psi[[i]],
        theta = theta[[i]],
        mu0 = mu0[[i]],
        sigma0 = sigma0[[i]],
        covariate = covariate[[i]],
        sigma = sigma[[i]]
      )
    }
  )
  submodels <- lapply(
    X = seq_len(n),
    FUN = function(i) {
      mat <- matrices[[i]]
      out <- .FitVARMxIDModelID(
        id = mat$id,
        data = mat$data,
        observed = observed,
        ct = ct,
        time = time,
        beta = mat$beta,
        mean_str = mat$mean_str,
        lambda = mat$lambda,
        nu = mat$nu,
        psi = mat$psi,
        theta = mat$theta,
        mu0 = mat$mu0,
        sigma0 = mat$sigma0,
        covariate = mat$covariate,
        sigma = mat$sigma
      )
      fn <- file.path(
        path,
        paste0(
          prefix,
          "_",
          methods::slot(
            object = out,
            name = "name"
          ),
          ".Rds"
        )
      )
      needs_rewrite <- !file.exists(fn) || {
        # nocov start
        obj <- tryCatch(readRDS(fn), error = function(e) NULL)
        is.null(obj) || !inherits(obj, "MxModel")
        # nocov end
      }
      if (overwrite || needs_rewrite) {
        saveRDS(
          object = out,
          file = fn
        )
      }
      fn
    }
  )
  c(
    do.call(
      what = "rbind",
      args = submodels
    )
  )
}

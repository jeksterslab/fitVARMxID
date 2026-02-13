.FitVARMxIDMu <- function(k,
                          statenames,
                          center,
                          mu_fixed,
                          mu_free,
                          mu_values,
                          mu_lbound,
                          mu_ubound,
                          ct) {
  # B
  # latent variables on covariates
  if (mu_fixed) {
    mu <- .FitVARMxIDMuFixed(
      k = k,
      mu_values = mu_values
    )
  } else {
    mu_values <- tryCatch(
      {
        .MxHelperDTVARAlphaValues(
          p = k,
          val = mu_values
        )
      },
      error = function(e) {
        stop("Error in `mu_values`: ", e$message)
      },
      warning = function(w) {
        stop("Warning in `mu_values`: ", w$message)
      }
    )
    mu <- .MxHelperFullMxMatrix(
      m = k,
      n = 1,
      free_val = mu_free,
      values = mu_values,
      lbound_val = mu_lbound,
      ubound_val = mu_ubound,
      vec = TRUE,
      row = statenames,
      col = 1,
      name = "mu"
    )
  }
  alpha_iden <- list(
    alpha_iden = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k,
      ncol = k,
      name = "alpha_iden"
    )
  )
  b_mat <- list(
    b_mat = OpenMx::mxAlgebraFromString(
      algString = "alpha",
      name = "B",
      dimnames = list(
        statenames,
        "B"
      )
    )
  )
  if (ct) {
    alpha <- list(
      alpha = OpenMx::mxAlgebraFromString(
        algString = "-beta %*% mu",
        name = "alpha",
        dimnames = list(
          statenames,
          "alpha"
        )
      )
    )
  } else {
    alpha <- list(
      alpha = OpenMx::mxAlgebraFromString(
        algString = "mu - beta %*% mu",
        name = "alpha",
        dimnames = list(
          statenames,
          "alpha"
        )
      )
    )
  }
  c(
    alpha,
    alpha_iden,
    mu,
    b_mat
  )
}

.FitVARMxIDAlpha <- function(k,
                             statenames,
                             center,
                             alpha_fixed,
                             alpha_free,
                             alpha_values,
                             alpha_lbound,
                             alpha_ubound,
                             ct) {
  # B
  # latent variables on covariates
  if (alpha_fixed) {
    alpha <- .FitVARMxIDAlphaFixed(
      k = k,
      alpha_values = alpha_values
    )
  } else {
    alpha_values <- tryCatch(
      {
        .MxHelperDTVARAlphaValues(
          p = k,
          val = alpha_values
        )
      },
      error = function(e) {
        # nocov start
        stop("Error in `alpha_values`: ", e$message)
        # nocov end
      },
      warning = function(w) {
        # nocov start
        stop("Warning in `alpha_values`: ", w$message)
        # nocov end
      }
    )
    alpha <- .MxHelperFullMxMatrix(
      m = k,
      n = 1,
      free_val = alpha_free,
      values = alpha_values,
      lbound_val = alpha_lbound,
      ubound_val = alpha_ubound,
      vec = TRUE,
      row = statenames,
      col = 1,
      name = "alpha"
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
    mu <- list(
      mu = OpenMx::mxAlgebraFromString(
        algString = "solve(-beta) %*% alpha",
        name = "mu",
        dimnames = list(
          statenames,
          "mu"
        )
      )
    )
  } else {
    mu <- list(
      mu = OpenMx::mxAlgebraFromString(
        algString = "solve(alpha_iden - beta) %*% alpha",
        name = "mu",
        dimnames = list(
          statenames,
          "mu"
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

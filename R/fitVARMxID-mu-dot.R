.FitVARMxIDMu <- function(k,
                          statenames,
                          center,
                          mu_fixed,
                          mu_free,
                          mu_values,
                          mu_lbound,
                          mu_ubound,
                          name_mu,
                          name_alpha,
                          name_beta) {
  # B
  # latent variables on covariates
  if (mu_fixed) {
    mu <- .FitVARMxIDMuFixed(
      k = k,
      mu_values = mu_values,
      name = name_mu
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
      name = name_mu
    )
  }
  c(
    mu,
    OpenMx::mxAlgebraFromString(
      algString = paste0(
        name_mu,
        " - ",
        name_beta,
        " %*% ",
        name_mu
      ),
      name = name_alpha
    ),
    OpenMx::mxAlgebraFromString(
      algString = paste0(
        name_mu,
        " - ",
        name_beta,
        " %*% ",
        name_mu
      ),
      name = "B"
    )
  )
}

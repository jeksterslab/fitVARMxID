.FitVARMxIDAlphaFixed <- function(k,
                                  alpha_values) {
  # B
  # latent variables on covariates
  if (is.null(alpha_values)) {
    alpha <- list(
      alpha = OpenMx::mxMatrix(
        type = "Zero",
        nrow = k,
        ncol = 1,
        name = "alpha"
      )
    )
  } else {
    alpha <- list(
      alpha = OpenMx::mxMatrix(
        type = "Full",
        nrow = k,
        ncol = 1,
        free = FALSE,
        values = alpha_values,
        byrow = FALSE,
        name = "alpha"
      )
    )
  }
  alpha
}

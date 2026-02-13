.FitVARMxBetaFixed <- function(k,
                               beta_values) {
  # A
  # auto regression and cross regression coefficients
  if (is.null(beta_values)) {
    beta <- list(
      beta = OpenMx::mxMatrix(
        type = "Zero",
        nrow = k,
        ncol = k,
        name = "beta"
      )
    )
  } else {
    beta <- list(
      beta = OpenMx::mxMatrix(
        type = "Full",
        nrow = k,
        ncol = k,
        free = FALSE,
        values = beta_values,
        byrow = FALSE,
        name = "beta"
      )
    )
  }
  beta
}

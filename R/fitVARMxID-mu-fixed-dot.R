.FitVARMxIDMuFixed <- function(k,
                               mu_values) {
  # B
  # latent variables on covariates
  if (is.null(mu_values)) {
    mu <- list(
      mu = OpenMx::mxMatrix(
        type = "Zero",
        nrow = k,
        ncol = 1,
        name = "mu"
      )
    )
  } else {
    mu <- list(
      mu = OpenMx::mxMatrix(
        type = "Full",
        nrow = k,
        ncol = 1,
        free = FALSE,
        values = mu_values,
        byrow = FALSE,
        name = "mu"
      )
    )
  }
  mu
}

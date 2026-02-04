.FitVARMxIDMuFixed <- function(k,
                               mu_values,
                               name) {
  # B
  # latent variables on covariates
  if (is.null(mu_values)) {
    mu <- OpenMx::mxMatrix(
      type = "Zero",
      nrow = k,
      ncol = 1,
      name = name
    )
  } else {
    mu <- OpenMx::mxMatrix(
      type = "Full",
      nrow = k,
      ncol = 1,
      free = FALSE,
      values = mu_values,
      byrow = FALSE,
      name = name
    )
  }
  mu
}

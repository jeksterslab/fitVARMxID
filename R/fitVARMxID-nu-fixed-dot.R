.FitVARMxIDNuFixed <- function(k,
                               nu_values) {
  # D
  # observed variables on covariates
  if (is.null(nu_values)) {
    nu <- list(
      nu = OpenMx::mxMatrix(
        type = "Zero",
        nrow = k,
        ncol = 1,
        name = "nu"
      )
    )
  } else {
    nu <- list(
      nu = OpenMx::mxMatrix(
        type = "Full",
        nrow = k,
        ncol = 1,
        free = FALSE,
        values = nu_values,
        byrow = FALSE,
        name = "nu"
      )
    )
  }
  nu
}

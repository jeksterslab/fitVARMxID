.FitVARMxIDX <- function() {
  # u
  # covariates
  list(
    covariate = OpenMx::mxMatrix(
      type = "Unit",
      nrow = 1,
      ncol = 1,
      name = "covariate"
    )
  )
}

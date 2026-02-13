.FitVARMxIDLambda <- function(k,
                              observed,
                              statenames) {
  # C
  # measurement model factor loadings
  lambda <- list(
    lambda = OpenMx::mxMatrix(
      type = "Diag",
      nrow = k,
      ncol = k,
      free = FALSE,
      values = 1,
      labels = NA,
      lbound = NA,
      ubound = NA,
      byrow = FALSE,
      dimnames = list(
        observed,
        statenames
      ),
      name = "lambda"
    )
  )
  c_mat <- list(
    c_mat = OpenMx::mxAlgebraFromString(
      algString = "lambda",
      dimnames = list(
        observed,
        statenames
      ),
      name = "C"
    )
  )
  c(
    lambda,
    c_mat
  )
}

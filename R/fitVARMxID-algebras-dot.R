.FitVARMxIDAlgebras <- function(k) {
  list(
    iden_k = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k,
      ncol = k,
      name = "iden_k"
    ),
    iden_k_sqr = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k^2,
      ncol = k^2,
      name = "iden_k_sqr"
    )
  )
}

.FitVARMxIDSigma <- function(k,
                             statenames,
                             ct) {
  if (isTRUE(ct)) {
    sigma_column <- list(
      sigma_column = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(beta %x% iden_k + iden_k %x% beta)",
          " %*% ",
          "-cvectorize(psi)"
        ),
        name = "sigma_column"
      )
    )
  } else {
    sigma_column <- list(
      sigma_column = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(iden_k_sqr - beta %x% beta)",
          " %*% ",
          "cvectorize(psi)"
        ),
        name = "sigma_column"
      )
    )
  }
  sigma_mat <- list(
    sigma_mat = OpenMx::mxMatrix(
      type = "Full",
      nrow = k,
      ncol = k,
      labels = paste0(
        "sigma_column[",
        1:(k * k),
        ",",
        1,
        "]"
      ),
      dimnames = list(
        statenames,
        statenames
      ),
      name = "sigma_mat"
    )
  )
  sigma <- list(
    sigma = OpenMx::mxAlgebraFromString(
      algString = paste0(
        "0.5 * (sigma_mat + t(sigma_mat))"
      ),
      dimnames = list(
        statenames,
        statenames
      ),
      name = "sigma"
    )
  )
  c(
    sigma,
    sigma_column,
    sigma_mat
  )
}

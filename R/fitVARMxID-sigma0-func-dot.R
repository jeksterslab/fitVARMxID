.FitVARMxIDSigma0Func <- function(k,
                                  statenames,
                                  ct) {
  # P0
  # Initial condition covariance matrix
  # sigma0_values will be implied by the algebra
  if (ct) {
    sigma0_iden_func <- list(
      sigma0_iden_func = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k,
        ncol = k,
        name = "sigma0_iden_func"
      )
    )
    sigma0_column <- list(
      sigma0_column = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(beta %x% sigma0_iden_func + sigma0_iden_func %x% beta)",
          " %*% ",
          "-cvectorize(psi)"
        ),
        name = "sigma0_column"
      )
    )
  } else {
    sigma0_iden_func <- list(
      sigma0_iden_func = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k * k,
        ncol = k * k,
        name = "sigma0_iden_func"
      )
    )
    sigma0_column <- list(
      sigma0_column = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(sigma0_iden_func - beta %x% beta)",
          " %*% ",
          "cvectorize(psi)"
        ),
        name = "sigma0_column"
      )
    )
  }
  sigma0_mat <- list(
    sigma0_mat = OpenMx::mxMatrix(
      type = "Full",
      nrow = k,
      ncol = k,
      labels = paste0(
        "sigma0_column[",
        1:(k * k),
        ",",
        1,
        "]"
      ),
      dimnames = list(
        statenames,
        statenames
      ),
      name = "sigma0_mat"
    )
  )
  sigma0 <- list(
    sigma0 = OpenMx::mxAlgebraFromString(
      algString = paste0(
        "0.5 * (sigma0_mat + t(sigma0_mat))"
      ),
      dimnames = list(
        statenames,
        statenames
      ),
      name = "sigma0"
    )
  )
  c(
    sigma0,
    sigma0_iden_func,
    sigma0_column,
    sigma0_mat
  )
}

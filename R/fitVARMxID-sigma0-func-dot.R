.FitVARMxIDSigma0Func <- function(k,
                                  statenames,
                                  ct) {
  # P0
  # Initial condition covariance matrix
  # sigma0_values will be implied by the algebra
  if (ct) {
    sigma0_iden <- list(
      sigma0_iden = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k,
        ncol = k,
        name = "sigma0_iden"
      )
    )
    sigma0_vector <- list(
      sigma0_vector = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(beta %x% sigma0_iden + sigma0_iden %x% beta)",
          " %*% ",
          "-cvectorize(psi)"
        ),
        name = "sigma0_vector"
      )
    )
  } else {
    sigma0_iden <- list(
      sigma0_iden = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k * k,
        ncol = k * k,
        name = "sigma0_iden"
      )
    )
    sigma0_vector <- list(
      sigma0_vector = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(sigma0_iden - beta %x% beta)",
          " %*% ",
          "cvectorize(psi)"
        ),
        name = "sigma0_vector"
      )
    )
  }
  sigma0_mat <- list(
    sigma0_mat = OpenMx::mxMatrix(
      "Full",
      nrow = k,
      ncol = k,
      labels = paste0(
        "sigma0_vector[",
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
    sigma0_iden,
    sigma0_vector,
    sigma0_mat
  )
}

.FitVARMxIDSigma <- function(k,
                             statenames,
                             ct) {
  if (ct) {
    sigma_iden <- list(
      sigma_iden = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k,
        ncol = k,
        name = "sigma_iden"
      )
    )
    sigma_vector <- list(
      sigma_vector = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(beta %x% sigma_iden + sigma_iden %x% beta)",
          " %*% ",
          "-cvectorize(psi)"
        ),
        name = "sigma_vector"
      )
    )
  } else {
    sigma_iden <- list(
      sigma_iden = OpenMx::mxMatrix(
        type = "Iden",
        nrow = k * k,
        ncol = k * k,
        name = "sigma_iden"
      )
    )
    sigma_vector <- list(
      sigma_vector = OpenMx::mxAlgebraFromString(
        algString = paste0(
          "solve(sigma_iden - beta %x% beta)",
          " %*% ",
          "cvectorize(psi)"
        ),
        name = "sigma_vector"
      )
    )
  }
  sigma_mat <- list(
    sigma_mat = OpenMx::mxMatrix(
      type = "Full",
      nrow = k,
      ncol = k,
      labels = paste0(
        "sigma_vector[",
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
    sigma_iden,
    sigma_vector,
    sigma_mat
  )
}

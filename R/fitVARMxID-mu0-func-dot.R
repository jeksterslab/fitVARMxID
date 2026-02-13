.FitVARMxIDMu0Func <- function(k,
                               statenames,
                               ct) {
  # x0
  # initial condition
  # mean
  # alpha is specified as a covariate (gamma)
  # mu0_values will implied by the algebra
  mu0_iden <- list(
    mu0_iden = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k,
      ncol = k,
      name = "mu0_iden"
    )
  )
  if (ct) {
    mu0 <- list(
      mu0 = OpenMx::mxAlgebraFromString(
        algString = "solve(-beta) %*% alpha",
        name = "mu0",
        dimnames = list(
          statenames,
          "mu0"
        )
      )
    )
  } else {
    mu0 <- list(
      mu0 = OpenMx::mxAlgebraFromString(
        algString = "solve(mu0_iden - beta) %*% alpha",
        name = "mu0",
        dimnames = list(
          statenames,
          "mu0"
        )
      )
    )
  }
  c(
    mu0,
    mu0_iden
  )
}

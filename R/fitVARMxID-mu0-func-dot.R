.FitVARMxIDMu0Func <- function(k,
                               statenames,
                               ct) {
  # x0
  # initial condition
  # mean
  # alpha is specified as a covariate (gamma)
  if (isTRUE(ct)) {
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
        algString = "solve(iden_k - beta) %*% alpha",
        name = "mu0",
        dimnames = list(
          statenames,
          "mu0"
        )
      )
    )
  }
  mu0
}

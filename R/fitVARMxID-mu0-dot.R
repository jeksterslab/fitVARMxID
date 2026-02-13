.FitVARMxIDMu0 <- function(k,
                           statenames,
                           mu0_fixed,
                           mu0_func,
                           mu0_free,
                           mu0_values,
                           mu0_lbound,
                           mu0_ubound,
                           ct) {
  # x0
  # initial condition
  # mean
  if (mu0_fixed) {
    if (mu0_func) {
      mu0 <- .FitVARMxIDMu0Func(
        k = k,
        statenames = statenames,
        ct = ct
      )
    } else {
      mu0 <- .FitVARMxIDMu0Fixed(
        k = k,
        statenames = statenames,
        mu0_values = mu0_values
      )
    }
  } else {
    mu0 <- .FitVARMxIDMu0Vec(
      k = k,
      statenames = statenames,
      mu0_free = mu0_free,
      mu0_values = mu0_values,
      mu0_lbound = mu0_lbound,
      mu0_ubound = mu0_ubound
    )
  }
  x0_mat <- list(
    OpenMx::mxAlgebraFromString(
      algString = "mu0",
      name = "x0",
      dimnames = list(
        statenames,
        "x0"
      )
    )
  )
  c(
    mu0,
    x0_mat
  )
}

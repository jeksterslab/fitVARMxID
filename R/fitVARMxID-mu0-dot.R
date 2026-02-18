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
  if (isTRUE(mu0_fixed)) {
    mu0_free <- FALSE
  }
  if (isFALSE(is.null(mu0_values))) {
    mu0_func <- FALSE
  }
  m <- k
  n <- 1
  free_val <- mu0_free
  values <- mu0_values
  lbound_val <- mu0_lbound
  ubound_val <- mu0_ubound
  vec <- TRUE
  row <- statenames
  col <- "mu0"
  name <- "mu0"
  if (isTRUE(mu0_fixed)) {
    if (isTRUE(mu0_func)) {
      mu0 <- .FitVARMxIDMu0Func(
        k = k,
        statenames = statenames,
        ct = ct
      )
    } else {
      if (is.null(values)) {
        values <- rep(
          x = 0,
          times = k
        )
      }
      mu0 <- .MxHelperFullFixed(
        m = m,
        n = n,
        values = values,
        row = row,
        col = col,
        name = name
      )
    }
  } else {
    mu0 <- .MxHelperFullMxMatrix(
      m = m,
      n = n,
      free_val = free_val,
      values = values,
      lbound_val = lbound_val,
      ubound_val = ubound_val,
      vec = vec,
      row = row,
      col = col,
      name = name
    )
  }
  x0_mat <- list(
    x0_mat = OpenMx::mxAlgebraFromString(
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

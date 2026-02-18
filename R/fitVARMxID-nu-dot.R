.FitVARMxIDNu <- function(k,
                          observed,
                          nu_fixed,
                          nu_free,
                          nu_values,
                          nu_lbound,
                          nu_ubound) {
  # D
  # observed variables on covariates
  if (isTRUE(nu_fixed)) {
    nu_free <- FALSE
  }
  m <- k
  n <- 1
  free_val <- nu_free
  values <- nu_values
  lbound_val <- nu_lbound
  ubound_val <- nu_ubound
  vec <- TRUE
  row <- observed
  col <- "nu"
  name <- "nu"
  if (isTRUE(nu_fixed)) {
    nu <- .MxHelperFullFixed(
      m = m,
      n = n,
      values = values,
      row = row,
      col = col,
      name = name
    )
  } else {
    nu <- .MxHelperFullMxMatrix(
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
  d_mat <- list(
    d_mat = OpenMx::mxAlgebraFromString(
      algString = "nu",
      name = "D",
      dimnames = list(
        observed,
        "D"
      )
    )
  )
  c(
    nu,
    d_mat
  )
}

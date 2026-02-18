.FitVARMxIDAlpha <- function(k,
                             statenames,
                             alpha_fixed,
                             alpha_free,
                             alpha_values,
                             alpha_lbound,
                             alpha_ubound,
                             ct) {
  # B
  # latent variables on covariates
  if (isTRUE(alpha_fixed)) {
    alpha_free <- FALSE
  }
  m <- k
  n <- 1
  free_val <- alpha_free
  values <- alpha_values
  lbound_val <- alpha_lbound
  ubound_val <- alpha_ubound
  vec <- TRUE
  row <- statenames
  col <- "alpha"
  name <- "alpha"
  if (isTRUE(alpha_fixed)) {
    alpha <- .MxHelperFullFixed(
      m = m,
      n = n,
      values = values,
      row = row,
      col = col,
      name = name
    )
  } else {
    alpha <- .MxHelperFullMxMatrix(
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
  b_mat <- list(
    b_mat = OpenMx::mxAlgebraFromString(
      algString = "alpha",
      name = "B",
      dimnames = list(
        statenames,
        "B"
      )
    )
  )
  if (isTRUE(ct)) {
    mu <- list(
      mu = OpenMx::mxAlgebraFromString(
        algString = "solve(-beta) %*% alpha",
        name = "mu",
        dimnames = list(
          statenames,
          "mu"
        )
      )
    )
  } else {
    mu <- list(
      mu = OpenMx::mxAlgebraFromString(
        algString = "solve(iden_k - beta) %*% alpha",
        name = "mu",
        dimnames = list(
          statenames,
          "mu"
        )
      )
    )
  }
  c(
    alpha,
    mu,
    b_mat
  )
}

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
  if (alpha_fixed) {
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
  alpha_iden <- list(
    alpha_iden = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k,
      ncol = k,
      name = "alpha_iden"
    )
  )
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
  if (ct) {
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
        algString = "solve(alpha_iden - beta) %*% alpha",
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
    alpha_iden,
    mu,
    b_mat
  )
}

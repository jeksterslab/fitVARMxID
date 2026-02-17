.FitVARMxIDMu <- function(k,
                          statenames,
                          mu_fixed,
                          mu_free,
                          mu_values,
                          mu_lbound,
                          mu_ubound,
                          ct) {
  # B
  # latent variables on covariates
  m <- k
  n <- 1
  free_val <- mu_free
  values <- mu_values
  lbound_val <- mu_lbound
  ubound_val <- mu_ubound
  vec <- TRUE
  row <- statenames
  col <- "mu"
  name <- "mu"
  if (mu_fixed) {
    mu <- .MxHelperFullFixed(
      m = m,
      n = n,
      values = values,
      row = row,
      col = col,
      name = name
    )
  } else {
    mu <- .MxHelperFullMxMatrix(
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
    alpha <- list(
      alpha = OpenMx::mxAlgebraFromString(
        algString = "-beta %*% mu",
        name = "alpha",
        dimnames = list(
          statenames,
          "alpha"
        )
      )
    )
  } else {
    alpha <- list(
      alpha = OpenMx::mxAlgebraFromString(
        algString = "mu - beta %*% mu",
        name = "alpha",
        dimnames = list(
          statenames,
          "alpha"
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

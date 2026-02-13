.FitVARMxIDSigma0FixedSym <- function(k,
                                      statenames,
                                      sigma0_d_values,
                                      sigma0_l_values) {
  # P0
  # Initial condition covariance matrix
  if (is.null(sigma0_d_values)) {
    sigma0_d_values <- rep(
      x = log(expm1(1)),
      times = k
    )
  }
  .MxHelperSigmaFromLDLMxMatrix(
    p = k,
    name = "sigma0",
    column_name = "sigma0_d",
    sdiag_name = "sigma0_l",
    iden_name = "sigma0_iden",
    d_free = rep(x = FALSE, times = k),
    d_values = sigma0_d_values,
    d_lbound = rep(x = NA, times = k),
    d_ubound = rep(x = NA, times = k),
    d_rows = statenames,
    d_cols = "sigma0_d",
    d_equal = FALSE,
    l_free = matrix(data = FALSE, nrow = k, ncol = k),
    l_values = matrix(data = 0, nrow = k, ncol = k),
    l_lbound = rep(x = NA, times = k),
    l_ubound = rep(x = NA, times = k),
    l_rows = statenames,
    l_cols = statenames
  )
}

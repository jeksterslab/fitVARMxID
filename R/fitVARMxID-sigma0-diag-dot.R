.FitVARMxIDSigma0Diag <- function(k,
                                  statenames,
                                  sigma0_d_free,
                                  sigma0_d_values,
                                  sigma0_d_lbound,
                                  sigma0_d_ubound) {
  # P0
  # Initial condition covariance matrix
  .MxHelperSigmaDiagFromLDLMxMatrix(
    p = k,
    name = "sigma0",
    column_name = "sigma0_d",
    d_free = sigma0_d_free,
    d_values = sigma0_d_values,
    d_lbound = sigma0_d_lbound,
    d_ubound = sigma0_d_ubound,
    d_rows = statenames,
    d_cols = "sigma0_d",
    d_equal = FALSE
  )
}

.FitVARMxIDPsiDiag <- function(k,
                               statenames,
                               psi_d_free,
                               psi_d_values,
                               psi_d_lbound,
                               psi_d_ubound) {
  # Q
  # process noise
  .MxHelperSigmaDiagFromLDLMxMatrix(
    p = k,
    name = "psi",
    column_name = "psi_d",
    d_free = psi_d_free,
    d_values = psi_d_values,
    d_lbound = psi_d_lbound,
    d_ubound = psi_d_ubound,
    d_rows = statenames,
    d_cols = "psi_d",
    d_equal = FALSE
  )
}

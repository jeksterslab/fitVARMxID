.FitVARMxIDPsiSym <- function(k,
                              statenames,
                              psi_d_free,
                              psi_d_values,
                              psi_d_lbound,
                              psi_d_ubound,
                              psi_l_free,
                              psi_l_values,
                              psi_l_lbound,
                              psi_l_ubound) {
  # Q
  # process noise
  .MxHelperSigmaFromLDLMxMatrix(
    p = k,
    name = "psi",
    column_name = "psi_d",
    sdiag_name = "psi_l",
    iden_name = "psi_iden",
    d_free = psi_d_free,
    d_values = psi_d_values,
    d_lbound = psi_d_lbound,
    d_ubound = psi_d_ubound,
    d_rows = statenames,
    d_cols = "psi_d",
    d_equal = FALSE,
    l_free = psi_l_free,
    l_values = psi_l_values,
    l_lbound = psi_l_lbound,
    l_ubound = psi_l_ubound,
    l_rows = statenames,
    l_cols = statenames
  )
}

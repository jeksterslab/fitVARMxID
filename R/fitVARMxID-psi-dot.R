.FitVARMxIDPsi <- function(k,
                           statenames,
                           psi_diag,
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
  if (psi_diag) {
    psi <- .FitVARMxIDPsiDiag(
      k = k,
      statenames = statenames,
      psi_d_free = psi_d_free,
      psi_d_values = psi_d_values,
      psi_d_lbound = psi_d_lbound,
      psi_d_ubound = psi_d_ubound
    )
  } else {
    psi <- .FitVARMxIDPsiSym(
      k = k,
      statenames = statenames,
      psi_d_free = psi_d_free,
      psi_d_values = psi_d_values,
      psi_d_lbound = psi_d_lbound,
      psi_d_ubound = psi_d_ubound,
      psi_l_free = psi_l_free,
      psi_l_values = psi_l_values,
      psi_l_lbound = psi_l_lbound,
      psi_l_ubound = psi_l_ubound
    )
  }
  q_mat <- list(
    q_mat = OpenMx::mxAlgebraFromString(
      algString = "psi",
      name = "Q"
    )
  )
  c(
    psi,
    q_mat
  )
}

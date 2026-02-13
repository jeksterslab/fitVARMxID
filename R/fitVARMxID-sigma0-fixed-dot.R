.FitVARMxIDSigma0Fixed <- function(k,
                                   statenames,
                                   sigma0_diag,
                                   sigma0_d_values,
                                   sigma0_l_values) {
  # P0
  # Initial condition covariance matrix
  if (sigma0_diag) {
    sigma0 <- .FitVARMxIDSigma0FixedDiag(
      k = k,
      statenames = statenames,
      sigma0_d_values = sigma0_d_values
    )
  } else {
    sigma0 <- .FitVARMxIDSigma0FixedSym(
      k = k,
      statenames = statenames,
      sigma0_d_values = sigma0_d_values,
      sigma0_l_values = sigma0_l_values
    )
  }
  sigma0
}

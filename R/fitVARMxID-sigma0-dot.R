.FitVARMxIDSigma0 <- function(k,
                              statenames,
                              sigma0_fixed,
                              sigma0_func,
                              sigma0_diag,
                              sigma0_d_free,
                              sigma0_d_values,
                              sigma0_d_lbound,
                              sigma0_d_ubound,
                              sigma0_l_free,
                              sigma0_l_values,
                              sigma0_l_lbound,
                              sigma0_l_ubound,
                              ct) {
  # P0
  # Initial condition covariance matrix
  if (sigma0_fixed) {
    if (sigma0_func) {
      sigma0 <- .FitVARMxIDSigma0Func(
        k = k,
        statenames = statenames,
        ct = ct
      )
    } else {
      sigma0 <- .FitVARMxIDSigma0Fixed(
        k = k,
        statenames = statenames,
        sigma0_diag = sigma0_diag,
        sigma0_d_values = sigma0_d_values,
        sigma0_l_values = sigma0_l_values
      )
    }
  } else {
    if (sigma0_diag) {
      sigma0 <- .FitVARMxIDSigma0Diag(
        k = k,
        statenames = statenames,
        sigma0_d_free = sigma0_d_free,
        sigma0_d_values = sigma0_d_values,
        sigma0_d_lbound = sigma0_d_lbound,
        sigma0_d_ubound = sigma0_d_ubound
      )
    } else {
      sigma0 <- .FitVARMxIDSigma0Sym(
        k = k,
        statenames = statenames,
        sigma0_d_free = sigma0_d_free,
        sigma0_d_values = sigma0_d_values,
        sigma0_d_lbound = sigma0_d_lbound,
        sigma0_d_ubound = sigma0_d_ubound,
        sigma0_l_free = sigma0_l_free,
        sigma0_l_values = sigma0_l_values,
        sigma0_l_lbound = sigma0_l_lbound,
        sigma0_l_ubound = sigma0_l_ubound
      )
    }
  }
  p0_mat <- list(
    p0_mat = OpenMx::mxAlgebraFromString(
      algString = "sigma0",
      name = "P0"
    )
  )
  c(
    sigma0,
    p0_mat
  )
}

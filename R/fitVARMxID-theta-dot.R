.FitVARMxIDTheta <- function(k,
                             observed,
                             theta_diag,
                             theta_fixed,
                             theta_d_free,
                             theta_d_values,
                             theta_d_lbound,
                             theta_d_ubound,
                             theta_d_equal,
                             theta_l_free,
                             theta_l_values,
                             theta_l_lbound,
                             theta_l_ubound) {
  # R
  # measurement error
  if (theta_fixed) {
    theta <- .FitVARMxIDThetaFixed(
      k = k,
      observed = observed,
      theta_diag = theta_diag,
      theta_d_values = theta_d_values,
      theta_l_values = theta_l_values
    )
  } else {
    if (theta_diag) {
      theta <- .FitVARMxIDThetaDiag(
        k = k,
        observed = observed,
        theta_d_free = theta_d_free,
        theta_d_values = theta_d_values,
        theta_d_lbound = theta_d_lbound,
        theta_d_ubound = theta_d_ubound,
        theta_d_equal = theta_d_equal
      )
    } else {
      theta <- .FitVARMxIDThetaSym(
        k = k,
        observed = observed,
        theta_d_free = theta_d_free,
        theta_d_values = theta_d_values,
        theta_d_lbound = theta_d_lbound,
        theta_d_ubound = theta_d_ubound,
        theta_d_equal = theta_d_equal,
        theta_l_free = theta_l_free,
        theta_l_values = theta_l_values,
        theta_l_lbound = theta_l_lbound,
        theta_l_ubound = theta_l_ubound
      )
    }
  }
  r_mat <- list(
    r_mat = OpenMx::mxAlgebraFromString(
      algString = "theta",
      name = "R"
    )
  )
  c(
    theta,
    r_mat
  )
}

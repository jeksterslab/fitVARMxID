.FitVARMxIDThetaFixed <- function(k,
                                  observed,
                                  theta_diag,
                                  theta_d_values,
                                  theta_l_values) {
  # R
  # measurement error
  if (theta_diag) {
    if (is.null(theta_d_values)) {
      theta <- list(
        theta = OpenMx::mxMatrix(
          type = "Zero",
          nrow = k,
          ncol = k,
          dimnames = list(
            observed,
            observed
          ),
          name = "theta"
        )
      )
    } else {
      theta <- list(
        theta = OpenMx::mxMatrix(
          type = "Diag",
          nrow = k,
          ncol = k,
          free = FALSE,
          values = Softplus(theta_d_values),
          byrow = FALSE,
          dimnames = list(
            observed,
            observed
          ),
          name = "theta"
        )
      )
    }
  } else {
    if (is.null(theta_d_values) || is.null(theta_l_values)) {
      theta <- list(
        theta = OpenMx::mxMatrix(
          type = "Zero",
          nrow = k,
          ncol = k,
          dimnames = list(
            observed,
            observed
          ),
          name = "theta"
        )
      )
    } else {
      if (!is.null(theta_d_values)) {
        d <- Softplus(theta_d_values)
      } else {
        stop(
          "`theta_d_values` not supplied"
        )
      }
      if (!is.null(theta_l_values)) {
        l <- theta_l_values
      } else {
        stop(
          "`theta_l_values` not supplied"
        )
      }
      iden <- d_mat <- diag(k)
      diag(d_mat) <- d
      ldl <- (l + iden) %*% d_mat %*% t(l + iden)
      ldl <- 0.5 * (ldl + t(ldl))
      theta <- list(
        theta = OpenMx::mxMatrix(
          type = "Sym",
          nrow = k,
          ncol = k,
          free = FALSE,
          values = ldl,
          byrow = FALSE,
          dimnames = list(
            observed,
            observed
          ),
          name = "theta"
        )
      )
    }
  }
  theta
}

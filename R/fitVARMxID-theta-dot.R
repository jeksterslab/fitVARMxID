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
  if (isTRUE(theta_fixed)) {
    theta_d_free <- FALSE
    theta_l_free <- FALSE
  }
  type <- NULL
  if (isTRUE(theta_fixed)) {
    if (is.null(theta_d_values)) {
      # fix to a zero matrix (jitter 1e-10)
      type <- "zero"
    }
  } else {
    if (is.null(theta_d_lbound)) {
      theta_d_lbound <- -30
    } else {
      if (
        any(theta_d_lbound <= -700)
      ) {
        stop(
          paste0(
            "`theta_d_ubound` <= -700."
          )
        )
      }
    }
    if (is.null(theta_d_ubound)) {
      theta_d_ubound <- 650
    } else {
      if (
        any(theta_d_ubound >= 700)
      ) {
        stop(
          "`theta_d_ubound` >= 700."
        )
      }
    }
  }
  theta <- .FitVARMxIDCov(
    k = k,
    row = observed,
    name = "theta",
    type = type,
    diag = theta_diag,
    fixed = theta_fixed,
    d_free = theta_d_free,
    d_values = theta_d_values,
    d_lbound = theta_d_lbound,
    d_ubound = theta_d_ubound,
    d_equal = theta_d_equal,
    l_free = theta_l_free,
    l_values = theta_l_values,
    l_lbound = theta_l_lbound,
    l_ubound = theta_l_ubound
  )
  if (isTRUE(theta_fixed)) {
    if (!is.null(type)) {
      if (type == "zero") {
        theta$theta <- .MxHelperFullMxMatrix(
          m = k,
          n = k,
          free_val = FALSE,
          values = 0,
          lbound_val = NA,
          ubound_val = NA,
          vec = FALSE,
          row = observed,
          col = observed,
          name = "theta"
        )[["theta"]]
      }
    }
  }
  r_mat <- list(
    r_mat = OpenMx::mxAlgebraFromString(
      algString = "theta",
      name = "R",
      dimnames = list(
        observed,
        observed
      )
    )
  )
  c(
    theta,
    r_mat
  )
}

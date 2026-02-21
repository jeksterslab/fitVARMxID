.FitVARMxIDSigma0 <- function(k,
                              statenames,
                              sigma0_diag,
                              sigma0_fixed,
                              sigma0_func,
                              sigma0_d_free,
                              sigma0_d_values,
                              sigma0_d_lbound,
                              sigma0_d_ubound,
                              sigma0_d_equal,
                              sigma0_l_free,
                              sigma0_l_values,
                              sigma0_l_lbound,
                              sigma0_l_ubound,
                              ct) {
  # P0
  # Initial condition covariance matrix
  if (isTRUE(sigma0_fixed)) {
    sigma0_d_free <- FALSE
    sigma0_l_free <- FALSE
  }
  type <- NULL
  if (isTRUE(sigma0_fixed)) {
    if (isTRUE(sigma0_func)) {
      sigma0 <- .FitVARMxIDSigma0Func(
        k = k,
        statenames = statenames,
        ct = ct
      )
      run <- FALSE
    } else {
      if (is.null(sigma0_d_values)) {
        # fix to an identity matrix
        type <- "identity"
      } else {
        type <- NULL
      }
      run <- TRUE
    }
  } else {
    run <- TRUE
    if (is.null(sigma0_d_lbound)) {
      sigma0_d_lbound <- -30
    } else {
      if (
        any(sigma0_d_lbound <= -700)
      ) {
        stop(
          paste0(
            "`sigma0_d_ubound` <= -700."
          )
        )
      }
    }
    if (is.null(sigma0_d_ubound)) {
      sigma0_d_ubound <- 650
    } else {
      if (
        any(sigma0_d_ubound >= 700)
      ) {
        stop(
          "`sigma0_d_ubound` >= 700."
        )
      }
    }
  }
  if (isTRUE(run)) {
    sigma0 <- .FitVARMxIDCov(
      k = k,
      row = statenames,
      name = "sigma0",
      type = type,
      diag = sigma0_diag,
      fixed = sigma0_fixed,
      d_free = sigma0_d_free,
      d_values = sigma0_d_values,
      d_lbound = sigma0_d_lbound,
      d_ubound = sigma0_d_ubound,
      d_equal = sigma0_d_equal,
      l_free = sigma0_l_free,
      l_values = sigma0_l_values,
      l_lbound = sigma0_l_lbound,
      l_ubound = sigma0_l_ubound
    )
  }
  if (isTRUE(sigma0_fixed)) {
    if (!is.null(type)) {
      if (type == "identity") {
        sigma0$sigma0 <- .MxHelperFullMxMatrix(
          m = k,
          n = k,
          free_val = FALSE,
          values = diag(k),
          lbound_val = NA,
          ubound_val = NA,
          vec = FALSE,
          row = statenames,
          col = statenames,
          name = "sigma0"
        )[["sigma0"]]
      }
    }
  }
  p0_mat <- list(
    p0_mat = OpenMx::mxAlgebraFromString(
      algString = "sigma0",
      name = "P0",
      dimnames = list(
        statenames,
        statenames
      )
    )
  )
  c(
    sigma0,
    p0_mat
  )
}

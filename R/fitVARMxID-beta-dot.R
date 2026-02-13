.FitVARMxIDBeta <- function(k,
                            statenames,
                            beta_fixed,
                            beta_free,
                            beta_values,
                            beta_lbound,
                            beta_ubound,
                            ct) {
  # A
  # auto regression and cross regression coefficients
  if (beta_fixed) {
    beta <- .FitVARMxBetaFixed(
      k = k,
      beta_values = beta_values
    )
  } else {
    beta_values <- tryCatch(
      {
        if (ct) {
          out <- .MxHelperCTVARBetaValues(
            p = k,
            val = beta_values
          )
        } else {
          out <- .MxHelperDTVARBetaValues(
            p = k,
            val = beta_values
          )
        }
        out
      },
      error = function(e) {
        # nocov start
        stop("Error in `beta_values`: ", e$message)
        # nocov end
      },
      warning = function(w) {
        # nocov start
        stop("Warning in `beta_values`: ", w$message)
        # nocov end
      }
    )
    if (is.null(beta_lbound)) {
      beta_lbound <- matrix(
        data = -2.5,
        nrow = k,
        ncol = k
      )
    }
    if (is.null(beta_ubound)) {
      beta_ubound <- matrix(
        data = +2.5,
        nrow = k,
        ncol = k
      )
      if (ct) {
        diag(beta_ubound) <- -1e-05
      }
    }
    beta <- .MxHelperFullMxMatrix(
      m = k,
      n = k,
      values = beta_values,
      free_val = beta_free,
      lbound_val = beta_lbound,
      ubound_val = beta_ubound,
      vec = TRUE,
      row = statenames,
      col = statenames,
      name = "beta"
    )
  }
  a_mat <- list(
    a_mat = OpenMx::mxAlgebraFromString(
      algString = "beta",
      name = "A",
      dimnames = list(
        statenames,
        statenames
      )
    )
  )
  c(
    beta,
    a_mat
  )
}

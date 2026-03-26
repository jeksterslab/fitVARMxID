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
  if (isTRUE(beta_fixed)) {
    beta_free <- FALSE
  }
  m <- k
  n <- k
  values <- beta_values
  free_val <- beta_free
  lbound_val <- beta_lbound
  ubound_val <- beta_ubound
  vec <- TRUE
  row <- statenames
  col <- statenames
  name <- "beta"
  # tryCatch projects values to stability
  values <- tryCatch(
    {
      if (isTRUE(ct)) {
        values <- .MxHelperCTVARBetaValues(
          p = k,
          val = values
        )
      } else {
        values <- .MxHelperDTVARBetaValues(
          p = k,
          val = values
        )
      }
      values
    },
    error = function(e) {
      # nocov start
      stop("\nError in `beta_values`: ", e$message)
      # nocov end
    },
    warning = function(w) {
      # nocov start
      stop("\nWarning in `beta_values`: ", w$message)
      # nocov end
    }
  )
  if (is.null(lbound_val)) {
    if (isTRUE(ct)) {
      lbound_val <- matrix(
        data = NA,
        nrow = m,
        ncol = n
      )
    } else {
      lbound_val <- matrix(
        data = -2.5,
        nrow = m,
        ncol = n
      )
    }
  }
  if (is.null(ubound_val)) {
    if (isTRUE(ct)) {
      ubound_val <- matrix(
        data = NA,
        nrow = m,
        ncol = n
      )
      diag(ubound_val) <- -1e-10
    } else {
      ubound_val <- matrix(
        data = +2.5,
        nrow = m,
        ncol = n
      )
    }
  }
  if (isTRUE(beta_fixed)) {
    # bypass values if beta_values is NULL
    if (is.null(beta_values)) {
      values <- matrix(
        data = 0,
        nrow = m,
        ncol = n
      )
    }
    beta <- .MxHelperFullFixed(
      m = m,
      n = n,
      values = values,
      row = row,
      col = col,
      name = name
    )
  } else {
    beta <- .MxHelperFullMxMatrix(
      m = m,
      n = n,
      values = values,
      free_val = free_val,
      lbound_val = lbound_val,
      ubound_val = ubound_val,
      vec = vec,
      row = row,
      col = col,
      name = name
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

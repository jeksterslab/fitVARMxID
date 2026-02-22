.FitVARMxIDCov <- function(k,
                           row,
                           name,
                           type,
                           diag,
                           fixed,
                           d_free,
                           d_values,
                           d_lbound,
                           d_ubound,
                           d_equal,
                           l_free,
                           l_values,
                           l_lbound,
                           l_ubound) {
  column_name <- paste0(name, "_", "d")
  sdiag_name <- paste0(name, "_", "l")
  iden_name <- "iden_k"
  d_rows <- row
  d_cols <- paste0(name, "_", "d")
  l_rows <- row
  l_cols <- row
  if (isTRUE(diag)) {
    l_values <- matrix(
      data = 0,
      nrow = k,
      ncol = k
    )
  }
  if (isTRUE(fixed)) {
    if (is.null(d_values)) {
      out <- .MxHelperSigmaFixed(
        p = k,
        values = NULL,
        row = row,
        name = name,
        iden_name = iden_name,
        type = type
      )
    } else {
      out <- .MxHelperSigmaFromLDLFixed(
        p = k,
        d_values = d_values,
        l_values = l_values,
        row = row,
        name = name,
        iden_name = iden_name
      )
    }
  } else {
    if (isTRUE(diag)) {
      out <- .MxHelperSigmaDiagFromLDLMxMatrix(
        p = k,
        name = name,
        column_name = column_name,
        d_free = d_free,
        d_values = d_values,
        d_lbound = d_lbound,
        d_ubound = d_ubound,
        d_rows = d_rows,
        d_cols = d_cols,
        d_equal = d_equal
      )
    } else {
      out <- .MxHelperSigmaFromLDLMxMatrix(
        p = k,
        name = name,
        column_name = column_name,
        sdiag_name = sdiag_name,
        iden_name = iden_name,
        d_free = d_free,
        d_values = d_values,
        d_lbound = d_lbound,
        d_ubound = d_ubound,
        d_rows = d_rows,
        d_cols = d_cols,
        d_equal = d_equal,
        l_free = l_free,
        l_values = l_values,
        l_lbound = l_lbound,
        l_ubound = l_ubound,
        l_rows = l_rows,
        l_cols = l_cols
      )
    }
  }
  out
}

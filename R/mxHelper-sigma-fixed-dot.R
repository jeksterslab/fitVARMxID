.MxHelperSigmaFixed <- function(p,
                                values,
                                row,
                                name,
                                iden_name = NULL,
                                type) {
  if (is.null(values)) {
    if (is.null(type)) {
      stop("Argument `type` not provided.")
    }
    scalar <- switch(
      EXPR = type,
      zero = 1e-10,
      identity = 1,
      diffused = 1e10,
      stop("Unknown type: ", type)
    )
    values <- scalar * diag(p)
  }
  ldl <- .MxHelperLDL(x = values)
  column_name <- paste0(name, "_", "d")
  sdiag_name <- paste0(name, "_", "l")
  if (is.null(iden_name)) {
    iden_name <- paste0(name, "_", "iden")
  }
  .MxHelperSigmaFromLDLMxMatrix(
    p = p,
    name = name,
    column_name = column_name,
    sdiag_name = sdiag_name,
    iden_name = iden_name,
    d_free = FALSE,
    d_values = ldl$d_uc,
    d_lbound = NA,
    d_ubound = NA,
    d_rows = row,
    d_cols = column_name,
    d_equal = FALSE,
    l_free = FALSE,
    l_values = ldl$l_mat_strict,
    l_lbound = NA,
    l_ubound = NA,
    l_rows = row,
    l_cols = row
  )
}

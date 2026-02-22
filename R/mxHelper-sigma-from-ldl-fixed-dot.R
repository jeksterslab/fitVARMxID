.MxHelperSigmaFromLDLFixed <- function(p,
                                       d_values,
                                       l_values,
                                       row,
                                       name,
                                       iden_name) {
  if (is.null(d_values) || is.null(l_values)) {
    stop(
      paste(
        "\nColumn and off-diagonal values",
        "for the LDL decompositon required.\n"
      )
    )
  }
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
    d_values = d_values,
    d_lbound = NA,
    d_ubound = NA,
    d_rows = row,
    d_cols = column_name,
    d_equal = FALSE,
    l_free = FALSE,
    l_values = l_values,
    l_lbound = NA,
    l_ubound = NA,
    l_rows = row,
    l_cols = row
  )
}

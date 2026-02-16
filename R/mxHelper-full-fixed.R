.MxHelperFullFixed <- function(m,
                               n,
                               values,
                               row,
                               col,
                               name) {
  if (is.null(values)) {
    values <- matrix(
      data = 0,
      nrow = m,
      ncol = n
    )
  }
  .MxHelperFullMxMatrix(
    m = m,
    n = n,
    free_val = FALSE,
    values = values,
    lbound_val = NA,
    ubound_val = NA,
    vec = FALSE,
    row = row,
    col = col,
    name = name
  )
}

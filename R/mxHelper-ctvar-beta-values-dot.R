.MxHelperCTVARBetaValues <- function(p,
                                     val) {
  if (is.null(val)) {
    val <- matrix(
      data = 0,
      nrow = p,
      ncol = p
    )
    diag(val) <- -0.1
  } else {
    if (is.vector(val)) {
      val <- matrix(
        data = val,
        nrow = p,
        ncol = p
      )
    }
    stopifnot(
      is.matrix(val),
      dim(val) == c(p, p)
    )
  }
  simStateSpace::ProjectToHurwitz(x = val)
}

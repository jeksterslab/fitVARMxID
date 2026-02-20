.RobustSE <- function(model) {
  obj <- inherits(model, "MxModel")
  if (isFALSE(obj)) {
    # nolint start
    return(NULL)
    # nolint end
  }
  utils::capture.output(
    suppressMessages(
      suppressWarnings(
        out <- OpenMx::imxRobustSE(
          model = model,
          details = TRUE
        )
      )
    )
  )
  out
}

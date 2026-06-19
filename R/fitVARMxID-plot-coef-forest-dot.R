.PlotCoefForest <- function(x,
                            drop = NULL) {
  id <- names(x)
  if (is.null(id)) {
    stop("`x` must be a named list. The names are used as IDs.")
  }
  if (!is.null(drop)) {
    drop <- as.character(drop)
    drop_not_found <- setdiff(drop, id)
    if (length(drop_not_found) > 0L) {
      stop(
        "The following IDs in `drop` were not found in `names(x)`: ",
        paste(drop_not_found, collapse = ", ")
      )
    }
    x <- x[!id %in% drop]
  }
  n <- length(x)
  if (n < 1L) {
    stop("No cases remain after applying `drop`.")
  }
  dims <- dim(x[[1]])
  p <- dims[1]
  q <- dims[2]
  id <- names(x)
  param <- rownames(x[[1]])
  get_col <- function(j, k) {
    unlist(
      lapply(
        X = x,
        FUN = function(z) {
          z[j, k]
        }
      ),
      use.names = FALSE
    )
  }
  old_par <- graphics::par(
    mar = c(5, 9, 1, 2) + 0.1
  )
  on.exit(graphics::par(old_par), add = TRUE)
  lapply(
    X = seq_len(p),
    FUN = function(j) {
      estimates <- get_col(j, 1)
      ci_lower <- get_col(j, q - 1)
      ci_upper <- get_col(j, q)
      y_pos <- rev(seq_len(n))
      x_limits <- range(
        c(ci_lower, ci_upper),
        finite = TRUE
      )
      x_padding <- 0.08 * diff(x_limits)
      if (x_padding == 0) {
        x_padding <- 1
      }
      x_limits <- x_limits + c(-x_padding, x_padding)
      graphics::plot(
        x = estimates,
        y = y_pos,
        type = "n",
        xlim = x_limits,
        ylim = c(0.5, n + 0.5),
        xlab = param[j],
        ylab = "",
        yaxt = "n"
      )
      graphics::axis(
        side = 2,
        at = y_pos,
        labels = id,
        las = 1,
        tick = FALSE
      )
      graphics::segments(
        x0 = ci_lower,
        y0 = y_pos,
        x1 = ci_upper,
        y1 = y_pos,
        col = "gray",
        lty = 2
      )
      graphics::points(
        x = estimates,
        y = y_pos,
        pch = 19,
        cex = 0.6
      )
    }
  )
  invisible(NULL)
}

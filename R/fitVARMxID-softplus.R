#' Softplus and Inverse Softplus Transformations
#'
#' The softplus transformation maps unconstrained real values to the
#' positive real line. This is useful when parameters (e.g., variances)
#' must be positive. The inverse softplus transformation
#' recovers the unconstrained value from a strictly positive input.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param x Numeric vector or matrix.
#'   Input values to be transformed.
#'
#' @return
#' - `Softplus()`: numeric vector or matrix of nonnegative values
#'   (mathematically strictly positive for finite inputs, but can underflow
#'   to 0 for very negative values).
#' - `InvSoftplus()`: numeric vector or matrix of unconstrained values.
#'
#' @details
#' Mathematical definitions:
#' - `Softplus(x) = log(1 + exp(x))`
#' - `InvSoftplus(x) = log(exp(x) - 1)`
#'
#' Numerical implementation (stable forms):
#' - `Softplus(x) = max(x, 0) + log1p(exp(-abs(x)))`
#' - `InvSoftplus(y)` uses `log(expm1(y))`, and for large `y` uses the rewrite
#'   `y + log1p(-exp(-y))` for stability.
#'
#' For numerical stability, these functions use `log1p()` and `expm1()`
#' internally. `InvSoftplus()` requires strictly positive input and will
#' error if any values are `<= 0`.
#'
#' @examples
#' # Apply softplus to unconstrained values
#' x <- c(-5, 0, 5)
#' y <- Softplus(x)
#'
#' # Recover unconstrained values
#' x_recovered <- InvSoftplus(y)
#'
#' y
#' x_recovered
#'
#' @family VAR Functions
#' @keywords fitVARMxID misc
#' @name Softplus
NULL

#' @rdname Softplus
#' @export
Softplus <- function(x) {
  .MxHelperSoftplus(
    x = x
  )
}

#' @rdname Softplus
#' @export
InvSoftplus <- function(x) {
  .MxHelperInvSoftplus(
    x = x
  )
}

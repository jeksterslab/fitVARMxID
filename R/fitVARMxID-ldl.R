#' LDL' Decomposition of a Symmetric Positive-Definite Matrix
#'
#' Performs an LDL' factorization of a symmetric positive-definite
#' matrix \eqn{X}, such that
#' \deqn{X = L D L^\top,}
#' where \eqn{L} is unit lower-triangular (ones on the diagonal)
#' and \eqn{D} is diagonal.
#'
#' @param x Numeric matrix.
#'   Must be symmetric positive-definite.
#' @param epsilon Numeric.
#'   Small positive value used to replace zero diagonal entries.
#' @param s_l Matrix.
#'   Strictly lower-triangular part of \eqn{L}.
#' @param uc_d Vector.
#'   Unconstrained vector with \eqn{log1p(exp(uc\_d)) = d}.
#'
#' @details
#' `LDL()` returns both the unit lower-triangular factor \eqn{L}
#' and the diagonal factor \eqn{D}.
#' The strictly lower-triangular part of \eqn{L} is also provided
#' for convenience. The function additionally computes an unconstrained
#' vector `uc_d` such that `softplus(uc_d) = d`, using
#' \eqn{\mathrm{softplus}^{-1}(y) = \log(\exp(y) - 1)} for stable
#' back-transformation.
#' `InvLDL()` returns a symmetric positive definite matrix
#' from the strictly lower-triangular part of \eqn{L}
#' and the unconstrained vector `uc_d`.
#'
#' @return
#' - `LDL()`: a list with components:
#'    - `l`: a unit lower-triangular matrix \eqn{L}
#'    - `s_l`: a strictly lower-triangular part of \eqn{L}
#'    - `d`: a vector of diagonal entries of \eqn{D}
#'    - `uc_d`: unconstrained vector with
#'       \eqn{\mathrm{softplus}(uc\_d) = d}
#'    - `x`: input matrix
#' - `InvLDL()`: a symmetric positive definite matrix
#'
#' @examples
#' set.seed(123)
#' x <- crossprod(matrix(rnorm(16), 4, 4)) + diag(1e-6, 4)
#' ldl <- LDL(x = x)
#' ldl
#' inv_ldl <- InvLDL(s_l = ldl$s_l, uc_d = ldl$uc_d)
#' inv_ldl
#' max(abs(x - inv_ldl))
#'
#' @family VAR Functions
#' @keywords fitVARMxID misc
#' @name LDL
NULL

#' @rdname LDL
#' @export
LDL <- function(x,
                epsilon = 1e-10) {
  .MxHelperLDL(
    x = x,
    epsilon = epsilon
  )
}

#' @rdname LDL
#' @export
InvLDL <- function(s_l,
                   uc_d) {
  .MxHelperInvLDL(
    s_l = s_l,
    uc_d = uc_d
  )
}

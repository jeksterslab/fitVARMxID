#' LDL' Decomposition of a Symmetric Positive-Definite Matrix
#'
#' Performs an LDL' factorization of a symmetric positive-definite
#' matrix \eqn{X}, such that
#' \deqn{X = L D L^\prime,}
#' where \eqn{L} is unit lower-triangular (ones on the diagonal)
#' and \eqn{D} is diagonal.
#'
#' @param x Numeric matrix.
#'   Assumed symmetric positive-definite (not checked).
#'   Note: `LDL()` may error if the implied diagonal entries of \eqn{D}
#'   are not strictly positive.
#' @param epsilon Numeric.
#'   Small positive value used to replace *exactly zero* diagonal entries
#'   of `x` prior to factorization.
#' @param s_l Matrix.
#'   Strictly lower-triangular part of \eqn{L}. In `InvLDL()`, only the
#'   strictly lower triangle is used (upper triangle and diagonal are ignored).
#' @param uc_d Vector.
#'   Unconstrained vector such that `Softplus(uc_d) = d`, where `d`
#'   are the diagonal entries of \eqn{D}.
#'
#' @details
#' `LDL()` returns both the unit lower-triangular factor \eqn{L}
#' and the diagonal factor \eqn{D}.
#' The strictly lower-triangular part of \eqn{L} is also provided
#' for convenience.
#' The function additionally computes an unconstrained vector `uc_d`
#' such that `Softplus(uc_d) = d`. This uses a numerically stable inverse
#' softplus implementation based on `log(expm1(d))` (and a large-`d` rewrite),
#' rather than the unstable expression \eqn{\log(\exp(d) - 1)}.
#'
#' `InvLDL()` returns a symmetric positive definite matrix
#' from the strictly lower-triangular part of \eqn{L}
#' and the unconstrained vector `uc_d`. The reconstructed matrix is
#' symmetrized as \eqn{(\Sigma + \Sigma^\prime)/2} to reduce numerical
#' asymmetry.
#'
#' @return
#' - `LDL()`: a list with components:
#'    - `l`: a unit lower-triangular matrix \eqn{L}
#'    - `s_l`: a strictly lower-triangular part of \eqn{L}
#'    - `d`: a vector of diagonal entries of \eqn{D}
#'    - `uc_d`: unconstrained vector with
#'       \eqn{\mathrm{softplus}(uc\_d) = d}
#'    - `x`: input matrix (with diagonal zeros possibly replaced by `epsilon`)
#'    - `epsilon`: the `epsilon` value used
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

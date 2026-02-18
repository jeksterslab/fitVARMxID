#' Print Method for Object of Class `varmxid`
#'
#' @author Ivan Jacob Agaloos Pesigan
#' @param x an object of class `varmxid`.
#' @param means Logical.
#'   If `means = TRUE`, return means.
#'   Otherwise, the function returns raw estimates.
#' @param digits Integer indicating the number of decimal places to display.
#' @param ... further arguments.
#' @inheritParams coef.varmxid
#' @inheritParams converged.varmxid
#' @return Prints means or raw estimates
#'   depending the the value of the argument `means`.
#'
#' @method print varmxid
#' @keywords methods
#' @import OpenMx
#' @export
print.varmxid <- function(x,
                          means = FALSE,
                          mu = TRUE,
                          alpha = TRUE,
                          beta = TRUE,
                          nu = TRUE,
                          psi = TRUE,
                          theta = TRUE,
                          var_metric = "var",
                          converged = TRUE,
                          vanishing_theta = TRUE,
                          theta_tol = 0.001,
                          prop = FALSE,
                          grad_tol = 1e-2,
                          hess_tol_abs = 1e-8,
                          hess_tol_rel = 1e-10,
                          check_condition = FALSE,
                          cond_max = 1e12,
                          abs_bnd_tol = 1e-6,
                          rel_bnd_tol = 1e-4,
                          ok_codes = 0L,
                          require_finite_fit = TRUE,
                          digits = 4,
                          ...) {
  print.summary.varmxid(
    summary.varmxid(
      object = x,
      means = means,
      mu = mu,
      alpha = alpha,
      beta = beta,
      nu = nu,
      psi = psi,
      theta = theta,
      var_metric = var_metric,
      converged = converged,
      vanishing_theta = vanishing_theta,
      theta_tol = theta_tol,
      digits = digits
    )
  )
}

#' Summary Method for Object of Class `varmxid`
#'
#' @author Ivan Jacob Agaloos Pesigan
#' @param object an object of class `varmxid`.
#' @param means Logical.
#'   If `means = TRUE`, return means.
#'   Otherwise, the function returns raw estimates.
#' @param digits Integer indicating the number of decimal places to display.
#' @param ... further arguments.
#' @inheritParams coef.varmxid
#' @inheritParams converged.varmxid
#' @return Returns means or raw estimates
#'   depending the the value of the argument `means`.
#'
#' @method summary varmxid
#' @keywords methods
#' @import OpenMx
#' @export
summary.varmxid <- function(object,
                            means = FALSE,
                            mu = TRUE,
                            alpha = TRUE,
                            beta = TRUE,
                            nu = TRUE,
                            psi = TRUE,
                            theta = TRUE,
                            var_metric = "var",
                            converged = TRUE,
                            vanishing_theta = TRUE,
                            theta_tol = 0.001,
                            prop = FALSE,
                            grad_tol = 1e-2,
                            hess_tol_abs = 1e-8,
                            hess_tol_rel = 1e-10,
                            check_condition = FALSE,
                            cond_max = 1e12,
                            abs_bnd_tol = 1e-6,
                            rel_bnd_tol = 1e-4,
                            ok_codes = 0L,
                            require_finite_fit = TRUE,
                            digits = 4,
                            ...) {
  converged_prop <- converged.varmxid(
    object = object,
    vanishing_theta = vanishing_theta,
    theta_tol = theta_tol,
    prop = TRUE,
    grad_tol = grad_tol,
    hess_tol_abs = hess_tol_abs,
    check_condition = check_condition,
    cond_max = cond_max,
    abs_bnd_tol = abs_bnd_tol,
    rel_bnd_tol = rel_bnd_tol,
    ok_codes = ok_codes,
    require_finite_fit = require_finite_fit
  )
  out <- do.call(
    what = "rbind",
    args = coef.varmxid(
      object = object,
      mu = mu,
      alpha = alpha,
      beta = beta,
      nu = nu,
      psi = psi,
      theta = theta,
      var_metric = var_metric,
      converged = converged,
      vanishing_theta = vanishing_theta,
      theta_tol = theta_tol,
      ...
    )
  )
  if (isTRUE(means)) {
    out <- colMeans(out)
  }
  print_summary <- round(
    x = out,
    digits = digits
  )
  class(out) <- c(
    "summary.varmxid",
    class(out)
  )
  attr(out, "fit") <- object
  attr(out, "means") <- means
  attr(out, "mu") <- mu
  attr(out, "alpha") <- alpha
  attr(out, "beta") <- beta
  attr(out, "nu") <- nu
  attr(out, "psi") <- psi
  attr(out, "theta") <- theta
  attr(out, "var_metric") <- var_metric
  attr(out, "converged") <- converged
  attr(out, "vanishing_theta") <- vanishing_theta
  attr(out, "theta_tol") <- theta_tol
  attr(out, "digits") <- digits
  attr(out, "converged_prop") <- converged_prop
  attr(out, "print_summary") <- print_summary
  out
}

#' @noRd
#' @keywords internal
#' @exportS3Method print summary.varmxid
print.summary.varmxid <- function(x,
                                  ...) {
  print_summary <- attr(
    x = x,
    which = "print_summary"
  )
  means <- attr(
    x = x,
    which = "means"
  )
  object <- attr(
    x = x,
    which = "fit"
  )
  converged_prop <- attr(
    x = x,
    which = "converged_prop"
  )
  cat("Call:\n")
  base::print(object$call)
  cat(sprintf("\nConvergence: %.1f%%\n", converged_prop * 100))
  if (isTRUE(means)) {
    cat("\nMeans of the estimated paramaters per individual.\n")
  } else {
    cat("\nEstimated paramaters per individual.\n")
  }
  print(print_summary)
  invisible(x)
}

#' Parameter Estimates
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param object Object of class `varmxid`.
#' @param mu Logical.
#'   If `mu = TRUE`,
#'   include estimates of the `mu` vector, if available.
#'   If `mu = FALSE`,
#'   exclude estimates of the `mu` vector.
#' @param alpha Logical.
#'   If `alpha = TRUE`,
#'   include estimates of the `alpha` vector, if available.
#'   If `alpha = FALSE`,
#'   exclude estimates of the `alpha` vector.
#' @param beta Logical.
#'   If `beta = TRUE`,
#'   include estimates of the `beta` matrix, if available.
#'   If `beta = FALSE`,
#'   exclude estimates of the `beta` matrix.
#' @param nu Logical.
#'   If `nu = TRUE`,
#'   include estimates of the `nu` vector, if available.
#'   If `nu = FALSE`,
#'   exclude estimates of the `nu` vector.
#' @param psi Logical.
#'   If `psi = TRUE`,
#'   include estimates of the `psi` matrix, if available.
#'   If `psi = FALSE`,
#'   exclude estimates of the `psi` matrix.
#' @param theta Logical.
#'   If `theta = TRUE`,
#'   include estimates of the `theta` matrix, if available.
#'   If `theta = FALSE`,
#'   exclude estimates of the `theta` matrix.
#' @param converged Logical.
#'   Only include converged cases.
#' @param var_metric Character string.
#'   If `var_metric = "var"`,
#'   `psi` and `theta`
#'   are in the original variance/covariance metric.
#'   If `var_metric = "logvar"`,
#'   the diagonal elements of `psi` and `theta`
#'   are the log of the variances
#'   and the off-diagonal elements correspond to strict `L`
#'   in the `LDL'` decomposition.
#'   If `var_metric = "softplusvar"`,
#'   the diagonal elements of `psi` and `theta`
#'   are the softplus of the variances
#'   and the off-diagonal elements correspond to strict `L`
#'   in the `LDL'` decomposition.
#' @param ... additional arguments.
#' @inheritParams converged.varmxid
#' @return Returns a list of vectors of parameter estimates.
#'
#' @method coef varmxid
#' @keywords methods
#' @import OpenMx
#' @export
coef.varmxid <- function(object,
                         mu = TRUE,
                         alpha = TRUE,
                         beta = TRUE,
                         nu = TRUE,
                         psi = TRUE,
                         theta = TRUE,
                         var_metric = "var",
                         converged = TRUE,
                         vanishing_theta = TRUE,
                         theta_tol = 0.001,
                         prop = FALSE,
                         grad_tol = 1e-2,
                         hess_tol_abs = 1e-8,
                         hess_tol_rel = 1e-10,
                         check_condition = FALSE,
                         cond_max = 1e12,
                         abs_bnd_tol = 1e-6,
                         rel_bnd_tol = 1e-4,
                         ok_codes = 0L,
                         require_finite_fit = TRUE,
                         ...) {
  fit <- object$output
  if (isTRUE(converged)) {
    fit <- fit[
      which(
        converged.varmxid(
          object = object,
          vanishing_theta = vanishing_theta,
          theta_tol = theta_tol,
          prop = FALSE,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit
        )
      )
    ]
  }
  coefs <- OpenMx::mxEvalByName(
    name = "parameter_vec",
    model = fit[[1]],
    compute = TRUE
  )
  parnames <- rownames(
    coefs
  )
  idx <- integer(0)
  if (isTRUE(mu)) {
    idx <- c(
      idx,
      grep(
        pattern = "^mu",
        x = parnames
      )
    )
  }
  if (isTRUE(alpha)) {
    idx <- c(
      idx,
      grep(
        pattern = "^alpha",
        x = parnames
      )
    )
  }
  if (isTRUE(beta)) {
    idx <- c(
      idx,
      grep(
        pattern = "^beta",
        x = parnames
      )
    )
  }
  if (isTRUE(psi)) {
    idx <- c(
      idx,
      grep(
        pattern = "^psi",
        x = parnames
      )
    )
  }
  if (isTRUE(nu)) {
    idx <- c(
      idx,
      grep(
        pattern = "^nu",
        x = parnames
      )
    )
  }
  if (isTRUE(theta)) {
    idx <- c(
      idx,
      grep(
        pattern = "^theta",
        x = parnames
      )
    )
  }
  lapply(
    X = fit,
    FUN = function(i) {
      if (var_metric[1] == "var") {
        out <- OpenMx::mxEvalByName(
          name = "parameter_vec",
          model = i,
          compute = TRUE
        )
      }
      if (var_metric[1] == "logvar") {
        out <- OpenMx::mxEvalByName(
          name = "parameter_log_diag_vec",
          model = i,
          compute = TRUE
        )
      }
      if (var_metric[1] == "softplusvar") {
        out <- OpenMx::mxEvalByName(
          name = "parameter_softplus_diag_vec",
          model = i,
          compute = TRUE
        )
      }
      out <- c(out[idx])
      names(out) <- parnames[idx]
      out
    }
  )
}

#' Sampling Covariance Matrix of the Parameter Estimates
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param vanishing_theta Logical.
#'   Test for measurement error variance going to zero
#'   if `converged = TRUE`.
#' @param theta_tol Numeric.
#'   Tolerance for vanishing theta test
#'   if `converged` and `theta_tol` are `TRUE`.
#' @param robust Logical.
#'   If `TRUE`, use robust (sandwich) sampling variance-covariance matrix.
#'   If `FALSE`, use normal theory sampling variance-covariance matrix.
#' @inheritParams coef.varmxid
#' @inheritParams converged.varmxid
#' @param ... additional arguments.
#' @return Returns a list of sampling variance-covariance matrices.
#'
#' @method vcov varmxid
#' @keywords methods
#' @import OpenMx
#' @export
vcov.varmxid <- function(object,
                         mu = TRUE,
                         alpha = TRUE,
                         beta = TRUE,
                         nu = TRUE,
                         psi = TRUE,
                         theta = TRUE,
                         var_metric = "var",
                         converged = TRUE,
                         vanishing_theta = TRUE,
                         theta_tol = 0.001,
                         prop = FALSE,
                         grad_tol = 1e-2,
                         hess_tol_abs = 1e-8,
                         hess_tol_rel = 1e-10,
                         check_condition = FALSE,
                         cond_max = 1e12,
                         abs_bnd_tol = 1e-6,
                         rel_bnd_tol = 1e-4,
                         ok_codes = 0L,
                         require_finite_fit = TRUE,
                         robust = FALSE,
                         ...) {
  fit <- object$output
  if (isTRUE(converged)) {
    fit <- fit[
      which(
        converged.varmxid(
          object = object,
          vanishing_theta = vanishing_theta,
          theta_tol = theta_tol,
          prop = FALSE,
          grad_tol = grad_tol,
          hess_tol_abs = hess_tol_abs,
          check_condition = check_condition,
          cond_max = cond_max,
          abs_bnd_tol = abs_bnd_tol,
          rel_bnd_tol = rel_bnd_tol,
          ok_codes = ok_codes,
          require_finite_fit = require_finite_fit
        )
      )
    ]
  }
  if (isTRUE(robust)) {
    if (is.null(object$robust)) {
      fit <- lapply(
        X = fit,
        FUN = function(i) {
          utils::capture.output(
            suppressMessages(
              suppressWarnings(
                sandwich <- OpenMx::imxRobustSE(
                  model = i,
                  details = TRUE
                )
              )
            )
          )
          i@output$vcov <- sandwich$cov
          i@output$standardErrors <- sandwich$SE
          i
        }
      )
    } else {
      fit <- mapply(
        FUN = function(i,
                       sandwich) {
          i@output$vcov <- sandwich$cov
          i@output$standardErrors <- sandwich$SE
          i
        },
        i = fit,
        sandwich = object$robust
      )
    }
  }
  coefs <- OpenMx::mxEvalByName(
    name = "parameter_vec",
    model = fit[[1]],
    compute = TRUE
  )
  parnames <- rownames(
    coefs
  )
  idx <- integer(0)
  if (isTRUE(mu)) {
    idx <- c(
      idx,
      grep(
        pattern = "^mu",
        x = parnames
      )
    )
  }
  if (isTRUE(alpha)) {
    idx <- c(
      idx,
      grep(
        pattern = "^alpha",
        x = parnames
      )
    )
  }
  if (isTRUE(beta)) {
    idx <- c(
      idx,
      grep(
        pattern = "^beta",
        x = parnames
      )
    )
  }
  if (isTRUE(psi)) {
    idx <- c(
      idx,
      grep(
        pattern = "^psi",
        x = parnames
      )
    )
  }
  if (isTRUE(nu)) {
    idx <- c(
      idx,
      grep(
        pattern = "^nu",
        x = parnames
      )
    )
  }
  if (isTRUE(theta)) {
    idx <- c(
      idx,
      grep(
        pattern = "^theta",
        x = parnames
      )
    )
  }
  lapply(
    X = fit,
    FUN = function(i) {
      if (var_metric[1] == "var") {
        out <- OpenMx::mxSE(
          x = "parameter_vec",
          model = i,
          details = TRUE,
          silent = TRUE
        )$Cov
      }
      if (var_metric[1] == "logvar") {
        out <- OpenMx::mxSE(
          x = "parameter_log_diag_vec",
          model = i,
          details = TRUE,
          silent = TRUE
        )$Cov
      }
      if (var_metric[1] == "softplusvar") {
        out <- OpenMx::mxSE(
          x = "parameter_softplus_diag_vec",
          model = i,
          details = TRUE,
          silent = TRUE
        )$Cov
      }
      out
      out <- out[idx, idx]
      colnames(out) <- rownames(out) <- parnames[idx]
      out
    }
  )
}

#' Check Model Convergence
#'
#' Determines whether each fitted \pkg{OpenMx} model in a `varmxid` object
#' meets convergence criteria based on (a) acceptable optimizer status and
#' gradient size, (b) a positive-definite Hessian, (c) parameters not being
#' at their bounds, and (optionally) non-vanishing measurement error
#' variances (`theta`).
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param object A fit object.
#' @param ... Passed to and/or used by methods.
#'
#' @keywords methods
#' @import OpenMx
#' @export
converged <- function(object,
                      ...) {
  UseMethod("converged")
}

#' @rdname converged
#' @param vanishing_theta Logical.
#'   Test for measurement error variance going to zero
#'   if `converged = TRUE`.
#' @param theta_tol Numeric.
#'   Tolerance for vanishing theta test
#'   if `converged` and `theta_tol` are `TRUE`.
#' @param grad_tol Numeric. Tolerance for the gradient-based convergence check.
#' @param hess_tol_abs Numeric. Absolute tolerance used when checking whether
#'   the Hessian is positive-definite.
#' @param hess_tol_rel Numeric. Relative tolerance used when checking whether
#'   the Hessian is positive-definite.
#' @param check_condition Logical. If `TRUE`, also check the Hessian condition
#'   number as part of the Hessian diagnostics.
#' @param cond_max Numeric. Maximum allowed condition number for the Hessian
#'   when `check_condition = TRUE`.
#' @param abs_bnd_tol Numeric. Absolute tolerance for detecting whether a
#'   parameter is at its lower or upper bound.
#' @param rel_bnd_tol Numeric. Relative tolerance for detecting whether a
#'   parameter is at its lower or upper bound.
#' @param ok_codes Integer vector. Optimizer status codes that are considered
#'   acceptable.
#' @param require_finite_fit Logical. If `TRUE`, require a finite objective
#'   value (fit) as part of the convergence check.
#' @param prop Logical.
#'   If `prop = FALSE`, a named logical vector indicating,
#'   for each individual fit, whether the convergence criteria are met.
#'   If `prop = TRUE`, the proportion of cases that converged.
#' @inheritParams coef.varmxid
#'
#' @return For the `varmxid` method:
#'   If `prop = FALSE`, a named logical vector indicating,
#'   for each individual fit, whether the convergence criteria are met.
#'   If `prop = TRUE`, the proportion of cases that converged.
#'
#' @method converged varmxid
#' @import OpenMx
#' @export
converged.varmxid <- function(object,
                              vanishing_theta = TRUE,
                              theta_tol = 0.001,
                              prop = FALSE,
                              grad_tol = 1e-2,
                              hess_tol_abs = 1e-8,
                              hess_tol_rel = 1e-10,
                              check_condition = FALSE,
                              cond_max = 1e12,
                              abs_bnd_tol = 1e-6,
                              rel_bnd_tol = 1e-4,
                              ok_codes = 0L,
                              require_finite_fit = TRUE,
                              ...) {
  if (is.null(object$output)) {
    out <- FALSE
    if (isTRUE(prop)) {
      out <- as.numeric(out)
    }
    # nolint start
    return(out)
    # nolint end
  }

  out <- vapply(
    X = object$output,
    FUN = function(i) {
      if (!inherits(i, "MxModel")) {
        # nolint start
        return(FALSE)
        # nolint end
      }

      has_coef <- tryCatch(
        {
          tmp <- stats::coef(i)
          !is.null(tmp)
        },
        error = function(e) {
          FALSE
        }
      )
      if (isFALSE(has_coef)) {
        # nolint start
        return(FALSE)
        # nolint end
      }

      good_fit <- tryCatch(
        {
          .MxHelperIsGoodFit(
            x = i,
            grad_tol = grad_tol,
            ok_codes = ok_codes,
            require_finite_fit = require_finite_fit
          )
        },
        error = function(e) {
          FALSE
        }
      )
      if (!isTRUE(good_fit)) {
        # nolint start
        return(FALSE)
        # nolint end
      }

      pd_hessian <- tryCatch(
        {
          .MxHelperHasPdHessian(
            x = i,
            hess_tol_abs = hess_tol_abs,
            hess_tol_rel = hess_tol_rel,
            check_condition = check_condition,
            cond_max = cond_max
          )
        },
        error = function(e) {
          FALSE
        }
      )
      if (!isTRUE(pd_hessian)) {
        # nolint start
        return(FALSE)
        # nolint end
      }

      bd_any <- tryCatch(
        {
          isTRUE(
            .MxHelperAtBounds(
              x = i,
              abs_bnd_tol = abs_bnd_tol,
              rel_bnd_tol = rel_bnd_tol
            )$any
          )
        },
        error = function(e) {
          TRUE
        }
      )
      if (isTRUE(bd_any)) {
        # nolint start
        return(FALSE)
        # nolint end
      }

      if (!isTRUE(vanishing_theta)) {
        # nolint start
        return(TRUE)
        # nolint end
      }

      parnames <- tryCatch(
        {
          names(stats::coef(i))
        },
        error = function(e) {
          character(0)
        }
      )

      has_theta <- any(
        grepl(
          "^theta_",
          parnames,
          perl = TRUE
        )
      )
      if (!isTRUE(has_theta)) {
        # nolint start
        return(TRUE)
        # nolint end
      }

      theta_diag <- tryCatch(
        {
          diag(
            OpenMx::mxEvalByName(
              name = "theta",
              model = i
            )
          )
        },
        error = function(e) {
          numeric(0)
        }
      )

      if (length(theta_diag) == 0L) {
        # nolint start
        return(TRUE)
        # nolint end
      }

      isTRUE(all(theta_diag > theta_tol, na.rm = TRUE))
    },
    FUN.VALUE = logical(1)
  )

  if (isTRUE(prop)) {
    out <- mean(out)
  }

  out
}

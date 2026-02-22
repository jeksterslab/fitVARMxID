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
                            digits = 4,
                            ncores = NULL,
                            ...) {
  convergence <- converged.varmxid(
    object = object,
    prop = FALSE
  )
  converged_prop <- mean(convergence)
  if (converged_prop < 1) {
    convergence_issues <- names(
      convergence[!convergence]
    )
    convergence_issues <- sub(
      pattern = "^(CTVAR_ID|DTVAR_ID)",
      replacement = "",
      x = convergence_issues
    )
  } else {
    convergence_issues <- NULL
  }
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
      ncores = ncores
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
  attr(out, "digits") <- digits
  attr(out, "converged_prop") <- converged_prop
  attr(out, "convergence_issues") <- convergence_issues
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
  convergence_issues <- attr(
    x = x,
    which = "convergence_issues"
  )
  cat("Call:\n")
  base::print(object$call)
  cat(sprintf("\nConvergence:\n%.1f%%\n", converged_prop * 100))
  if (isFALSE(is.null(convergence_issues))) {
    convergence_issues <- paste(
      convergence_issues,
      collapse = " "
    )
    cat(
      paste0(
        "\nCases with the following IDs did not converge:\n",
        convergence_issues,
        "\n"
      )
    )
  }
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
#' @param ncores Positive integer.
#'   Number of cores to use.
#' @param ... additional arguments.
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
                         ncores = NULL,
                         ...) {
  threads <- OpenMx::mxOption(
    key = "Number of Threads"
  )
  on.exit(
    OpenMx::mxOption(
      key = "Number of Threads",
      value = threads
    ),
    add = TRUE
  )
  fit <- object$output[object$converged]
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
  if (is.null(ncores)) {
    ncores <- 1L
  } else {
    ncores <- min(
      as.integer(ncores),
      parallel::detectCores(),
      length(fit)
    )
  }
  if (ncores > 1) {
    # nocov start
    OpenMx::mxOption(
      key = "Number of Threads",
      value = 1
    )
    os_type <- Sys.info()["sysname"]
    if (os_type == "Darwin") {
      fork <- TRUE
    } else if (os_type == "Linux") {
      fork <- TRUE
    } else {
      fork <- FALSE
    }
    # nocov end
  }
  foo <- function(i) {
    out <- OpenMx::mxEvalByName(
      name = "parameter_vec",
      model = i,
      compute = TRUE
    )
    out <- c(out[idx])
    names(out) <- parnames[idx]
    out
  }
  if (ncores > 1) {
    # nocov start
    if (fork) {
      out <- parallel::mclapply(
        X = fit,
        FUN = foo,
        mc.cores = ncores
      )
    } else {
      cl <- parallel::makeCluster(ncores)
      parallel::clusterEvalQ(cl = cl, library(OpenMx))
      on.exit(
        parallel::stopCluster(cl = cl),
        add = TRUE
      )
      out <- parallel::parLapply(
        cl = cl,
        X = fit,
        fun = foo
      )
    }
    # nocov end
  } else {
    out <- lapply(
      X = fit,
      FUN = foo
    )
  }
  out
}

#' Sampling Covariance Matrix of the Parameter Estimates
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param robust Logical.
#'   If `TRUE`, use robust (sandwich) sampling variance-covariance matrix.
#'   If `FALSE`, use normal theory sampling variance-covariance matrix.
#' @inheritParams coef.varmxid
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
                         robust = FALSE,
                         ncores = NULL,
                         ...) {
  threads <- OpenMx::mxOption(
    key = "Number of Threads"
  )
  on.exit(
    OpenMx::mxOption(
      key = "Number of Threads",
      value = threads
    ),
    add = TRUE
  )
  fit <- object$output[object$converged]
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
  if (is.null(ncores)) {
    ncores <- 1L
  } else {
    ncores <- min(
      as.integer(ncores),
      parallel::detectCores(),
      length(fit)
    )
  }
  if (ncores > 1) {
    # nocov start
    OpenMx::mxOption(
      key = "Number of Threads",
      value = 1
    )
    os_type <- Sys.info()["sysname"]
    if (os_type == "Darwin") {
      fork <- TRUE
    } else if (os_type == "Linux") {
      fork <- TRUE
    } else {
      fork <- FALSE
    }
    # nocov end
  }
  if (ncores > 1) {
    # nocov start
    if (fork) {
      if (isTRUE(robust)) {
        if (is.null(object$robust)) {
          fit <- parallel::mclapply(
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
            },
            mc.cores = ncores
          )
        } else {
          fit <- mapply(
            FUN = function(i,
                           sandwich) {
              i@output$vcov <- sandwich$cov
              i@output$standardErrors <- sandwich$SE
              i
            },
            SIMPLIFY = FALSE,
            i = fit,
            sandwich = object$robust
          )
        }
      }
      out <- parallel::mclapply(
        X = fit,
        FUN = function(i) {
          out <- OpenMx::mxSE(
            x = "parameter_vec",
            model = i,
            details = TRUE,
            silent = TRUE
          )$Cov
          out <- out[idx, idx]
          colnames(out) <- rownames(out) <- parnames[idx]
          out
        },
        mc.cores = ncores
      )
    } else {
      cl <- parallel::makeCluster(ncores)
      parallel::clusterEvalQ(cl = cl, library(OpenMx))
      on.exit(
        parallel::stopCluster(cl = cl),
        add = TRUE
      )
      if (isTRUE(robust)) {
        if (is.null(object$robust)) {
          fit <- parallel::parLapply(
            cl = cl,
            X = fit,
            fun = function(i) {
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
            },
            mc.cores = ncores
          )
        } else {
          fit <- mapply(
            FUN = function(i,
                           sandwich) {
              i@output$vcov <- sandwich$cov
              i@output$standardErrors <- sandwich$SE
              i
            },
            SIMPLIFY = FALSE,
            i = fit,
            sandwich = object$robust
          )
        }
      }
      out <- parallel::parLapply(
        cl = cl,
        X = fit,
        fun = function(i) {
          out <- OpenMx::mxSE(
            x = "parameter_vec",
            model = i,
            details = TRUE,
            silent = TRUE
          )$Cov
          out <- out[idx, idx]
          colnames(out) <- rownames(out) <- parnames[idx]
          out
        }
      )
    }
    # nocov end
  } else {
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
          SIMPLIFY = FALSE,
          i = fit,
          sandwich = object$robust
        )
      }
    }
    out <- lapply(
      X = fit,
      FUN = function(i) {
        out <- OpenMx::mxSE(
          x = "parameter_vec",
          model = i,
          details = TRUE,
          silent = TRUE
        )$Cov
        out <- out[idx, idx]
        colnames(out) <- rownames(out) <- parnames[idx]
        out
      }
    )
  }
  out
}

#' Check Model Convergence
#'
#' Determines whether each fitted \pkg{OpenMx} model in a `varmxid` object
#' meets convergence criteria based on (a) acceptable optimizer status and
#' gradient size, (b) a positive-definite Hessian, and (c) parameters not being
#' at their bounds.
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
#' @param prop Logical.
#'   If `prop = FALSE`, a named logical vector indicating,
#'   for each individual fit, whether the convergence criteria are met.
#'   If `prop = TRUE`, the proportion of cases that converged.
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
                              prop = FALSE,
                              ...) {
  converged <- object$converged
  if (isTRUE(prop)) {
    converged <- mean(converged)
  }
  converged
}

#' Fit First-Order Vector Autoregressive Models by ID and Save Results
#'
#' Fits a first-order vector autoregressive model separately for each unit ID
#' and saves each individual fitted model object to an \file{.Rds} file.
#' This function fits the same individual-level models as [FitVARMxID()], but
#' saves each individual fit to disk. For each unique value of `id`, the model
#' is fit using the corresponding subset of `data`. The fitted object for that
#' ID is saved to `path` with file name `prefix_id.Rds`, where `id` is replaced
#' by the unit ID value.
#' The value added by `FitVARMxIDSave()` is that the individual fits are
#' persisted to disk while the function still returns a collated object of
#' class `varmxid`, similar to the object returned by [FitVARMxID()].
#'
#' @inheritParams FitVARMxID
#' @param path Character string.
#'   Path to the directory where the individual fitted model objects are saved.
#'   The directory must already exist.
#' @param prefix Character string.
#'   Prefix used for the saved file names.
#'   Files are saved as `prefix_id.Rds`.
#' @param overwrite Logical.
#'   If `TRUE`, existing saved fitted model objects from a previous run are
#'   overwritten. If `FALSE`, existing files are left unchanged and are read
#'   from disk instead.
#'
#' @return Returns an object of class `varmxid`, with the same general
#'   structure as [FitVARMxID()]. The object collates the individual saved
#'   fits and contains:
#'   \describe{
#'     \item{call}{Function call.}
#'     \item{args}{List of function arguments, including `path`, `prefix`,
#'       and `overwrite`.}
#'     \item{fun}{Function used (`"FitVARMxIDSave"`).}
#'     \item{model}{A list of generated OpenMx models.}
#'     \item{output}{A list of fitted OpenMx models.}
#'     \item{converged}{A named logical vector indicating converged cases.}
#'     \item{robust}{A list of output from [OpenMx::imxRobustSE()]
#'       with argument `details = TRUE` for each `id` if `robust = TRUE`;
#'       otherwise `NULL`.}
#'   }
#'   In addition, each individual fit is saved to disk as an \file{.Rds} file.
#'   If a model fails for a given ID, an error object is saved as
#'   `prefix_id_error.Rds`, and that ID is omitted from the returned collated
#'   `varmxid` object.
#'
#' @examples
#' \donttest{
#' # Generate data using the simStateSpace package ----------------------
#' set.seed(42)
#' n <- 5
#' time <- 100
#' p <- 2
#' alpha <- rep(x = 0, times = p)
#' beta <- 0.50 * diag(p)
#' psi <- 0.001 * diag(p)
#' psi_l <- t(chol(psi))
#' mu0 <- simStateSpace::SSMMeanEta(
#'   beta = beta,
#'   alpha = alpha
#' )
#' sigma0 <- simStateSpace::SSMCovEta(
#'   beta = beta,
#'   psi = psi
#' )
#' sigma0_l <- t(chol(sigma0))
#' sim <- simStateSpace::SimSSMVARFixed(
#'   n = n,
#'   time = time,
#'   mu0 = mu0,
#'   sigma0_l = sigma0_l,
#'   alpha = alpha,
#'   beta = beta,
#'   psi_l = psi_l
#' )
#' data <- as.data.frame(sim)
#'
#' # Save results to a temporary directory ------------------------------
#' path <- tempdir()
#'
#' # Fit the model with person-mean centering ---------------------------
#' fit <- FitVARMxIDSave(
#'   data = data,
#'   observed = paste0("y", seq_len(p)),
#'   id = "id",
#'   center = TRUE,
#'   path = path,
#'   prefix = "fitvarmx_centered"
#' )
#' print(fit)
#' summary(fit)
#' coef(fit)
#' vcov(fit)
#' converged(fit)
#' confint(fit)
#' plot(fit)
#' }
#'
#' @references
#' Hunter, M. D. (2017).
#' State space modeling in an open source, modular,
#' structural equation modeling environment.
#' *Structural Equation Modeling: A Multidisciplinary Journal*,
#' *25*(2), 307--324.
#' \doi{10.1080/10705511.2017.1369354}
#'
#' Neale, M. C., Hunter, M. D., Pritikin, S. M.,
#' Zahery, M., Brick, T. R., Kirkpatrick, R. M., Estabrook, R.,
#' Bates, T. C., Maes, H. H., & Boker, S. M. (2015).
#' OpenMx 2.0: Extended structural equation and statistical modeling.
#' *Psychometrika*,
#' *81*(2), 535--549.
#' \doi{10.1007/s11336-014-9435-8}
#'
#' @family VAR Functions
#' @keywords fitVARMxID fit
#' @export
FitVARMxIDSave <- function(data,
                           observed,
                           id,
                           time = NULL,
                           ct = FALSE,
                           center = TRUE,
                           path = getwd(),
                           prefix = "fitvarmx",
                           overwrite = TRUE,
                           mu_fixed = FALSE,
                           mu_free = NULL,
                           mu_values = NULL,
                           mu_lbound = NULL,
                           mu_ubound = NULL,
                           alpha_fixed = FALSE,
                           alpha_free = NULL,
                           alpha_values = NULL,
                           alpha_lbound = NULL,
                           alpha_ubound = NULL,
                           beta_fixed = FALSE,
                           beta_free = NULL,
                           beta_values = NULL,
                           beta_lbound = NULL,
                           beta_ubound = NULL,
                           psi_diag = FALSE,
                           psi_fixed = FALSE,
                           psi_d_free = NULL,
                           psi_d_values = NULL,
                           psi_d_lbound = NULL,
                           psi_d_ubound = NULL,
                           psi_d_equal = FALSE,
                           psi_l_free = NULL,
                           psi_l_values = NULL,
                           psi_l_lbound = NULL,
                           psi_l_ubound = NULL,
                           nu_fixed = TRUE,
                           nu_free = NULL,
                           nu_values = NULL,
                           nu_lbound = NULL,
                           nu_ubound = NULL,
                           theta_diag = TRUE,
                           theta_fixed = TRUE,
                           theta_d_free = NULL,
                           theta_d_values = NULL,
                           theta_d_lbound = NULL,
                           theta_d_ubound = NULL,
                           theta_d_equal = FALSE,
                           theta_l_free = NULL,
                           theta_l_values = NULL,
                           theta_l_lbound = NULL,
                           theta_l_ubound = NULL,
                           mu0_fixed = TRUE,
                           mu0_func = TRUE,
                           mu0_free = NULL,
                           mu0_values = NULL,
                           mu0_lbound = NULL,
                           mu0_ubound = NULL,
                           sigma0_fixed = TRUE,
                           sigma0_func = TRUE,
                           sigma0_diag = FALSE,
                           sigma0_d_free = NULL,
                           sigma0_d_values = NULL,
                           sigma0_d_lbound = NULL,
                           sigma0_d_ubound = NULL,
                           sigma0_d_equal = FALSE,
                           sigma0_l_free = NULL,
                           sigma0_l_values = NULL,
                           sigma0_l_lbound = NULL,
                           sigma0_l_ubound = NULL,
                           robust = FALSE,
                           seed = NULL,
                           tries_explore = 100,
                           tries_local = 100,
                           max_attempts = 10,
                           silent = FALSE,
                           ncores = NULL) {
  if (isTRUE(center)) {
    if (isFALSE(mu_fixed) && isFALSE(nu_fixed)) {
      stop(
        "\n`mu` and `nu` cannot be modeled at the same time at the moment."
      )
    }
  } else {
    if (isFALSE(alpha_fixed) && isFALSE(nu_fixed)) {
      stop(
        "\n`alpha` and `nu` cannot be modeled at the same time at the moment."
      )
    }
  }
  if (isTRUE(ct) && is.null(time)) {
    stop(
      "\nArgument `time` cannot be `NULL` if `ct = TRUE`.\n"
    )
  }
  if (!is.character(path) || length(path) != 1L) {
    stop(
      "\nArgument `path` must be a character string."
    )
  }
  if (!dir.exists(path)) {
    stop(
      "\nDirectory specified in `path` does not exist."
    )
  }
  if (!is.character(prefix) || length(prefix) != 1L) {
    stop(
      "\nArgument `prefix` must be a character string."
    )
  }
  if (!is.logical(overwrite) || length(overwrite) != 1L) {
    stop(
      "\nArgument `overwrite` must be a logical value."
    )
  }
  ids <- sort(
    unique(data[, id])
  )
  if (length(ids) == 0L) {
    stop(
      "\nNo IDs found in `data`."
    )
  }
  if (is.null(ncores)) {
    ncores <- 1L
  } else {
    ncores <- min(
      as.integer(ncores),
      parallel::detectCores(),
      length(ids)
    )
  }
  args <- list(
    data = data,
    observed = observed,
    id = id,
    time = time,
    ct = ct,
    center = center,
    path = path,
    prefix = prefix,
    overwrite = overwrite,
    mu_fixed = mu_fixed,
    mu_free = mu_free,
    mu_values = mu_values,
    mu_lbound = mu_lbound,
    mu_ubound = mu_ubound,
    alpha_fixed = alpha_fixed,
    alpha_free = alpha_free,
    alpha_values = alpha_values,
    alpha_lbound = alpha_lbound,
    alpha_ubound = alpha_ubound,
    beta_fixed = beta_fixed,
    beta_free = beta_free,
    beta_values = beta_values,
    beta_lbound = beta_lbound,
    beta_ubound = beta_ubound,
    psi_diag = psi_diag,
    psi_fixed = psi_fixed,
    psi_d_free = psi_d_free,
    psi_d_values = psi_d_values,
    psi_d_lbound = psi_d_lbound,
    psi_d_ubound = psi_d_ubound,
    psi_d_equal = psi_d_equal,
    psi_l_free = psi_l_free,
    psi_l_values = psi_l_values,
    psi_l_lbound = psi_l_lbound,
    psi_l_ubound = psi_l_ubound,
    nu_fixed = nu_fixed,
    nu_free = nu_free,
    nu_values = nu_values,
    nu_lbound = nu_lbound,
    nu_ubound = nu_ubound,
    theta_diag = theta_diag,
    theta_fixed = theta_fixed,
    theta_d_free = theta_d_free,
    theta_d_values = theta_d_values,
    theta_d_lbound = theta_d_lbound,
    theta_d_ubound = theta_d_ubound,
    theta_d_equal = theta_d_equal,
    theta_l_free = theta_l_free,
    theta_l_values = theta_l_values,
    theta_l_lbound = theta_l_lbound,
    theta_l_ubound = theta_l_ubound,
    mu0_fixed = mu0_fixed,
    mu0_func = mu0_func,
    mu0_free = mu0_free,
    mu0_values = mu0_values,
    mu0_lbound = mu0_lbound,
    mu0_ubound = mu0_ubound,
    sigma0_fixed = sigma0_fixed,
    sigma0_func = sigma0_func,
    sigma0_diag = sigma0_diag,
    sigma0_d_free = sigma0_d_free,
    sigma0_d_values = sigma0_d_values,
    sigma0_d_lbound = sigma0_d_lbound,
    sigma0_d_ubound = sigma0_d_ubound,
    sigma0_d_equal = sigma0_d_equal,
    sigma0_l_free = sigma0_l_free,
    sigma0_l_values = sigma0_l_values,
    sigma0_l_lbound = sigma0_l_lbound,
    sigma0_l_ubound = sigma0_l_ubound,
    robust = robust,
    seed = seed,
    tries_explore = tries_explore,
    tries_local = tries_local,
    max_attempts = max_attempts,
    silent = silent,
    ncores = ncores
  )
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
  foo <- function(i) {
    outfile <- file.path(
      path,
      paste0(
        prefix,
        "_",
        i,
        ".Rds"
      )
    )
    errorfile <- file.path(
      path,
      paste0(
        prefix,
        "_",
        i,
        "_error.Rds"
      )
    )
    tryCatch(
      expr = {
        if (overwrite || !file.exists(outfile)) {
          out <- .FitVARMxID(
            data = data[
              which(data[, id] == i), ,
              drop = FALSE
            ],
            observed = observed,
            id = id,
            time = time,
            ct = ct,
            center = center,
            mu_fixed = mu_fixed,
            mu_free = mu_free,
            mu_values = mu_values,
            mu_lbound = mu_lbound,
            mu_ubound = mu_ubound,
            alpha_fixed = alpha_fixed,
            alpha_free = alpha_free,
            alpha_values = alpha_values,
            alpha_lbound = alpha_lbound,
            alpha_ubound = alpha_ubound,
            beta_fixed = beta_fixed,
            beta_free = beta_free,
            beta_values = beta_values,
            beta_lbound = beta_lbound,
            beta_ubound = beta_ubound,
            psi_diag = psi_diag,
            psi_fixed = psi_fixed,
            psi_d_free = psi_d_free,
            psi_d_values = psi_d_values,
            psi_d_lbound = psi_d_lbound,
            psi_d_ubound = psi_d_ubound,
            psi_d_equal = psi_d_equal,
            psi_l_free = psi_l_free,
            psi_l_values = psi_l_values,
            psi_l_lbound = psi_l_lbound,
            psi_l_ubound = psi_l_ubound,
            nu_fixed = nu_fixed,
            nu_free = nu_free,
            nu_values = nu_values,
            nu_lbound = nu_lbound,
            nu_ubound = nu_ubound,
            theta_diag = theta_diag,
            theta_fixed = theta_fixed,
            theta_d_free = theta_d_free,
            theta_d_values = theta_d_values,
            theta_d_lbound = theta_d_lbound,
            theta_d_ubound = theta_d_ubound,
            theta_d_equal = theta_d_equal,
            theta_l_free = theta_l_free,
            theta_l_values = theta_l_values,
            theta_l_lbound = theta_l_lbound,
            theta_l_ubound = theta_l_ubound,
            mu0_fixed = mu0_fixed,
            mu0_func = mu0_func,
            mu0_free = mu0_free,
            mu0_values = mu0_values,
            mu0_lbound = mu0_lbound,
            mu0_ubound = mu0_ubound,
            sigma0_fixed = sigma0_fixed,
            sigma0_func = sigma0_func,
            sigma0_diag = sigma0_diag,
            sigma0_d_free = sigma0_d_free,
            sigma0_d_values = sigma0_d_values,
            sigma0_d_lbound = sigma0_d_lbound,
            sigma0_d_ubound = sigma0_d_ubound,
            sigma0_d_equal = sigma0_d_equal,
            sigma0_l_free = sigma0_l_free,
            sigma0_l_values = sigma0_l_values,
            sigma0_l_lbound = sigma0_l_lbound,
            sigma0_l_ubound = sigma0_l_ubound,
            robust = robust,
            seed = seed,
            tries_explore = tries_explore,
            tries_local = tries_local,
            max_attempts = max_attempts,
            silent = silent,
            ncores = NULL
          )
          saveRDS(
            object = out,
            file = outfile
          )
        } else if (!silent) {
          message(
            "Skipping ID ",
            i,
            " because ",
            outfile,
            " already exists."
          )
        }
        readRDS(
          file = outfile
        )
      },
      error = function(e) {
        saveRDS(
          object = list(
            id = i,
            error = conditionMessage(e),
            call = conditionCall(e)
          ),
          file = errorfile
        )
        if (!silent) {
          message(
            "Model fitting failed for ID ",
            i,
            ". See ",
            errorfile,
            "."
          )
        }
        NULL
      }
    )
  }
  fork <- FALSE
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
    if (isTRUE(fork)) {
      if (!is.null(seed)) {
        set.seed(seed)
      }
      fit <- parallel::mclapply(
        X = ids,
        FUN = foo,
        mc.cores = ncores
      )
    } else {
      cl <- parallel::makeCluster(ncores)
      parallel::clusterEvalQ(
        cl = cl,
        library(OpenMx)
      )
      if (!is.null(seed)) {
        parallel::clusterSetRNGStream(
          cl = cl,
          iseed = seed
        )
      }
      on.exit(
        parallel::stopCluster(cl = cl),
        add = TRUE
      )
      fit <- parallel::parLapply(
        cl = cl,
        X = ids,
        fun = foo
      )
    }
    # nocov end
  } else {
    fit <- lapply(
      X = ids,
      FUN = foo
    )
  }
  fit <- fit[
    !sapply(
      X = fit,
      FUN = is.null
    )
  ]
  if (length(fit) == 0L) {
    stop(
      "\nNo individual fits completed successfully. ",
      "See error files in `path`."
    )
  }
  get_model <- function(x) {
    x$model
  }
  get_output <- function(x) {
    if (!is.null(x$fit)) {
      x$fit
    } else {
      x$output
    }
  }
  get_converged <- function(x) {
    x$converged
  }
  get_robust <- function(x) {
    x$robust
  }
  model <- unlist(
    lapply(
      X = fit,
      FUN = get_model
    ),
    recursive = FALSE,
    use.names = TRUE
  )
  output <- unlist(
    lapply(
      X = fit,
      FUN = get_output
    ),
    recursive = FALSE,
    use.names = TRUE
  )
  converged <- unlist(
    lapply(
      X = fit,
      FUN = get_converged
    ),
    use.names = TRUE
  )
  if (isTRUE(robust)) {
    robust_out <- unlist(
      lapply(
        X = fit,
        FUN = get_robust
      ),
      recursive = FALSE,
      use.names = TRUE
    )
    if (length(robust_out) == 0L) {
      robust_out <- NULL
    }
  } else {
    robust_out <- NULL
  }
  id_names <- names(output)
  model <- model[id_names]
  converged <- converged[id_names]
  if (!is.null(robust_out)) {
    robust_out <- robust_out[id_names]
  }
  if (!silent) {
    cat(
      paste(
        "\nSee",
        path,
        "for the saved results.\n"
      )
    )
  }
  out <- list(
    call = match.call(),
    args = args,
    fun = "FitVARMxIDSave",
    model = model,
    output = output,
    converged = converged,
    robust = robust_out
  )
  class(out) <- c(
    "varmxid",
    class(out)
  )
  out
}

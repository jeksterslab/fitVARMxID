#' Fit the First-Order Vector Autoregressive Model by ID
#'
#' The function fits
#' the first-order vector autoregressive model
#' for each unit ID.
#'
#' @details
#' ## Measurement Model
#' By default, the measurement model is given by
#' \deqn{
#'   \mathbf{y}_{i, t}
#'   =
#'   \boldsymbol{\eta}_{i, t} .
#' }
#' However, the full measurement model can be parameterized as follows
#' \deqn{
#'   \mathbf{y}_{i, t}
#'   =
#'   \boldsymbol{\nu}_{i}
#'   +
#'   \boldsymbol{\Lambda}
#'   \boldsymbol{\eta}_{i, t}
#'   +
#'   \boldsymbol{\varepsilon}_{i, t},
#'   \quad
#'   \mathrm{with}
#'   \quad
#'   \boldsymbol{\varepsilon}_{i, t}
#'   \sim
#'   \mathcal{N}
#'   \left(
#'   \mathbf{0},
#'   \boldsymbol{\Theta}_{i}
#'   \right)
#' }
#' where
#' \eqn{\mathbf{y}_{i, t}},
#' \eqn{\boldsymbol{\eta}_{i, t}},
#' and
#' \eqn{\boldsymbol{\varepsilon}_{i, t}}
#' are random variables
#' and
#' \eqn{\boldsymbol{\nu}_{i}},
#' \eqn{\boldsymbol{\Lambda}},
#' and
#' \eqn{\boldsymbol{\Theta}_{i}}
#' are model parameters.
#' \eqn{\mathbf{y}_{i, t}}
#' represents a vector of observed random variables,
#' \eqn{\boldsymbol{\eta}_{i, t}}
#' a vector of latent random variables,
#' and
#' \eqn{\boldsymbol{\varepsilon}_{i, t}}
#' a vector of random measurement errors,
#' at time \eqn{t} and individual \eqn{i}.
#' \eqn{\boldsymbol{\nu}_{i}},
#' denotes a vector of intercepts (fixed to a null vector by default),
#' \eqn{\boldsymbol{\Lambda}}
#' a matrix of factor loadings,
#' and
#' \eqn{\boldsymbol{\Theta}_{i}}
#' the covariance matrix of
#' \eqn{\boldsymbol{\varepsilon}}.
#' In this model,
#' \eqn{\boldsymbol{\Lambda}} is an identity matrix and
#' \eqn{\boldsymbol{\Theta}_{i}} is a diagonal matrix.
#'
#' ## Discrete-Time Dynamic Structure
#' The dynamic structure is given by
#' \deqn{
#'   \boldsymbol{\eta}_{i, t}
#'   =
#'   \boldsymbol{\alpha}_{i}
#'   +
#'   \boldsymbol{\beta}_{i}
#'   \boldsymbol{\eta}_{i, t - 1}
#'   +
#'   \boldsymbol{\zeta}_{i, t},
#'   \quad
#'   \mathrm{with}
#'   \quad
#'   \boldsymbol{\zeta}_{i, t}
#'   \sim
#'   \mathcal{N}
#'   \left(
#'   \mathbf{0},
#'   \boldsymbol{\Psi}_{i}
#'   \right)
#' }
#' where
#' \eqn{\boldsymbol{\eta}_{i, t}},
#' \eqn{\boldsymbol{\eta}_{i, t - 1}},
#' and
#' \eqn{\boldsymbol{\zeta}_{i, t}}
#' are random variables,
#' and
#' \eqn{\boldsymbol{\alpha}_{i}},
#' \eqn{\boldsymbol{\beta}_{i}},
#' and
#' \eqn{\boldsymbol{\Psi}_{i}}
#' are model parameters.
#' Here,
#' \eqn{\boldsymbol{\eta}_{i, t}}
#' is a vector of latent variables
#' at time \eqn{t} and individual \eqn{i},
#' \eqn{\boldsymbol{\eta}_{i, t - 1}}
#' represents a vector of latent variables
#' at time \eqn{t - 1} and individual \eqn{i},
#' and
#' \eqn{\boldsymbol{\zeta}_{i, t}}
#' represents a vector of dynamic noise
#' at time \eqn{t} and individual \eqn{i}.
#' \eqn{\boldsymbol{\alpha}_{i}}
#' denotes a vector of intercepts,
#' \eqn{\boldsymbol{\beta}_{i}}
#' a matrix of autoregression
#' and cross regression coefficients,
#' and
#' \eqn{\boldsymbol{\Psi}_{i}}
#' the covariance matrix of
#' \eqn{\boldsymbol{\zeta}_{i, t}}.
#'
#' If `center = TRUE`, the dynamic structure is parameterized as follows
#' \deqn{
#'   \boldsymbol{\eta}_{i, t}
#'   =
#'   \boldsymbol{\mu}_{i}
#'   +
#'   \boldsymbol{\beta}_{i}
#'   \left(
#'     \boldsymbol{\eta}_{i, t - 1}
#'     -
#'     \boldsymbol{\mu}_{i}
#'   \right)
#'   +
#'   \boldsymbol{\zeta}_{i, t}
#' }
#' where \eqn{\boldsymbol{\mu}_{i}}
#' is equilibrium level of the latent state
#' toward which the system is pulled over time.
#'
#' ## Continuous-Time Dynamic Structure
#' The continuous-time parameterization, when `ct = TRUE`,
#' for the dynamic structure is given by
#' \deqn{
#'   \mathrm{d}
#'   \boldsymbol{\eta}_{i, t}
#'   =
#'   \left(
#'   \boldsymbol{\alpha}_{i}
#'   +
#'   \boldsymbol{\beta}_{i}
#'   \boldsymbol{\eta}_{i, t - 1}
#'   \right)
#'   \mathrm{d} t
#'   +
#'   \boldsymbol{\Psi}_{i}^{\frac{1}{2}}
#'   \mathrm{d}
#'   \mathbf{W}_{i, t}
#' }
#' note that \eqn{\mathrm{d}\boldsymbol{W}}
#' is a Wiener process or Brownian motion,
#' which represents random fluctuations.
#'
#' If `center = TRUE`, the dynamic structure is parameterized as follows
#' \deqn{
#'   \mathrm{d}
#'   \boldsymbol{\eta}_{i, t}
#'   =
#'   \boldsymbol{\beta}_{i}
#'   \left(
#'     \boldsymbol{\eta}_{i, t - 1}
#'     -
#'     \boldsymbol{\mu}_{i}
#'   \right)
#'   \mathrm{d} t
#'   +
#'   \boldsymbol{\Psi}_{i}^{\frac{1}{2}}
#'   \mathrm{d}
#'   \mathbf{W}_{i, t}
#' }
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param data Data frame.
#'   A data frame object of data for potentially
#'   multiple subjects that contain
#'   a column of subject ID numbers
#'   (i.e., an ID variable), and
#'   at least one column of observed values.
#' @param observed Character vector.
#'   A vector of character strings
#'   of the names of the observed variables in the data.
#' @param id Character string.
#'   A character string of the name of the ID variable in the data.
#' @param time Character string.
#'   A character string of the name of the TIME variable in the data.
#'   Used when `ct = TRUE`.
#' @param ct Logical.
#'   If TRUE, fit a continuous-time vector autoregressive model.
#'   If FALSE, fit a discrete-time vector autoregressive model.
#' @param center Logical.
#'   If `TRUE`, use the mean-centered (mean-reverting) state equation.
#'   When `center = TRUE`, `alpha` is implied and the set-point `mu` is
#'   estimated. When `center = FALSE`,
#'   `alpha` is estimated and `mu` is implied.
#' @param mu_fixed Logical.
#'   If `TRUE`, the set-point mean vector `mu`
#'   is fixed to `mu_values`.
#'   If `mu_fixed = TRUE` and `mu_values = NULL`,
#'   `mu` is fixed to a zero vector.
#'   If `FALSE`, `mu` is estimated.
#' @param alpha_fixed Logical.
#'   If `TRUE`,
#'   the dynamic model intercept vector `alpha`
#'   is fixed to `alpha_values`.
#'   If `FALSE`, `alpha` is estimated.
#' @param nu_fixed Logical.
#'   If `TRUE`,
#'   the measurement model intercept vector `nu`
#'   is fixed to `nu_values`.
#'   If `FALSE`, `nu` is estimated.
#' @param mu0_fixed Logical.
#'   If `TRUE`, the initial mean vector `mu0` is fixed.
#'   If `mu0_fixed = TRUE` and `mu0_func = TRUE`,
#'   `mu0` is fixed to the implied stable mean vector.
#'   If `mu0_fixed = TRUE` and `mu0_values = NULL`,
#'   `mu0` is fixed to a zero vector.
#'   If `FALSE`, `mu0` is estimated.
#' @param mu0_func Logical.
#'   If `TRUE` and `mu0_fixed = TRUE`,
#'   `mu0` is fixed to the implied stable mean vector.
#' @param mu_free Logical vector indicating
#'   which elements of `mu` are freely estimated.
#'   If `NULL`, all elements are free.
#'   Ignored if `mu_fixed = TRUE`.
#' @param alpha_free Logical vector indicating
#'   which elements of `alpha` are freely estimated.
#'   If `NULL`, all elements are free.
#'   Ignored if `alpha_fixed = TRUE`.
#' @param nu_free Logical vector indicating
#'   which elements of `nu` are freely estimated.
#'   If `NULL`, all elements are free.
#'   Ignored if `nu_fixed = TRUE`.
#' @param mu0_free Logical vector indicating
#'   which elements of `mu0` are free.
#'   Ignored if `mu0_fixed = TRUE`.
#' @param mu_values Numeric vector of values for `mu`.
#'   If `mu_fixed = TRUE`, these are fixed values.
#'   If `mu_fixed = FALSE`, these are starting values.
#'   If `NULL`, defaults to a vector of zeros.
#' @param alpha_values Numeric vector of values for `alpha`.
#'   If `alpha_fixed = TRUE`, these are fixed values.
#'   If `alpha_fixed = FALSE`, these are starting values.
#'   If `NULL`, defaults to a vector of zeros.
#' @param nu_values Numeric vector of values for `nu`.
#'   If `nu_fixed = TRUE`, these are fixed values.
#'   If `nu_fixed = FALSE`, these are starting values.
#'   If `NULL`, defaults to a vector of zeros.
#' @param mu0_values Numeric vector of values for `mu0`.
#'   If `mu0_fixed = TRUE`, these are fixed values.
#'   If `mu0_fixed = FALSE`, these are starting values.
#'   If `NULL`, defaults to a vector of zeros.
#'   Ignored if `mu0_fixed = TRUE` and `mu0_func = TRUE`.
#' @param mu_lbound Numeric vector of lower bounds for `mu`.
#'   Ignored if `mu_fixed = TRUE`.
#' @param alpha_lbound Numeric vector of lower bounds for `alpha`.
#'   Ignored if `alpha_fixed = TRUE`.
#' @param nu_lbound Numeric vector of lower bounds for `nu`.
#'   Ignored if `nu_fixed = TRUE`.
#' @param mu0_lbound Numeric vector of lower bounds for `mu0`.
#'   Ignored if `mu0_fixed = TRUE`.
#' @param mu_ubound Numeric vector of upper bounds for `mu`.
#'   Ignored if `mu_fixed = TRUE`.
#' @param alpha_ubound Numeric vector of upper bounds for `alpha`.
#'   Ignored if `alpha_fixed = TRUE`.
#' @param nu_ubound Numeric vector of upper bounds for `nu`.
#'   Ignored if `nu_fixed = TRUE`.
#' @param mu0_ubound Numeric vector of upper bounds for `mu0`.
#'   Ignored if `mu0_fixed = TRUE`.
#' @param beta_fixed Logical.
#'   If `TRUE`, the dynamic model coefficient matrix `beta` is fixed.
#'   If `FALSE`, `beta` is estimated.
#' @param beta_free Logical matrix indicating
#'   which elements of `beta` are freely estimated.
#'   If `NULL`, all elements are free.
#'   Ignored if `beta_fixed = TRUE`.
#' @param beta_values Numeric matrix.
#'   Values for `beta`.
#'   If `beta_fixed = TRUE`, these are fixed values;
#'   if `beta_fixed = FALSE`, these are starting values.
#'   If `NULL`, defaults to a diagonal matrix
#'   with -0.001 when `ct = TRUE` and 0.001 when `ct = FALSE`.
#' @param beta_lbound Numeric matrix of lower bounds for `beta`.
#'   If `NULL`, defaults to -2.5.
#'   Ignored if `beta_fixed = TRUE`.
#' @param beta_ubound Numeric matrix.
#'   Upper bounds for `beta`.
#'   Ignored if `beta_fixed = TRUE`.
#'   If `NULL`, defaults to `+2.5`.
#'   If `NULL` and `ct = TRUE`,
#'   diagonal upper bounds are set to `-1e-05`.
#' @param psi_diag Logical.
#'   If `TRUE`, `psi` is diagonal.
#'   If `FALSE`, `psi` is symmetric.
#' @param theta_diag Logical.
#'   If `TRUE`, `theta` is diagonal.
#'   If `FALSE`, `theta` is symmetric.
#' @param sigma0_diag Logical.
#'   If `TRUE`, `sigma0` is diagonal.
#'   If `FALSE`, `sigma0` is symmetric.
#' @param psi_fixed Logical.
#'   If `TRUE`, the process noise covariance matrix `psi`
#'   is fixed using `psi_d_values` and `psi_l_values`.
#'   If `psi_d_values` is `NULL` it is fixed to a zero matrix.
#'   If `FALSE`, `psi` is estimated.
#' @param theta_fixed Logical.
#'   If `TRUE`, the measurement error covariance matrix `theta`
#'   is fixed using `theta_d_values` and `theta_l_values`.
#'   If `theta_d_values` is `NULL` it is fixed to a zero matrix.
#'   If `FALSE`, `theta` is estimated.
#' @param sigma0_fixed Logical.
#'   If `TRUE`, the initial condition covariance matrix `sigma0`
#'   is fixed using `sigma0_d_values` and `sigma0_l_values`.
#'   If `sigma0_fixed = TRUE` and `sigma0_func = TRUE`,
#'   `sigma0` is fixed to the implied stable covariance matrix.
#'   If `sigma0_fixed = TRUE` and `sigma0_d_values = NULL`,
#'   `sigma0` is fixed to a diffused matrix.
#' @param sigma0_func Logical.
#'   If `TRUE` and `sigma0_fixed = TRUE`, `sigma0` is fixed to
#'   the implied stable covariance matrix.
#' @param psi_d_free Logical vector
#'   indicating free/fixed status of the elements of `psi_d`.
#'   If `NULL`, all element of `psi_d` are free.
#' @param theta_d_free Logical vector
#'   indicating free/fixed status of the diagonal parameters `theta_d`.
#'   If `NULL`, all element of `theta_d` are free.
#' @param sigma0_d_free Logical vector
#'   indicating free/fixed status of the elements of `sigma0_d`.
#'   If `NULL`, all element of `sigma0_d` are free.
#' @param psi_l_free Logical matrix
#'   indicating which strictly-lower-triangular elements of `psi_l` are free.
#'   If `NULL`, all element of `psi_l` are free.
#'   Ignored if `psi_diag = TRUE`.
#' @param theta_l_free Logical matrix
#'   indicating which strictly-lower-triangular elements of `theta_l` are free.
#'   If `NULL`, all element of `theta_l` are free.
#'   Ignored if `theta_diag = TRUE`.
#' @param sigma0_l_free Logical matrix
#'   indicating which strictly-lower-triangular elements of `sigma0_l` are free.
#'   If `NULL`, all element of `sigma0_l` are free.
#'   Ignored if `sigma0_diag = TRUE`.
#' @param psi_d_values Numeric vector
#'   with starting values for `psi_d`.
#'   If `psi_fixed = TRUE`, these are fixed values.
#'   If `psi_fixed = FALSE`, these are starting values.
#' @param theta_d_values Numeric vector
#'   with starting values for `theta_d`.
#'   If `theta_fixed = TRUE`, these are fixed values.
#'   If `theta_fixed = FALSE`, these are starting values.
#' @param sigma0_d_values Numeric vector
#'   with starting values for `sigma0_d`.
#'   If `sigma0_fixed = TRUE`, these are fixed values.
#'   If `sigma0_fixed = FALSE`, these are starting values.
#' @param psi_d_lbound Numeric vector
#'   with lower bounds for `psi_d`.
#' @param theta_d_lbound Numeric vector
#'   with lower bounds for `theta_d`.
#' @param sigma0_d_lbound Numeric vector
#'   with lower bounds for `sigma0_d`.
#' @param psi_d_ubound Numeric vector
#'   with upper bounds for `psi_d`.
#' @param theta_d_ubound Numeric vector
#'   with upper bounds for `theta_d`.
#' @param sigma0_d_ubound Numeric vector
#'   with upper bounds for `sigma0_d`.
#' @param psi_l_values Numeric matrix
#'   of starting values
#'   for the strictly-lower-triangular elements of `psi_l`.
#' @param theta_l_values Numeric matrix
#'   of starting values
#'   for the strictly-lower-triangular elements of `theta_l`.
#' @param sigma0_l_values Numeric matrix
#'   of starting values
#'   for the strictly-lower-triangular elements of `sigma0_l`.
#' @param psi_l_lbound Numeric matrix
#'   with lower bounds for `psi_l`.
#' @param theta_l_lbound Numeric matrix
#'   with lower bounds for `theta_l`.
#' @param sigma0_l_lbound Numeric matrix
#'   with lower bounds for `sigma0_l`.
#' @param psi_l_ubound Numeric matrix
#'   with upper bounds for `psi_l`.
#' @param theta_l_ubound Numeric matrix
#'   with upper bounds for `theta_l`.
#' @param sigma0_l_ubound Numeric matrix
#'   with upper bounds for `sigma0_l`.
#' @param psi_d_equal Logical.
#'   When `TRUE`, all free diagonal elements of `psi_d` are constrained
#'   to be equal and estimated as a single shared parameter.
#'   Ignored if no diagonal elements are free.
#' @param theta_d_equal Logical.
#'   When `TRUE`, all free diagonal elements of `theta_d` are constrained
#'   to be equal and estimated as a single shared parameter.
#'   Ignored if no diagonal elements are free.
#' @param sigma0_d_equal Logical.
#'   When `TRUE`, all free diagonal elements of `sigma0_d` are constrained
#'   to be equal and estimated as a single shared parameter.
#'   Ignored if no diagonal elements are free.
#' @param robust Logical.
#'   If `TRUE`, calculate robust (sandwich) sampling variance-covariance matrix.
#' @param seed Random seed for reproducibility.
#' @param tries_explore Integer.
#'   Number of extra tries for the wide exploration phase.
#' @param tries_local Integer.
#'   Number of extra tries for local polishing.
#' @param max_attempts Integer.
#'   Maximum number of remediation attempts
#'   after the first Hessian computation fails the criteria.
#' @param silent Logical.
#'   If `TRUE`, suppresses messages during the model fitting stage.
#' @param ncores Positive integer.
#'   Number of cores to use.
#'
#' @return Returns an object of class `varmxid` which is
#'   a list with the following elements:
#'   \describe{
#'     \item{call}{Function call.}
#'     \item{args}{List of function arguments.}
#'     \item{fun}{Function used ("FitVARMxID").}
#'     \item{model}{A list of generated OpenMx models.}
#'     \item{output}{A list of fitted OpenMx models.}
#'     \item{converged}{A logical vector indicating converged cases.}
#'     \item{robust}{A list of output from [OpenMx::imxRobustSE()]
#'         with argument `details = TRUE` for each `id`
#'         if `robust = TRUE`.}
#'   }
#'
#' @examples
#' \donttest{
#' # Generate data using the simStateSpace package-------------------------
#' library(simStateSpace)
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
#' sim <- SimSSMVARFixed(
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
#' # Fit the model---------------------------------------------------------
#' # center = TRUE
#' library(fitVARMxID)
#' fit <- FitVARMxID(
#'   data = data,
#'   observed = paste0("y", seq_len(p)),
#'   id = "id",
#'   center = TRUE
#' )
#' print(fit)
#' summary(fit)
#' coef(fit)
#' vcov(fit)
#' converged(fit)
#'
#' # Fit the model---------------------------------------------------------
#' # center = FALSE
#' library(fitVARMxID)
#' fit <- FitVARMxID(
#'   data = data,
#'   observed = paste0("y", seq_len(p)),
#'   id = "id",
#'   center = FALSE
#' )
#' print(fit)
#' summary(fit)
#' coef(fit)
#' vcov(fit)
#' converged(fit)
#' }
#'
#' @references
#' Hunter, M. D. (2017).
#' State space modeling in an open source, modular,
#' structural equation modeling environment.
#' *Structural Equation Modeling: A Multidisciplinary Journal*,
#' *25*(2), 307–324.
#' \doi{10.1080/10705511.2017.1369354}
#'
#' Neale, M. C., Hunter, M. D., Pritikin, J. N.,
#' Zahery, M., Brick, T. R., Kirkpatrick, R. M., Estabrook, R.,
#' Bates, T. C., Maes, H. H., & Boker, S. M. (2015).
#' OpenMx 2.0: Extended structural equation and statistical modeling.
#' *Psychometrika*,
#' *81*(2), 535–549.
#' \doi{10.1007/s11336-014-9435-8}
#'
#' @family VAR Functions
#' @keywords fitVARMxID fit
#' @import OpenMx
#' @importFrom stats coef vcov
#' @export
FitVARMxID <- function(data,
                       observed,
                       id,
                       time = NULL,
                       ct = FALSE,
                       center = TRUE,
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
  args <- list(
    data = data,
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
    ncores = ncores
  )
  output <- .FitVARMxID(
    data = data,
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
    ncores = ncores
  )
  out <- list(
    call = match.call(),
    args = args,
    fun = "FitVARMxID",
    model = output$model,
    output = output$fit,
    converged = output$converged,
    robust = output$robust
  )
  class(out) <- c(
    "varmxid",
    class(out)
  )
  out
}

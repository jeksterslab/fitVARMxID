# Fit the First-Order Vector Autoregressive Model by ID

The function fits the first-order vector autoregressive model for each
unit ID.

## Usage

``` r
FitVARMxID(
  data,
  observed,
  id,
  ct = FALSE,
  time = NULL,
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
  psi_d_free = NULL,
  psi_d_values = NULL,
  psi_d_lbound = NULL,
  psi_d_ubound = NULL,
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
  mu0_func = FALSE,
  mu0_free = NULL,
  mu0_values = NULL,
  mu0_lbound = NULL,
  mu0_ubound = NULL,
  sigma0_fixed = TRUE,
  sigma0_func = FALSE,
  sigma0_diag = FALSE,
  sigma0_d_free = NULL,
  sigma0_d_values = NULL,
  sigma0_d_lbound = NULL,
  sigma0_d_ubound = NULL,
  sigma0_l_free = NULL,
  sigma0_l_values = NULL,
  sigma0_l_lbound = NULL,
  sigma0_l_ubound = NULL,
  robust = FALSE,
  tries_explore = 100,
  tries_local = 10,
  max_attempts = 10,
  grad_tol = 0.01,
  hess_tol = 1e-08,
  eps = 1e-06,
  factor = 10,
  overwrite = FALSE,
  path = getwd(),
  prefix = "FitVARMxID",
  seed = NULL,
  silent = FALSE,
  ncores = NULL,
  clean = TRUE
)
```

## Arguments

- data:

  Data frame. A data frame object of data for potentially multiple
  subjects that contain a column of subject ID numbers (i.e., an ID
  variable), and at least one column of observed values.

- observed:

  Character vector. A vector of character strings of the names of the
  observed variables in the data.

- id:

  Character string. A character string of the name of the ID variable in
  the data.

- ct:

  Logical. If TRUE, fit a continuous-time vector autoregressive model.
  If FALSE, fit a discrete-time vector autoregressive model.

- time:

  Character string. A character string of the name of the TIME variable
  in the data. Used when `ct = TRUE`.

- center:

  Logical. If TRUE, use the mean-centered (mean-reverting) state
  equation. Note that when `center = TRUE`, `alpha` is implied and the
  set-point `mu` is estimated.

- mu_fixed:

  Logical. If `TRUE`, the dynamic model set-point vector `mu` is fixed.
  If `FALSE`, `mu` is estimated.

- mu_free:

  Logical vector indicating which elements of `mu` are freely estimated.
  If `NULL`, all elements are free. Ignored if `mu_fixed = TRUE`.

- mu_values:

  Numeric vector of values for `mu`. If `mu_fixed = TRUE`, these are
  fixed values. If `mu_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a vector of zeros.

- mu_lbound:

  Numeric vector of lower bounds for `mu`. If `NULL`, no lower bounds
  are set. Ignored if `mu_fixed = TRUE`.

- mu_ubound:

  Numeric vector of upper bounds for `mu`. If `NULL`, no upper bounds
  are set. Ignored if `mu_fixed = TRUE`.

- alpha_fixed:

  Logical. If `TRUE`, the dynamic model intercept vector `alpha` is
  fixed. If `FALSE`, `alpha` is estimated.

- alpha_free:

  Logical vector indicating which elements of `alpha` are freely
  estimated. If `NULL`, all elements are free. Ignored if
  `alpha_fixed = TRUE`.

- alpha_values:

  Numeric vector of values for `alpha`. If `alpha_fixed = TRUE`, these
  are fixed values. If `alpha_fixed = FALSE`, these are starting values.
  If `NULL`, defaults to a vector of zeros.

- alpha_lbound:

  Numeric vector of lower bounds for `alpha`. If `NULL`, no lower bounds
  are set. Ignored if `alpha_fixed = TRUE`.

- alpha_ubound:

  Numeric vector of upper bounds for `alpha`. If `NULL`, no upper bounds
  are set. Ignored if `alpha_fixed = TRUE`.

- beta_fixed:

  Logical. If `TRUE`, the dynamic model coefficient matrix `beta` is
  fixed. If `FALSE`, `beta` is estimated.

- beta_free:

  Logical matrix indicating which elements of `beta` are freely
  estimated. If `NULL`, all elements are free. Ignored if
  `beta_fixed = TRUE`.

- beta_values:

  Numeric matrix of values for `beta`. If `beta_fixed = TRUE`, these are
  fixed values. If `beta_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a zero matrix.

- beta_lbound:

  Numeric matrix of lower bounds for `beta`. If `NULL`, defaults to
  -1.5. Ignored if `beta_fixed = TRUE`.

- beta_ubound:

  Numeric matrix of upper bounds for `beta`. If `NULL`, defaults to
  +1.5. Ignored if `beta_fixed = TRUE`.

- psi_diag:

  Logical. If `TRUE`, `psi` is diagonal. If `FALSE`, `psi` is symmetric.

- psi_d_free:

  Logical vector indicating free/fixed status of the elements of
  `psi_d`. If `NULL`, all element of `psi_d` are free.

- psi_d_values:

  Numeric vector with starting values for `psi_d`. If `NULL`, defaults
  to a vector of ones.

- psi_d_lbound:

  Numeric vector with lower bounds for `psi_d`. If `NULL`, no lower
  bounds are set.

- psi_d_ubound:

  Numeric vector with upper bounds for `psi_d`. If `NULL`, no upper
  bounds are set.

- psi_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `psi_l` are free. Ignored if `psi_diag = TRUE`.

- psi_l_values:

  Numeric matrix of starting values for the strictly-lower-triangular
  elements of `psi_l`. If `NULL`, defaults to a null matrix.

- psi_l_lbound:

  Numeric matrix with lower bounds for `psi_l`. If `NULL`, no lower
  bounds are set.

- psi_l_ubound:

  Numeric matrix with upper bounds for `psi_l`. If `NULL`, no upper
  bounds are set.

- nu_fixed:

  Logical. If `TRUE`, the measurement model intercept vector `nu` is
  fixed. If `FALSE`, `nu` is estimated.

- nu_free:

  Logical vector indicating which elements of `nu` are freely estimated.
  If `NULL`, all elements are free. Ignored if `nu_fixed = TRUE`.

- nu_values:

  Numeric vector of values for `nu`. If `nu_fixed = TRUE`, these are
  fixed values. If `nu_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a vector of zeros.

- nu_lbound:

  Numeric vector of lower bounds for `nu`. If `NULL`, no lower bounds
  are set. Ignored if `nu_fixed = TRUE`.

- nu_ubound:

  Numeric vector of upper bounds for `nu`. If `NULL`, no upper bounds
  are set. Ignored if `nu_fixed = TRUE`.

- theta_diag:

  Logical. If `TRUE`, `theta` is diagonal. If `FALSE`, `theta` is
  symmetric.

- theta_fixed:

  Logical. If `TRUE`, the measurement error matrix `theta` is fixed to
  `SoftPlus(theta_d_values)`. If `FALSE`, only diagonal elements are
  estimated (off-diagonals fixed to zero).

- theta_d_free:

  Logical vector indicating free/fixed status of the diagonal parameters
  `theta_d`. If `NULL`, all element of `theta_d` are free.

- theta_d_values:

  Numeric vector with starting values for `theta_d`. If
  `theta_fixed = TRUE`, these are fixed values. If
  `theta_fixed = FALSE`, these are starting values. If `NULL`, defaults
  to an identity matrix.

- theta_d_lbound:

  Numeric vector with lower bounds for `theta_d`. If `NULL`, no lower
  bounds are set.

- theta_d_ubound:

  Numeric vector with upper bounds for `theta_d`. If `NULL`, no upper
  bounds are set.

- theta_d_equal:

  Logical. When `TRUE`, all free diagonal elements of `theta_d` are
  constrained to be equal and estimated as a single shared parameter
  (`theta_eq`). Ignored if no diagonal elements are free.

- theta_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `theta_l` are free. Ignored if `theta_diag = TRUE`.

- theta_l_values:

  Numeric matrix of starting values for the strictly-lower-triangular
  elements of `theta_l`. If `NULL`, defaults to a null matrix.

- theta_l_lbound:

  Numeric matrix with lower bounds for `theta_l`. If `NULL`, no lower
  bounds are set.

- theta_l_ubound:

  Numeric matrix with upper bounds for `theta_l`. If `NULL`, no upper
  bounds are set.

- mu0_fixed:

  Logical. If `TRUE`, the initial mean vector `mu0` is fixed. If
  `FALSE`, `mu0` is estimated.

- mu0_func:

  Logical. If `TRUE` and `mu0_fixed = TRUE`, `mu0` is fixed to \\ (I -
  \beta)^{-1} \alpha \\.

- mu0_free:

  Logical vector indicating which elements of `mu0` are freely
  estimated.

- mu0_values:

  Numeric vector of values for `mu0`. If `mu0_fixed = TRUE`, these are
  fixed values. If `mu0_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a vector of zeros.

- mu0_lbound:

  Numeric vector of lower bounds for `mu0`. If `NULL`, no lower bounds
  are set. Ignored if `mu0_fixed = TRUE`.

- mu0_ubound:

  Numeric vector of upper bounds for `mu0`. If `NULL`, no upper bounds
  are set. Ignored if `mu0_fixed = TRUE`.

- sigma0_fixed:

  Logical. If `TRUE`, the initial covariance matrix `sigma0` is fixed.
  If `FALSE`, `sigma0` is estimated.

- sigma0_func:

  Logical. If `TRUE` and `sigma0_fixed = TRUE`, `sigma0` is fixed to \\
  (I - \beta \otimes \beta)^{-1} \mathrm{Vec}(\Psi) \\.

- sigma0_diag:

  Logical. If `TRUE`, `sigma0` is diagonal. If `FALSE`, `sigma0` is
  symmetric.

- sigma0_d_free:

  Logical vector indicating free/fixed status of the elements of
  `sigma0_d`. If `NULL`, all element of `sigma0_d` are free.

- sigma0_d_values:

  Numeric vector with starting values for `sigma0_d`. If `NULL`,
  defaults to a vector of ones.

- sigma0_d_lbound:

  Numeric vector with lower bounds for `sigma0_d`. If `NULL`, no lower
  bounds are set.

- sigma0_d_ubound:

  Numeric vector with upper bounds for `sigma0_d`. If `NULL`, no upper
  bounds are set.

- sigma0_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `sigma0_l` are free. Ignored if `sigma0_diag = TRUE`.

- sigma0_l_values:

  Numeric matrix of starting values for the strictly-lower-triangular
  elements of `sigma0_l`. If `NULL`, defaults to a null matrix.

- sigma0_l_lbound:

  Numeric matrix with lower bounds for `sigma0_l`. If `NULL`, no lower
  bounds are set.

- sigma0_l_ubound:

  Numeric matrix with upper bounds for `sigma0_l`. If `NULL`, no upper
  bounds are set.

- robust:

  Logical. If `TRUE`, calculate robust (sandwich) sampling
  variance-covariance matrix.

- tries_explore:

  Integer. Number of extra tries for the wide exploration phase using
  [`OpenMx::mxTryHardWideSearch()`](https://rdrr.io/pkg/OpenMx/man/mxTryHard.html)
  with `checkHess = FALSE`.

- tries_local:

  Integer. Number of extra tries for local polishing via
  [`OpenMx::mxTryHard()`](https://rdrr.io/pkg/OpenMx/man/mxTryHard.html)
  when gradients remain above tolerance.

- max_attempts:

  Integer. Maximum number of remediation attempts after the first
  Hessian computation fails the criteria. Each attempt may nudge off
  bounds, refit locally without the Hessian, and, on the last attempt,
  relax bounds.

- grad_tol:

  Numeric. Tolerance for the maximum absolute gradient. Smaller values
  are stricter.

- hess_tol:

  Numeric. Minimum allowable Hessian eigenvalue. Smaller values are less
  strict.

- eps:

  Numeric. Proximity threshold to detect parameters on their bounds and
  to nudge them inward by `10 * eps`.

- factor:

  Numeric. Multiplicative factor to relax parameter bounds on the final
  remediation attempt. Lower bounds are divided by `factor` and upper
  bounds are multiplied by `factor`.

- overwrite:

  Logical. If `TRUE`, existing intermediate files are overwritten.
  Defaults to `FALSE`.

- path:

  Character string. Directory in which to save intermediate files.

- prefix:

  Alphanumeric character string. Prefix to use when naming intermediate
  files.

- seed:

  Random seed for reproducibility.

- silent:

  Logical. If `TRUE`, suppresses messages during the model fitting
  stage.

- ncores:

  Positive integer. Number of cores to use.

- clean:

  Logical. If `TRUE`, clean intermediate files saved in `path`.

## Value

Returns an object of class `varmxid` which is a list with the following
elements:

- call:

  Function call.

- args:

  List of function arguments.

- fun:

  Function used ("FitVARMxID").

- output:

  A list of fitted OpenMx models.

- robust:

  A list of output from
  [`OpenMx::imxRobustSE()`](https://rdrr.io/pkg/OpenMx/man/imxRobustSE.html)
  with argument `details = TRUE` for each `id`.

## Details

### Measurement Model

By default, the measurement model is given by \$\$ \mathbf{y}\_{i, t} =
\boldsymbol{\eta}\_{i, t} . \$\$ However, the full measurement model can
be parameterized as follows \$\$ \mathbf{y}\_{i, t} =
\boldsymbol{\nu}\_{i} + \boldsymbol{\Lambda} \boldsymbol{\eta}\_{i, t} +
\boldsymbol{\varepsilon}\_{i, t}, \quad \mathrm{with} \quad
\boldsymbol{\varepsilon}\_{i, t} \sim \mathcal{N} \left( \mathbf{0},
\boldsymbol{\Theta}\_{i} \right) \$\$ where \\\mathbf{y}\_{i, t}\\,
\\\boldsymbol{\eta}\_{i, t}\\, and \\\boldsymbol{\varepsilon}\_{i, t}\\
are random variables and \\\boldsymbol{\nu}\_{i}\\,
\\\boldsymbol{\Lambda}\\, and \\\boldsymbol{\Theta}\_{i}\\ are model
parameters. \\\mathbf{y}\_{i, t}\\ represents a vector of observed
random variables, \\\boldsymbol{\eta}\_{i, t}\\ a vector of latent
random variables, and \\\boldsymbol{\varepsilon}\_{i, t}\\ a vector of
random measurement errors, at time \\t\\ and individual \\i\\.
\\\boldsymbol{\nu}\_{i}\\, denotes a vector of intercepts (fixed to a
null vector by default), \\\boldsymbol{\Lambda}\\ a matrix of factor
loadings, and \\\boldsymbol{\Theta}\_{i}\\ the covariance matrix of
\\\boldsymbol{\varepsilon}\\. In this model, \\\boldsymbol{\Lambda}\\ is
an identity matrix and \\\boldsymbol{\Theta}\_{i}\\ is a diagonal
matrix.

### Discrete-Time Dynamic Structure

The dynamic structure is given by \$\$ \boldsymbol{\eta}\_{i, t} =
\boldsymbol{\alpha}\_{i} + \boldsymbol{\beta}\_{i}
\boldsymbol{\eta}\_{i, t - 1} + \boldsymbol{\zeta}\_{i, t}, \quad
\mathrm{with} \quad \boldsymbol{\zeta}\_{i, t} \sim \mathcal{N} \left(
\mathbf{0}, \boldsymbol{\Psi}\_{i} \right) \$\$ where
\\\boldsymbol{\eta}\_{i, t}\\, \\\boldsymbol{\eta}\_{i, t - 1}\\, and
\\\boldsymbol{\zeta}\_{i, t}\\ are random variables, and
\\\boldsymbol{\alpha}\_{i}\\, \\\boldsymbol{\beta}\_{i}\\, and
\\\boldsymbol{\Psi}\_{i}\\ are model parameters. Here,
\\\boldsymbol{\eta}\_{i, t}\\ is a vector of latent variables at time
\\t\\ and individual \\i\\, \\\boldsymbol{\eta}\_{i, t - 1}\\ represents
a vector of latent variables at time \\t - 1\\ and individual \\i\\, and
\\\boldsymbol{\zeta}\_{i, t}\\ represents a vector of dynamic noise at
time \\t\\ and individual \\i\\. \\\boldsymbol{\alpha}\_{i}\\ denotes a
vector of intercepts, \\\boldsymbol{\beta}\_{i}\\ a matrix of
autoregression and cross regression coefficients, and
\\\boldsymbol{\Psi}\_{i}\\ the covariance matrix of
\\\boldsymbol{\zeta}\_{i, t}\\.

If `center = TRUE`, the dynamic structure is parameterized as follows
\$\$ \boldsymbol{\eta}\_{i, t} = \boldsymbol{\mu}\_{i} +
\boldsymbol{\beta}\_{i} \left( \boldsymbol{\eta}\_{i, t - 1} -
\boldsymbol{\mu}\_{i} \right) + \boldsymbol{\zeta}\_{i, t} \$\$ where
\\\boldsymbol{\mu}\_{i}\\ is equilibrium level of the latent state
toward which the system is pulled over time.

### Continuous-Time Dynamic Structure

The continuous-time parameterization, when `ct = TRUE`, for the dynamic
structure is given by \$\$ \mathrm{d} \boldsymbol{\eta}\_{i, t} = \left(
\boldsymbol{\alpha}\_{i} + \boldsymbol{\beta}\_{i}
\boldsymbol{\eta}\_{i, t - 1} \right) \mathrm{d} t +
\boldsymbol{\Psi}\_{i}^{\frac{1}{2}} \mathrm{d} \mathbf{W}\_{i, t} \$\$
note that \\\mathrm{d}\boldsymbol{W}\\ is a Wiener process or Brownian
motion, which represents random fluctuations.

If `center = TRUE`, the dynamic structure is parameterized as follows
\$\$ \mathrm{d} \boldsymbol{\eta}\_{i, t} = \boldsymbol{\beta}\_{i}
\left( \boldsymbol{\eta}\_{i, t - 1} - \boldsymbol{\mu}\_{i} \right)
\mathrm{d} t + \boldsymbol{\Psi}\_{i}^{\frac{1}{2}} \mathrm{d}
\mathbf{W}\_{i, t} \$\$

## References

Hunter, M. D. (2017). State space modeling in an open source, modular,
structural equation modeling environment. *Structural Equation Modeling:
A Multidisciplinary Journal*, *25*(2), 307–324.
[doi:10.1080/10705511.2017.1369354](https://doi.org/10.1080/10705511.2017.1369354)

Neale, M. C., Hunter, M. D., Pritikin, J. N., Zahery, M., Brick, T. R.,
Kirkpatrick, R. M., Estabrook, R., Bates, T. C., Maes, H. H., & Boker,
S. M. (2015). OpenMx 2.0: Extended structural equation and statistical
modeling. *Psychometrika*, *81*(2), 535–549.
[doi:10.1007/s11336-014-9435-8](https://doi.org/10.1007/s11336-014-9435-8)

## See also

Other VAR Functions:
[`LDL()`](https://github.com/jeksterslab/fitVARMxID/reference/LDL.md),
[`Softplus()`](https://github.com/jeksterslab/fitVARMxID/reference/Softplus.md)

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
# \donttest{
if (requireNamespace("simStateSpace")) {
  # Generate data using the simStateSpace package------------------------------
  set.seed(42)
  k <- 2
  n <- 5
  time <- 100
  alpha <- rep(x = 5, times = k)
  beta <- matrix(
    data = c(.5, .0, .2, .5),
    nrow = k,
    ncol = k
  )
  psi <- matrix(
    data = c(exp(-4.1), exp(-3.9), exp(-3.9), exp(-3.2)),
    nrow = k,
    ncol = k
  )
  psi_l <- t(chol(psi))
  nu <- rep(x = 0, times = k)
  lambda <- diag(k)
  theta <- matrix(
    data = c(exp(-2), 0, 0, exp(-2.8)),
    nrow = k,
    ncol = k
  )
  theta_l <- t(chol(theta))
  mu0 <- c(solve(diag(k) - beta) %*% alpha)
  sigma0 <- matrix(
    data = c(
      solve(diag(k * k) - beta %x% beta) %*% c(psi)
    ),
    nrow = k,
    ncol = k
  )
  sigma0_l <- t(chol(sigma0))
  sim <- simStateSpace::SimSSMIVary(
    n = n,
    time,
    mu0 = list(mu0),
    sigma0_l = list(sigma0_l),
    alpha = list(alpha),
    beta = simStateSpace::SimBetaN(
      n = n,
      beta = beta,
      vcov_beta_vec_l = t(chol(0.1 * diag(k * k)))
    ),
    psi_l = list(psi_l),
    nu = list(nu),
    lambda = list(lambda),
    theta_l = list(theta_l)
  )
  data <- as.data.frame(sim)

  # Fit the model--------------------------------------------------------------
  # center = TRUE
  library(fitVARMxID)
  fit <- FitVARMxID(
    data = data,
    observed = paste0("y", seq_len(k)),
    id = "id",
    center = TRUE
  )
  print(fit)
  summary(fit)
  coef(fit)
  vcov(fit)
  converged(fit)

  # Fit the model--------------------------------------------------------------
  # center = FALSE
  library(fitVARMxID)
  fit <- FitVARMxID(
    data = data,
    observed = paste0("y", seq_len(k)),
    id = "id",
    center = FALSE
  )
  print(fit)
  summary(fit)
  coef(fit)
  vcov(fit)
  converged(fit)
}
#> Loading required namespace: simStateSpace
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  261.741455570985
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=261.74146 (started at 54199.287)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.415704186356628,-0.225655128217158,0.553140467223163,0.883458384106277,22.1433211832929,6.42338411100903,0.0827945254965999,-1.32424724834834,-1.8252588751108
#> Running VAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  361.811050824503
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 24954555.3445604, 4809422.45256989, 4083.10411693719, 984.948866693679, 668.522553177851, 87.3155699365163, 35.4704846050821, 0.0278031363912394, -9.13078062753628e-06
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  230.811559685632
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=230.81156 (started at 131680.45)  (2 attempt(s): 2 valid, 0 errors)
#>  Start values from best fit:
#> -0.23371567328419,0.23540660433636,0.438880396516983,0.60078853100983,19.8062969288167,31.109092632209,0.256264226129729,-1.27622207909459,-2.01922068234644
#> Running VAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  212.767072274892
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=212.76707 (started at 52122.661)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.269579730236596,-0.287305915744978,0.00531490864950863,0.725307982034049,10.0564521607429,20.737096087717,0.29043401155569,-1.3646374767778,-2.05314990935433
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  255.954385318349
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID1 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=255.95439 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.928402311710576,0.528781772249116,0.0491747501628796,0.209058783720969,174.344786731371,123.714082571069,0.381442378253398,-0.851880107457717,-2.35249404639481
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  255.954385318347
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID1 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=255.95439 (started at 255.95439)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.928402311265314,0.528781771945667,0.0491747498519204,0.209058783508569,174.344786731387,123.714082571046,0.381442378246741,-0.851880107459579,-2.3524940463941
#> Running VAR_ID1 with 9 parameters
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  385.392348408044
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=385.39235 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 1.24969371516493,0.655500432392883,-0.202095485341708,0.469450353874719,-39800.133178969,-49165.0127252079,0.277376217689567,0.536382239752905,-2.20844171243098
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  385.392325274978
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=385.39233 (started at 385.39235)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.2496937106888,0.655500426367567,-0.202095490871939,0.469450353976363,-39800.133178969,-49165.0127252079,0.277376217689573,0.536382239752905,-2.20844171243097
#> Running VAR_ID5 with 9 parameters
#> Warning while fitting model: In model 'VAR_ID5' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_VAR_ID5.Rds
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = TRUE)
#> 
#> Estimated paramaters per individual.
#>                        beta_1_1 beta_2_1 beta_1_2 beta_2_2   mu_1_1   mu_2_1
#> FitVARMxID_VAR_ID1.Rds   0.9284   0.5288   0.0492   0.2091 174.3448 123.7141
#> FitVARMxID_VAR_ID2.Rds   0.4157  -0.2257   0.5531   0.8835  22.1433   6.4234
#> FitVARMxID_VAR_ID3.Rds  -0.2337   0.2354   0.4389   0.6008  19.8063  31.1091
#> FitVARMxID_VAR_ID4.Rds  -0.2696  -0.2873   0.0053   0.7253  10.0565  20.7371
#>                        psi_l_2_1 psi_d_1_1 psi_d_2_1
#> FitVARMxID_VAR_ID1.Rds    0.3814   -0.8519   -2.3525
#> FitVARMxID_VAR_ID2.Rds    0.0828   -1.3242   -1.8253
#> FitVARMxID_VAR_ID3.Rds    0.2563   -1.2762   -2.0192
#> FitVARMxID_VAR_ID4.Rds    0.2904   -1.3646   -2.0531
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  261.741455570928
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=261.74146 (started at 54199.287)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.415703979307483,-0.225655133176298,0.553140581670108,0.883458567386778,9.38521997393303,5.74534440333907,0.082794617536299,-1.32424641816906,-1.82525926757497
#> Running VAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  230.811559685633
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=230.81156 (started at 131680.45)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.233715691836807,0.235406578511356,0.438880399427613,0.600788536084216,10.7821683202445,7.75657383211122,0.256264232008785,-1.27622212158416,-2.01922062359526
#> Running VAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  212.767072274908
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=212.76707 (started at 52122.661)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.26957985478466,-0.287305984041313,0.0053150598422553,0.725308081128961,12.6572503707961,8.58559175726166,0.290434067522395,-1.36463685316954,-2.05314965883656
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running VAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running VAR_ID1 with 9 parameters
#> Warning while fitting model: In model 'VAR_ID1' Optimizer returned a non-zero status code 10. Starting values are not feasible. Consider mxTryHard()
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_VAR_ID1.Rds
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  272.223748598759
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  272.223748598757
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  272.223748598756
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running VAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=272.22375 (started at Inf)  (101 attempt(s): 5 valid, 96 errors)
#>  Start values from best fit:
#> -0.294737719974533,0.243006181955313,0.730540807465778,0.719964317900161,8.06329455394179,6.12127430358106,0.314206714226873,-0.815176804147568,-2.21967004377117
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  272.223748598756
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=272.22375 (started at 272.22375)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.294737719973995,0.243006181959594,0.730540807466597,0.719964317907277,8.06329455394178,6.1212743035812,0.314206714226913,-0.815176804147619,-2.2196700437713
#> Running VAR_ID5 with 9 parameters
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = FALSE)
#> 
#> Estimated paramaters per individual.
#>                        beta_1_1 beta_2_1 beta_1_2 beta_2_2 alpha_1_1 alpha_2_1
#> FitVARMxID_VAR_ID2.Rds   0.4157  -0.2257   0.5531   0.8835    9.3852    5.7453
#> FitVARMxID_VAR_ID3.Rds  -0.2337   0.2354   0.4389   0.6008   10.7822    7.7566
#> FitVARMxID_VAR_ID4.Rds  -0.2696  -0.2873   0.0053   0.7253   12.6573    8.5856
#> FitVARMxID_VAR_ID5.Rds  -0.2947   0.2430   0.7305   0.7200    8.0633    6.1213
#>                        psi_l_2_1 psi_d_1_1 psi_d_2_1
#> FitVARMxID_VAR_ID2.Rds    0.0828   -1.3242   -1.8253
#> FitVARMxID_VAR_ID3.Rds    0.2563   -1.2762   -2.0192
#> FitVARMxID_VAR_ID4.Rds    0.2904   -1.3646   -2.0531
#> FitVARMxID_VAR_ID5.Rds    0.3142   -0.8152   -2.2197
#>     1     2     3     4     5 
#> FALSE  TRUE  TRUE  TRUE  TRUE 
# }
```

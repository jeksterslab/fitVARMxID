# Fit the First-Order Vector Autoregressive Model by ID

The function fits the first-order vector autoregressive model for each
unit ID.

## Usage

``` r
FitVARMxID(
  data,
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

- time:

  Character string. A character string of the name of the TIME variable
  in the data. Used when `ct = TRUE`.

- ct:

  Logical. If TRUE, fit a continuous-time vector autoregressive model.
  If FALSE, fit a discrete-time vector autoregressive model.

- center:

  Logical. If `TRUE`, use the mean-centered (mean-reverting) state
  equation. When `center = TRUE`, `alpha` is implied and the set-point
  `mu` is estimated. When `center = FALSE`, `alpha` is estimated and
  `mu` is implied.

- mu_fixed:

  Logical. If `TRUE`, the set-point mean vector `mu` is fixed to
  `mu_values`. If `mu_fixed = TRUE` and `mu_values = NULL`, `mu` is
  fixed to a zero vector. If `FALSE`, `mu` is estimated.

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
  fixed to `alpha_values`. If `FALSE`, `alpha` is estimated.

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

  Numeric matrix. Values for `beta`. If `beta_fixed = TRUE`, these are
  fixed values; if `beta_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a diagonal matrix with -0.001 when `ct = TRUE` and
  0.001 when `ct = FALSE`.

- beta_lbound:

  Numeric matrix of lower bounds for `beta`. If `NULL`, defaults to
  -2.5. Ignored if `beta_fixed = TRUE`.

- beta_ubound:

  Numeric matrix. Upper bounds for `beta`. Ignored if
  `beta_fixed = TRUE`. If `NULL`, defaults to `+2.5`. If `NULL` and
  `ct = TRUE`, diagonal upper bounds are set to -1e-05.

- psi_diag:

  Logical. If `TRUE`, `psi` is diagonal. If `FALSE`, `psi` is symmetric.

- psi_fixed:

  Logical. If `TRUE`, the process noise covariance matrix `psi` is fixed
  using `psi_d_values` and `psi_l_values`. If `psi_d_values` is `NULL`
  it is fixed to a zero matrix. If `FALSE`, `psi` is estimated.

- psi_d_free:

  Logical vector indicating free/fixed status of the elements of
  `psi_d`. If `NULL`, all element of `psi_d` are free.

- psi_d_values:

  Numeric vector with starting values for `psi_d`. If
  `psi_fixed = TRUE`, these are fixed values. If `psi_fixed = FALSE`,
  these are starting values.

- psi_d_lbound:

  Numeric vector with lower bounds for `psi_d`. If `NULL`, no lower
  bounds are set.

- psi_d_ubound:

  Numeric vector with upper bounds for `psi_d`. If `NULL`, no upper
  bounds are set.

- psi_d_equal:

  Logical. When `TRUE`, all free diagonal elements of `psi_d` are
  constrained to be equal and estimated as a single shared parameter.
  Ignored if no diagonal elements are free.

- psi_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `psi_l` are free. If `NULL`, all element of `psi_l` are free. Ignored
  if `psi_diag = TRUE`.

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
  fixed to `nu_values`. If `FALSE`, `nu` is estimated.

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

  Logical. If `TRUE`, the measurement error covariance matrix `theta` is
  fixed using `theta_d_values` and `theta_l_values`. If `theta_d_values`
  is `NULL` it is fixed to a zero matrix. If `FALSE`, `theta` is
  estimated.

- theta_d_free:

  Logical vector indicating free/fixed status of the diagonal parameters
  `theta_d`. If `NULL`, all element of `theta_d` are free.

- theta_d_values:

  Numeric vector with starting values for `theta_d`. If
  `theta_fixed = TRUE`, these are fixed values. If
  `theta_fixed = FALSE`, these are starting values.

- theta_d_lbound:

  Numeric vector with lower bounds for `theta_d`. If `NULL`, no lower
  bounds are set.

- theta_d_ubound:

  Numeric vector with upper bounds for `theta_d`. If `NULL`, no upper
  bounds are set.

- theta_d_equal:

  Logical. When `TRUE`, all free diagonal elements of `theta_d` are
  constrained to be equal and estimated as a single shared parameter.
  Ignored if no diagonal elements are free.

- theta_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `theta_l` are free. If `NULL`, all element of `theta_l` are free.
  Ignored if `theta_diag = TRUE`.

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
  `mu0_fixed = TRUE` and `mu0_func = TRUE`, `mu0` is fixed to the
  implied stable mean vector. If `mu0_fixed = TRUE` and
  `mu0_values = NULL`, `mu0` is fixed to a zero vector. If `FALSE`,
  `mu0` is estimated.

- mu0_func:

  Logical. If `TRUE` and `mu0_fixed = TRUE`, `mu0` is fixed to the
  implied stable mean vector.

- mu0_free:

  Logical vector indicating which elements of `mu0` are free. Ignored if
  `mu0_fixed = TRUE`.

- mu0_values:

  Numeric vector of values for `mu0`. If `mu0_fixed = TRUE`, these are
  fixed values. If `mu0_fixed = FALSE`, these are starting values. If
  `NULL`, defaults to a vector of zeros. Ignored if `mu0_fixed = TRUE`
  and `mu0_func = TRUE`.

- mu0_lbound:

  Numeric vector of lower bounds for `mu0`. If `NULL`, no lower bounds
  are set. Ignored if `mu0_fixed = TRUE`.

- mu0_ubound:

  Numeric vector of upper bounds for `mu0`. If `NULL`, no upper bounds
  are set. Ignored if `mu0_fixed = TRUE`.

- sigma0_fixed:

  Logical. If `TRUE`, the initial condition covariance matrix `sigma0`
  is fixed using `sigma0_d_values` and `sigma0_l_values`. If
  `sigma0_fixed = TRUE` and `sigma0_func = TRUE`, `sigma0` is fixed to
  the implied stable covariance matrix. If `sigma0_fixed = TRUE` and
  `sigma0_d_values = NULL`, `sigma0` is fixed to a diffused matrix.

- sigma0_func:

  Logical. If `TRUE` and `sigma0_fixed = TRUE`, `sigma0` is fixed to the
  implied stable covariance matrix.

- sigma0_diag:

  Logical. If `TRUE`, `sigma0` is diagonal. If `FALSE`, `sigma0` is
  symmetric.

- sigma0_d_free:

  Logical vector indicating free/fixed status of the elements of
  `sigma0_d`. If `NULL`, all element of `sigma0_d` are free.

- sigma0_d_values:

  Numeric vector with starting values for `sigma0_d`. If
  `sigma0_fixed = TRUE`, these are fixed values. If
  `sigma0_fixed = FALSE`, these are starting values.

- sigma0_d_lbound:

  Numeric vector with lower bounds for `sigma0_d`. If `NULL`, no lower
  bounds are set.

- sigma0_d_ubound:

  Numeric vector with upper bounds for `sigma0_d`. If `NULL`, no upper
  bounds are set.

- sigma0_d_equal:

  Logical. When `TRUE`, all free diagonal elements of `sigma0_d` are
  constrained to be equal and estimated as a single shared parameter.
  Ignored if no diagonal elements are free.

- sigma0_l_free:

  Logical matrix indicating which strictly-lower-triangular elements of
  `sigma0_l` are free. If `NULL`, all element of `sigma0_l` are free.
  Ignored if `sigma0_diag = TRUE`.

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
  with argument `details = TRUE` for each `id` if `robust = TRUE`.

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
  # Generate data using the simStateSpace package-------------------------
  set.seed(42)
  k <- 2
  n <- 5
  time <- 1000
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
  mu0 <- c(solve(diag(k) - beta) %*% alpha)
  sigma0 <- matrix(
    data = c(
      solve(diag(k * k) - beta %x% beta) %*% c(psi)
    ),
    nrow = k,
    ncol = k
  )
  sigma0_l <- t(chol(sigma0))
  sim <- simStateSpace::SimSSMVARIVary(
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
    psi_l = list(psi_l)
  )
  data <- as.data.frame(sim)

  # Fit the model---------------------------------------------------------
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

  # Fit the model---------------------------------------------------------
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
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680924
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at 543507.22)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925663958558,-0.311710693305004,0.696664931071523,1.26918079053825,22.2886092165744,6.42900622790183,1.38463850855525,-3.78524447131076,-3.88839532112857
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  234.805881403454
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439244856952
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at 1370401.4)  (2 attempt(s): 2 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589977895221,-0.627717352556549,0.0279087578036358,1.09251578382059,19.3954829356476,27.6135476518868,0.216306649350992,-3.71767903403779,-2.40143176325302
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -676.226928762905
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 12692933.5541443, 5082125.54035973, 62228.4298422023, 35474.8713531244, 12912.7734362461, 3826.80841600975, 54.9504675873724, -0.0122982625842331, -8037.96380362918
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.185455317091
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at 532924.47)  (2 attempt(s): 2 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914318255171,-0.0389157022494018,0.151543518778766,0.920804343361053,13.5193677371909,19.1463948068189,0.502250430010748,-3.0282843509368,-3.29803891923869
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  4394.41517464572
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID1 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=4394.4152 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.387213224495656,0.98022840522461,0.862799747906933,-0.38016035258658,-16.8770740715867,-12.0030447329554,-0.224533798678506,-1.08649338071563,0.721648827788434
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  936.556196848265
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID1 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=936.5562 (started at 4394.4152)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.388415032360844,0.986947843656152,0.852524975306115,-0.376259334371942,102.897745080932,72.5168168650513,1.9795195164613,-1.44346353942805,-3.18233293964773
#> Running DTVAR_ID1 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID1' Optimizer returned a non-zero status code 5. The Hessian at the solution does not appear to be convex. See ?mxCheckIdentification for possible diagnosis (Mx status RED).
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID1.Rds
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  1073.08458528014
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=1073.0846 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.453197499967887,0.933491351939346,0.41124139853942,0.297921984488796,81.6385822870373,113.581726068693,0.0640522856163277,-1.39340361320559,-3.11738826545756
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  1072.93292044199
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=1072.9329 (started at 1073.0846)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.453185277266542,0.933505939392559,0.411227402831723,0.297939626544503,81.6385819993903,113.581726284942,0.0640529751448356,-1.39340357381734,-3.11738820978325
#> Running DTVAR_ID5 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID5' Optimizer returned a non-zero status code 5. The Hessian at the solution does not appear to be convex. See ?mxCheckIdentification for possible diagnosis (Mx status RED).
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID5.Rds
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = TRUE)
#> 
#> Estimated paramaters per individual.
#>                          mu[1,1] mu[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID2.Rds 22.2886  6.4290    0.6139   -0.3117    0.6967
#> FitVARMxID_DTVAR_ID3.Rds 19.3955 27.6135    0.8196   -0.6277    0.0279
#> FitVARMxID_DTVAR_ID4.Rds 13.5194 19.1464    1.0691   -0.0389    0.1515
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID2.Rds    1.2692   0.0224   0.0311   0.0633
#> FitVARMxID_DTVAR_ID3.Rds    1.0925   0.0240   0.0052   0.0878
#> FitVARMxID_DTVAR_ID4.Rds    0.9208   0.0473   0.0237   0.0482
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680929
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at 543507.22)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925650943882,-0.311710704398905,0.696664941917605,1.2691807755905,4.12619703320232,5.21703315939641,1.38463839941958,-3.78524426184915,-3.8883952941117
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439229094267
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.43922910563
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439229260516
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439229260785
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  Retry limit reached; Best fit=-490.43923 (started at 1370401.4)  (11 attempt(s): 5 valid, 6 errors)
#> 
#>  Uncertain solution found - consider parameter validity, try again, increase extraTries, change inits, change model, or check data!
#>  Start values from best fit:
#> 0.819194167326925,-0.627893754180086,0.0280100021365488,1.09269009844619,2.73320181554322,9.6182500886727,0.216412281330158,-3.71804017664149,-2.4010545450671
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.185455308426
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at 532924.47)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914283133281,-0.0389150859273811,0.151544166219861,0.920805002383015,-3.83629401610329,2.04240714276984,0.502252366762707,-3.02828400794647,-3.29803886805925
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID1 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID1' Optimizer returned a non-zero status code 10. Starting values are not feasible. Consider mxTryHard()
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID1.Rds
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439229260944
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt worse than current best:  -63.1030855836763 vs -490.439229260944
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt worse than current best:  -266.030755392306 vs -490.439229260944
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt worse than current best:  1614.06632342863 vs -490.439229260944
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439241637571
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43923)  (101 attempt(s): 5 valid, 96 errors)
#>  Start values from best fit:
#> 0.819525995264192,-0.627750047610458,0.0279257933923228,1.09255038193558,2.72922160938975,9.61976244310684,0.216262911093753,-3.71775371622978,-2.40134556292691
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439243026377
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819528947480135,-0.627728786950038,0.0279232292516296,1.0925366045336,2.72924360020162,9.61976778756486,0.216371642432573,-3.71773568620732,-2.40138548924927
#> Running DTVAR_ID3 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID3' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID3.Rds
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (101 attempt(s): 2 valid, 99 errors)
#>  Start values from best fit:
#> 1.069143098476,-0.0389154412315409,0.151544008229916,0.920804624971326,-3.8362934811459,2.0424185601676,0.502251258723934,-3.02828512377124,-3.29804121556413
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.18545530616
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309847606,-0.0389154412315626,0.151544008230008,0.920804624971259,-3.8362934811459,2.0424185601676,0.502251258723934,-3.02828512377124,-3.29804121556412
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.185455315311
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914309858853,-0.0389154412772902,0.151544008419958,0.920804624834543,-3.83629348113577,2.04241856016067,0.502251258720163,-3.0282851237649,-3.29804121555348
#> Running DTVAR_ID4 with 9 parameters
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt worse than current best:  -643.263682737676 vs -679.185455315311
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt worse than current best:  -643.263683248717 vs -679.185455315311
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt worse than current best:  -643.26368324896 vs -679.185455315311
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID4 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID4' Optimizer returned a non-zero status code 10. Starting values are not feasible. Consider mxTryHard()
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID4.Rds
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -3.84033777063617
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-3.8403378 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 1.2264231970191,0.228684397855124,-0.224900234064485,0.772954262761019,3.78668010736246,3.83972369739549,-0.0430956259104977,-2.75066628706014,-2.9631880226335
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -91.788878083611
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-91.788878 (started at -3.8403378)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.43686832737314,0.535140082156568,-0.358283525498027,0.561280742735033,3.24790512103999,3.98544282019512,0.186092939928584,-2.46926179325272,-3.26023467246771
#> Running DTVAR_ID5 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID5' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID5.Rds
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = FALSE)
#> 
#> Estimated paramaters per individual.
#>                          alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID2.Rds     4.1262      5.217    0.6139   -0.3117    0.6967
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID2.Rds    1.2692   0.0224   0.0311   0.0633
#>     1     2     3     4     5 
#> FALSE  TRUE FALSE FALSE FALSE 
# }
```

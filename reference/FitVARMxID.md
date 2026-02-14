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

  Logical. If `TRUE`, `mu0_fixed = TRUE`, and `ct = FALSE`, `mu0` is
  fixed to \\ (I - \beta)^{-1} \alpha \\. If `TRUE`, `mu0_fixed = TRUE`,
  and `ct = TRUE`, `mu0` is fixed to \\ (- \beta)^{-1} \alpha \\.

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
#>  Lowest minimum so far:  -2006.50904680926
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at 544587.56)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925644822838,-0.3117107125795,0.696664956255988,1.26918077358693,22.2886090468087,6.42900614863227,1.38463841691188,-3.78524418887331,-3.88839537989792
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  3138.3415236955
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  3138.34152236505
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -416.712887435151
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -423.922869281029
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -428.875357755292
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Retry limit reached; Best fit=-428.87536 (started at 1373137.1)  (11 attempt(s): 6 valid, 5 errors)
#>  Start values from best fit:
#> 0.40919405169369,0.239407549968517,0.235734144675435,0.904458106652633,27.875214905445,51.1628950383248,1.11395165668254,-3.9538700275063,-2.08849375810961
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -324.126503646958
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.185455317157
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at 533983.66)  (2 attempt(s): 2 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914315179884,-0.0389155279329557,0.151543683356584,0.920804424127448,13.519507668085,19.1463323302148,0.502250715574917,-3.0282839938684,-3.29803857160099
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
#>  Lowest minimum so far:  2088.06846350718
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
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID1 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=2088.0685 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.492629232460229,1.04631829942934,0.723737672524558,-0.492666972522939,108.438082619778,77.6030454446797,0.722600954892901,-0.608351296281494,-2.41982305872174
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  410.666054146401
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID1 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=410.66605 (started at 2088.0685)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.603678321522442,0.638863364325392,0.552588544055802,0.109223887996742,353.965532614869,252.587251140754,1.4163997221531,-1.04639919073713,-4.06783915181608
#> Running DTVAR_ID1 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID1' Optimizer returned a non-zero status code 5. The Hessian at the solution does not appear to be convex. See ?mxCheckIdentification for possible diagnosis (Mx status RED).
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID1.Rds
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439244856799
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
#>  Fit attempt worse than current best:  4560.14823422602 vs -490.439244856799
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Fit attempt worse than current best:  -399.864673246382 vs -490.439244856799
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -428.87536)  (101 attempt(s): 3 valid, 98 errors)
#>  Start values from best fit:
#> 0.819589885390902,-0.627717073651347,0.0279087799749296,1.09251574307257,19.3954855468257,27.6135657390951,0.216306941142164,-3.7176790017195,-2.40143217149311
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -490.439244857326
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-490.43924 (started at -490.43924)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.819589881281391,-0.627717075219871,0.0279087527710399,1.09251574102933,19.3954855433819,27.6135657396072,0.216306944620236,-3.71767900067079,-2.4014321646359
#> Running DTVAR_ID3 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Fit attempt worse than current best:  156822.932063768 vs -490.439244857326
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
#>  Fit attempt worse than current best:  -39.2647973648326 vs -490.439244857326
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#> 
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  All fit attempts resulted in errors - check starting values or model specification
#> Running DTVAR_ID3 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID3' Optimizer returned a non-zero status code 10. Starting values are not feasible. Consider mxTryHard()
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
#>  Fit attempt worse than current best:  -635.801174355365 vs -679.185455317157
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
#>  Fit attempt worse than current best:  -679.185313696298 vs -679.185455317157
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
#>  Lowest minimum so far:  -679.185455317966
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
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID4 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at -679.18546)  (101 attempt(s): 5 valid, 96 errors)
#>  Start values from best fit:
#> 1.0691430115605,-0.0389153511242097,0.151543861262467,0.920804714844384,13.5194020098795,19.1463865174707,0.502251219522781,-3.02828421038879,-3.29803897908265
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
#> 1.0691430115605,-0.0389153511242097,0.151543861262467,0.920804714844384,13.5194020098795,19.1463865174707,0.502251219522781,-3.02828421038879,-3.29803897908265
#> Running DTVAR_ID4 with 9 parameters
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
#>  Lowest minimum so far:  -26.2178540124633
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
#>  Solution found!  Final fit=-26.217854 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.556538699436443,0.835928196290113,0.270052250813355,0.490930379157918,64.6999287617251,99.8366972879436,2.2890199055189,-3.27072322803567,-2.39324140201176
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -29.627670307727
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-29.62767 (started at -26.217854)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.554140071085522,0.833501949493939,0.270049928495044,0.495134035172941,64.5865787663836,99.9061850271711,2.24111084402289,-3.24417645284363,-2.40057820471322
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
#> FitVARMxID_DTVAR_ID4.Rds 13.5194 19.1464    1.0691   -0.0389    0.1515
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID2.Rds    1.2692   0.0224   0.0311   0.0633
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
#>  Lowest minimum so far:  -2006.50904680916
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at 544587.56)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925653421851,-0.31171069927635,0.696664910533061,1.26918073903987,4.12619720344027,5.2170333235646,1.38463832921955,-3.78524426852718,-3.8883951687138
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -58.474635334402
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -220.626727959147
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 94218843.2474381, 37654931.4040492, 409725.317319899, 234587.363719308, 152239.286966861, 22021.9410658739, 12883.1965386577, 514.499638833692, -20472.2423237415
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 94218843.2474381, 37654931.4040492, 409725.317319899, 234587.363719308, 152239.286966861, 22021.9410658739, 12883.1965386577, 514.499638833692, -20472.2423237415
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt worse than current best:  312.389920824989 vs -220.626727959147
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
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
#>  Retry limit reached; Best fit=-220.62673 (started at 1373137.1)  (11 attempt(s): 4 valid, 7 errors)
#> 
#>  Uncertain solution found - consider parameter validity, try again, increase extraTries, change inits, change model, or check data!
#>  Start values from best fit:
#> 1.51276736371576,0.779949323856165,-0.343302136398418,0.478320455351682,0.508749073040253,0.770165942018559,0.316317997587402,-2.77691879539552,-3.08268146828559
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  822.457182096013
#>  Eigenvalues of Hessian could not be calculated
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -679.185455309818
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-679.18546 (started at 533983.66)  (2 attempt(s): 2 valid, 0 errors)
#>  Start values from best fit:
#> 1.06914298789861,-0.0389152980118336,0.15154393429609,0.920804793177589,-3.83629081478566,2.04241362107811,0.502251385577738,-3.028284248967,-3.29803906510228
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
#>  Lowest minimum so far:  91.2243616397737
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
#>  Fit attempt worse than current best:  3807.52675034381 vs 91.2243616397737
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
#>  Solution found!  Final fit=91.224362 (started at Inf)  (101 attempt(s): 2 valid, 99 errors)
#>  Start values from best fit:
#> 0.800338563165953,-0.168694662383004,0.235844177612992,1.19926126533611,5.69873573561694,4.77413738649633,1.44902830561005,-2.54718749406633,-2.71319366490177
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  -920.029825552849
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID1 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-920.02983 (started at 91.224362)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.80109540080201,-0.168211060284876,0.234966975084596,1.19867138191401,5.68882975844854,4.7946065712877,0.272500375031593,-3.65736732862463,-2.91976770098969
#> Running DTVAR_ID1 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID1' Optimizer returned a non-zero status code 5. The Hessian at the solution does not appear to be convex. See ?mxCheckIdentification for possible diagnosis (Mx status RED).
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID1.Rds
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680919
#> 
#> Beginning fit attempt 1 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 2 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 3 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 9 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 10 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 11 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 12 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 13 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 14 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 15 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 16 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 17 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 18 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 19 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 20 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 21 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 22 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 23 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 24 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 25 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 26 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 27 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 28 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 29 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 30 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 31 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 32 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 33 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 34 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 35 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 36 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 37 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 38 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 39 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 40 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 41 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 42 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 43 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 44 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 45 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 46 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 47 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 48 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 49 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 50 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 51 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 52 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 53 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 54 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 55 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 56 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680927
#> 
#> Beginning fit attempt 57 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 58 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 59 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 60 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 61 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 62 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 63 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 64 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 65 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 66 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 67 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 68 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 69 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 70 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 71 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 72 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 73 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 74 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 75 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 76 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 77 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 78 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 79 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 80 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 81 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 82 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 83 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 84 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 85 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 86 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 87 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 88 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 89 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 90 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 91 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 92 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 93 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 94 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 95 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 96 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 97 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 98 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 99 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 100 of at maximum 100 extra tries
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Retry limit reached
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID2 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at -2006.509)  (101 attempt(s): 2 valid, 99 errors)
#>  Start values from best fit:
#> 0.613925651852878,-0.311710707839771,0.696664924821736,1.26918076425858,4.12619711454645,5.21703330203295,1.38463837373816,-3.78524420607875,-3.88839529045126
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680928
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID2 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at -2006.509)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.61392565193048,-0.311710707866778,0.696664924845818,1.26918076425124,4.12619711454981,5.21703330203179,1.38463837373838,-3.78524420607897,-3.88839529045118
#> Running DTVAR_ID2 with 9 parameters
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680928
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID2 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at -2006.509)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925651930729,-0.311710707866836,0.696664924845883,1.26918076425125,4.12619711454981,5.21703330203179,1.38463837373837,-3.78524420607897,-3.88839529045118
#> Running DTVAR_ID2 with 9 parameters
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -2006.50904680929
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID2 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-2006.509 (started at -2006.509)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.613925652254256,-0.3117107073862,0.696664925019837,1.26918076441086,4.12619711455892,5.21703330205559,1.384638373749,-3.78524420608989,-3.88839529044694
#> Running DTVAR_ID2 with 9 parameters
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
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
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Fit attempt generated errors
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
#>  Solution found!  Final fit=-220.62673 (started at -220.62673)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 1.51276736371576,0.779949323856165,-0.343302136398418,0.478320455351682,0.508749073040253,0.770165942018559,0.316317997587402,-2.77691879539552,-3.08268146828559
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID3 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-220.62673 (started at -220.62673)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.51276736371576,0.779949323856165,-0.343302136398418,0.478320455351682,0.508749073040253,0.770165942018559,0.316317997587402,-2.77691879539552,-3.08268146828559
#> Running DTVAR_ID3 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID3' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID3.Rds
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
#>  Lowest minimum so far:  -27.7967597568974
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
#>  Lowest minimum so far:  -507.573316636614
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
#>  Lowest minimum so far:  -507.573517049737
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
#>  Fit attempt worse than current best:  -348.768292398626 vs -507.573517049737
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
#>  Solution found!  Final fit=-507.57352 (started at Inf)  (101 attempt(s): 4 valid, 97 errors)
#>  Start values from best fit:
#> 0.38934024092681,-0.738593617620785,0.324368356567475,1.39165644425097,4.93478561947719,5.99724214299126,0.408643983764102,-3.99759738315589,-2.12944452684209
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -507.573517224647
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running DTVAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-507.57352 (started at -507.57352)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.38934024092681,-0.738593617620785,0.324368356567475,1.39165644425097,4.93478561947719,5.99724214299126,0.408643983764102,-3.99759738315589,-2.12944452684209
#> Running DTVAR_ID5 with 9 parameters
#> Warning while fitting model: In model 'DTVAR_ID5' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_DTVAR_ID5.Rds
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = FALSE)
#> 
#> Estimated paramaters per individual.
#>                          alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID2.Rds     4.1262     5.2170    0.6139   -0.3117    0.6967
#> FitVARMxID_DTVAR_ID4.Rds    -3.8363     2.0424    1.0691   -0.0389    0.1515
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID2.Rds    1.2692   0.0224   0.0311   0.0633
#> FitVARMxID_DTVAR_ID4.Rds    0.9208   0.0473   0.0237   0.0482
#>     1     2     3     4     5 
#> FALSE  TRUE FALSE  TRUE FALSE 
# }
```

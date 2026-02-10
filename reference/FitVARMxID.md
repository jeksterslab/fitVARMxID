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
  # Generate data using the simStateSpace package-------------------------
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
#>  Lowest minimum so far:  -156.165519752088
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-156.16552 (started at 54332.983)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.600666637905534,-0.242836639531462,0.507300432194747,0.868972470492169,22.2061895938147,6.35642067221015,1.35783912245496,-4.26255357084455,-4.03064538865763
#> Running VAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  126.208853407844
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 6129456021662.3, 760617355782.55, 10793.6408020778, 1550.69409995003, 778.974028813001, 91.3474936230169, 40.7941098622792, 2.20181196694099e-05, -2.80984362362227e-07
#> 
#> Beginning fit attempt 1 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  126.208852228151
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 6129456021719.93, 760617355812.035, 10695.4660211392, 1527.5340984878, 772.095429626269, 91.2646012281619, 40.3881578182675, 5.4156972640155e-06, -1.78254512963622e-09
#> 
#> Beginning fit attempt 2 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  126.20885222815
#>  OpenMx status code 6 not in list of acceptable status codes, (0,0)
#>  Not all eigenvalues of the Hessian are positive: 6129456021719.84, 760617355812.078, 10695.4632280555, 1527.43229180088, 772.098792120305, 91.2659539863282, 40.3854660132553, 5.42424455672206e-06, -1.47327618142992e-09
#> 
#> Beginning fit attempt 3 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 4 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 5 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 6 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 7 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Fit attempt generated errors
#> 
#> Beginning fit attempt 8 of at maximum 10 extra tries
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -11.4438272413655
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-11.443827 (started at 131317.99)  (9 attempt(s): 4 valid, 5 errors)
#>  Start values from best fit:
#> -0.268860212384699,0.17837966691769,0.463170515090129,0.620113583752009,19.7877588268632,31.0445226558951,0.604116299154288,-2.11406027299003,-3.83819613635346
#> Running VAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -50.1748977379811
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-50.174898 (started at 51536.777)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.310335332839783,-0.377166876810066,0.0225444323918314,0.686601469405921,9.96708364816587,20.6127612199032,0.670180339997816,-2.33822933420131,-3.90926746760732
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
#>  Lowest minimum so far:  168.431464554518
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
#>  Solution found!  Final fit=168.43146 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 1.36129508445238,0.946255015444958,-0.272433936830734,0.286471836114167,-26555.7122261824,-35212.0190824777,0.420399574710996,-0.481983854011414,-3.77638185376731
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  168.431428060812
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=168.43143 (started at 168.43146)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 1.36129509268054,0.946255014162884,-0.272433943217364,0.286471834414613,-26555.7122261824,-35212.0190824777,0.420399574711056,-0.48198385401143,-3.7763818537673
#> Running VAR_ID5 with 9 parameters
#> Warning while fitting model: In model 'VAR_ID5' Optimizer returned a non-zero status code 6. The model does not satisfy the first-order optimality conditions to the required accuracy, and no improved point for the merit function could be found during the final linesearch (Mx status RED)
#> Check /__w/fitVARMxID/fitVARMxID/pkgdown/reference/FitVARMxID_VAR_ID5.Rds
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = TRUE)
#> 
#> Estimated paramaters per individual.
#>                        beta_1_1 beta_2_1 beta_1_2 beta_2_2  mu_1_1  mu_2_1
#> FitVARMxID_VAR_ID2.Rds   0.6007  -0.2428   0.5073   0.8690 22.2062  6.3564
#> FitVARMxID_VAR_ID3.Rds  -0.2689   0.1784   0.4632   0.6201 19.7878 31.0445
#> FitVARMxID_VAR_ID4.Rds  -0.3103  -0.3772   0.0225   0.6866  9.9671 20.6128
#>                        psi_l_2_1 psi_d_1_1 psi_d_2_1
#> FitVARMxID_VAR_ID2.Rds    1.3578   -4.2626   -4.0306
#> FitVARMxID_VAR_ID3.Rds    0.6041   -2.1141   -3.8382
#> FitVARMxID_VAR_ID4.Rds    0.6702   -2.3382   -3.9093
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
#>  Lowest minimum so far:  -156.165519752187
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-156.16552 (started at 54332.983)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.600666643555528,-0.242836571479876,0.507300414494874,0.868972479930698,5.6430574104346,6.22534099749061,1.35783873494353,-4.26255355702332,-4.03064645913183
#> Running VAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -11.4438272413661
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-11.443827 (started at 131317.99)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.26886021576741,0.178379669413808,0.463170516933256,0.620113581965425,10.7289923300278,8.26365863542347,0.60411630051337,-2.11406028211938,-3.83819612524343
#> Running VAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -50.1748977379814
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-50.174898 (started at 51536.777)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.310335336006757,-0.377166874823998,0.0225444313934275,0.686601468604766,12.5955189098219,10.2192628813681,0.670180330417527,-2.33822930906944,-3.90926745189581
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
#>  Lowest minimum so far:  -194.408374797766
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
#>  Warning messages generated from final run for Hessian/SEs/CIs
#> 
#> 
#>  Solution found!  Final fit=-194.40837 (started at Inf)  (101 attempt(s): 1 valid, 100 errors)
#>  Start values from best fit:
#> 0.268438557951157,0.340181194806338,0.991694056345226,0.479559801854262,4.88208591749433,5.1905391148066,1.33037652263983,-4.15324982075839,-4.23797390848991
#> Running VAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  -194.408374797787
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID1 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-194.40837 (started at -194.40837)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.268438557868973,0.340181194450548,0.991694056275148,0.479559801605282,4.88208591748676,5.19053911480454,1.3303765226391,-4.15324982075851,-4.23797390849018
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
#>  Lowest minimum so far:  -0.507633441754291
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
#>  Lowest minimum so far:  -0.50763344175476
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
#> 
#> 
#>  Solution found!  Final fit=-0.50763344 (started at Inf)  (101 attempt(s): 5 valid, 96 errors)
#>  Start values from best fit:
#> -0.237822963571762,0.25640444512497,0.718543685234467,0.7131069376793,6.676886162202,5.98739261184793,0.652599753736532,-2.43201736557673,-3.97786468996457
#> Running VAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running VAR_ID5 with 9 parameters
#> 
#> Solution found
#> Final run, for Hessian and/or standard errors and/or confidence intervals
#> Running VAR_ID5 with 9 parameters
#> 
#> 
#>  Solution found!  Final fit=-0.50763344 (started at -0.50763344)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> -0.237822963571762,0.25640444512497,0.718543685234467,0.7131069376793,6.676886162202,5.98739261184793,0.652599753736532,-2.43201736557673,-3.97786468996457
#> Running VAR_ID5 with 9 parameters
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(k)), id = "id", 
#>     center = FALSE)
#> 
#> Estimated paramaters per individual.
#>                        beta_1_1 beta_2_1 beta_1_2 beta_2_2 alpha_1_1 alpha_2_1
#> FitVARMxID_VAR_ID1.Rds   0.2684   0.3402   0.9917   0.4796    4.8821    5.1905
#> FitVARMxID_VAR_ID2.Rds   0.6007  -0.2428   0.5073   0.8690    5.6431    6.2253
#> FitVARMxID_VAR_ID3.Rds  -0.2689   0.1784   0.4632   0.6201   10.7290    8.2637
#> FitVARMxID_VAR_ID4.Rds  -0.3103  -0.3772   0.0225   0.6866   12.5955   10.2193
#> FitVARMxID_VAR_ID5.Rds  -0.2378   0.2564   0.7185   0.7131    6.6769    5.9874
#>                        psi_l_2_1 psi_d_1_1 psi_d_2_1
#> FitVARMxID_VAR_ID1.Rds    1.3304   -4.1532   -4.2380
#> FitVARMxID_VAR_ID2.Rds    1.3578   -4.2626   -4.0306
#> FitVARMxID_VAR_ID3.Rds    0.6041   -2.1141   -3.8382
#> FitVARMxID_VAR_ID4.Rds    0.6702   -2.3382   -3.9093
#> FitVARMxID_VAR_ID5.Rds    0.6526   -2.4320   -3.9779
#>    1    2    3    4    5 
#> TRUE TRUE TRUE TRUE TRUE 
# }
```

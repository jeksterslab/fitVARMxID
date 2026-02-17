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

  Numeric vector of lower bounds for `mu`. Ignored if `mu_fixed = TRUE`.

- mu_ubound:

  Numeric vector of upper bounds for `mu`. Ignored if `mu_fixed = TRUE`.

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

  Numeric vector of lower bounds for `alpha`. Ignored if
  `alpha_fixed = TRUE`.

- alpha_ubound:

  Numeric vector of upper bounds for `alpha`. Ignored if
  `alpha_fixed = TRUE`.

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

  Numeric vector with lower bounds for `psi_d`.

- psi_d_ubound:

  Numeric vector with upper bounds for `psi_d`.

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
  elements of `psi_l`.

- psi_l_lbound:

  Numeric matrix with lower bounds for `psi_l`.

- psi_l_ubound:

  Numeric matrix with upper bounds for `psi_l`.

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

  Numeric vector of lower bounds for `nu`. Ignored if `nu_fixed = TRUE`.

- nu_ubound:

  Numeric vector of upper bounds for `nu`. Ignored if `nu_fixed = TRUE`.

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

  Numeric vector with lower bounds for `theta_d`.

- theta_d_ubound:

  Numeric vector with upper bounds for `theta_d`.

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
  elements of `theta_l`.

- theta_l_lbound:

  Numeric matrix with lower bounds for `theta_l`.

- theta_l_ubound:

  Numeric matrix with upper bounds for `theta_l`.

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

  Numeric vector of lower bounds for `mu0`. Ignored if
  `mu0_fixed = TRUE`.

- mu0_ubound:

  Numeric vector of upper bounds for `mu0`. Ignored if
  `mu0_fixed = TRUE`.

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

  Numeric vector with lower bounds for `sigma0_d`.

- sigma0_d_ubound:

  Numeric vector with upper bounds for `sigma0_d`.

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
  elements of `sigma0_l`.

- sigma0_l_lbound:

  Numeric matrix with lower bounds for `sigma0_l`.

- sigma0_l_ubound:

  Numeric matrix with upper bounds for `sigma0_l`.

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
# Generate data using the simStateSpace package-------------------------
library(simStateSpace)
set.seed(42)
n <- 5
time <- 100
p <- 2
alpha <- rep(x = 0, times = p)
beta <- 0.50 * diag(p)
psi <- 0.001 * diag(p)
psi_l <- t(chol(psi))
mu0 <- c(solve(diag(p) - beta) %*% alpha)
sigma0 <- 0.001 * diag(p)
sigma0_l <- t(chol(sigma0))
sim <- SimSSMVARFixed(
  n = n,
  time = time,
  mu0 = mu0,
  sigma0_l = sigma0_l,
  alpha = alpha,
  beta = beta,
  psi_l = psi_l
)
data <- as.data.frame(sim)

# Fit the model---------------------------------------------------------
# center = TRUE
library(fitVARMxID)
fit <- FitVARMxID(
  data = data,
  observed = paste0("y", seq_len(p)),
  id = "id",
  center = TRUE
)
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  -822.233310857072
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-822.23331 (started at 367.82458)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.333255235874515,-0.0190078579680448,0.0253174057993243,0.538199749441363,0.00585624429422293,0.00698157994581803,0.0637991978587235,-6.91227254045474,-6.98947178825476
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -834.103680044234
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-834.10368 (started at 367.84317)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.546443668600148,-0.0198810899386076,-0.0486261839451521,0.29760593766888,-0.00290343702187972,-0.0198340549701762,0.176756267757068,-7.1430331762074,-6.87738047710758
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -809.349912767649
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-809.34991 (started at 367.86864)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.526506539927637,-0.331249774636361,0.0107365836906109,0.361870971922639,-0.00398081357232432,-0.00186660445547687,-0.211711126942597,-6.97411259654669,-6.79982124985088
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -845.547008646625
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-845.54701 (started at 367.80212)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.163120376755857,-0.122515378092891,-0.0298428734950942,0.481831952143276,-0.0131786707036089,0.00328809796190097,0.0067695392340292,-7.23336693515515,-6.90008558315242
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -832.621477783958
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-832.62148 (started at 367.79735)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.298976135839197,0.0346764636342011,-0.0805245358712663,0.46505503037652,-0.00110658965003196,0.00343347823188512,-0.166539197627056,-6.9118389685454,-7.0926180643914
print(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = TRUE)
#> 
#> Convergence: 100.0%
#> 
#> Estimated paramaters per individual.
#>                          mu[1,1] mu[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID1.Rds  0.0059  0.0070    0.3333   -0.0190    0.0253
#> FitVARMxID_DTVAR_ID2.Rds -0.0029 -0.0198    0.5464   -0.0199   -0.0486
#> FitVARMxID_DTVAR_ID3.Rds -0.0040 -0.0019    0.5265   -0.3312    0.0107
#> FitVARMxID_DTVAR_ID4.Rds -0.0132  0.0033    0.1631   -0.1225   -0.0298
#> FitVARMxID_DTVAR_ID5.Rds -0.0011  0.0034    0.2990    0.0347   -0.0805
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID1.Rds    0.5382    1e-03    1e-04   0.0009
#> FitVARMxID_DTVAR_ID2.Rds    0.2976    8e-04    1e-04   0.0011
#> FitVARMxID_DTVAR_ID3.Rds    0.3619    9e-04   -2e-04   0.0012
#> FitVARMxID_DTVAR_ID4.Rds    0.4818    7e-04    0e+00   0.0010
#> FitVARMxID_DTVAR_ID5.Rds    0.4651    1e-03   -2e-04   0.0009
summary(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = TRUE)
#> 
#> Convergence: 100.0%
#> 
#> Estimated paramaters per individual.
#>                          mu[1,1] mu[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID1.Rds  0.0059  0.0070    0.3333   -0.0190    0.0253
#> FitVARMxID_DTVAR_ID2.Rds -0.0029 -0.0198    0.5464   -0.0199   -0.0486
#> FitVARMxID_DTVAR_ID3.Rds -0.0040 -0.0019    0.5265   -0.3312    0.0107
#> FitVARMxID_DTVAR_ID4.Rds -0.0132  0.0033    0.1631   -0.1225   -0.0298
#> FitVARMxID_DTVAR_ID5.Rds -0.0011  0.0034    0.2990    0.0347   -0.0805
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID1.Rds    0.5382    1e-03    1e-04   0.0009
#> FitVARMxID_DTVAR_ID2.Rds    0.2976    8e-04    1e-04   0.0011
#> FitVARMxID_DTVAR_ID3.Rds    0.3619    9e-04   -2e-04   0.0012
#> FitVARMxID_DTVAR_ID4.Rds    0.4818    7e-04    0e+00   0.0010
#> FitVARMxID_DTVAR_ID5.Rds    0.4651    1e-03   -2e-04   0.0009
coef(fit)
#> $FitVARMxID_DTVAR_ID1.Rds
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#>  0.0058562443  0.0069815799  0.3332552359 -0.0190078580  0.0253174058 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.5381997494  0.0009950078  0.0000634807  0.0009251688 
#> 
#> $FitVARMxID_DTVAR_ID2.Rds
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0029034370 -0.0198340550  0.5464436686 -0.0198810899 -0.0486261839 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.2976059377  0.0007900490  0.0001396461  0.0010550032 
#> 
#> $FitVARMxID_DTVAR_ID3.Rds
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0039808136 -0.0018666045  0.5265065399 -0.3312497746  0.0107365837 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.3618709719  0.0009353688 -0.0001980280  0.0011552890 
#> 
#> $FitVARMxID_DTVAR_ID4.Rds
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -1.317867e-02  3.288098e-03  1.631204e-01 -1.225154e-01 -2.984287e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  4.818320e-01  7.218350e-04  4.886490e-06  1.007235e-03 
#> 
#> $FitVARMxID_DTVAR_ID5.Rds
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0011065897  0.0034334782  0.2989761358  0.0346764636 -0.0805245359 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.4650550304  0.0009954390 -0.0001657796  0.0008584919 
#> 
vcov(fit)
#> $FitVARMxID_DTVAR_ID1.Rds
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    2.233593e-05  2.711542e-06 -5.049385e-06  4.434975e-06  1.419090e-05
#> mu[2,1]    2.711542e-06  4.222457e-05 -7.088442e-08  9.302565e-08 -5.291408e-06
#> beta[1,1] -5.049385e-06 -7.088442e-08  8.835988e-03  5.263598e-04 -6.352512e-04
#> beta[2,1]  4.434975e-06  9.302565e-08  5.263598e-04  8.194446e-03 -5.796621e-05
#> beta[1,2]  1.419090e-05 -5.291408e-06 -6.352512e-04 -5.796621e-05  7.849227e-03
#> beta[2,2]  1.543252e-06  2.377231e-05 -3.784400e-05 -5.758321e-04  4.616822e-04
#> psi[1,1]  -3.967023e-11  3.768185e-10 -6.521545e-08 -2.734337e-09 -1.450287e-09
#> psi[2,1]   8.567453e-10  1.416755e-09 -1.110670e-08 -4.858043e-08 -4.087946e-08
#> psi[2,2]   1.584657e-10 -4.988053e-10 -1.591340e-09  7.524202e-10 -7.100112e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]    1.543252e-06 -3.967023e-11  8.567453e-10  1.584657e-10
#> mu[2,1]    2.377231e-05  3.768185e-10  1.416755e-09 -4.988053e-10
#> beta[1,1] -3.784400e-05 -6.521545e-08 -1.110670e-08 -1.591340e-09
#> beta[2,1] -5.758321e-04 -2.734337e-09 -4.858043e-08  7.524202e-10
#> beta[1,2]  4.616822e-04 -1.450287e-09 -4.087946e-08 -7.100112e-09
#> beta[2,2]  7.235417e-03  2.369987e-09  8.110770e-09 -1.014152e-07
#> psi[1,1]   2.369987e-09  1.980597e-08  1.264520e-09  8.072315e-11
#> psi[2,1]   8.110770e-09  1.264520e-09  9.244351e-09  1.175447e-09
#> psi[2,2]  -1.014152e-07  8.072315e-11  1.175447e-09  1.712423e-08
#> 
#> $FitVARMxID_DTVAR_ID2.Rds
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    3.705351e-05  1.058942e-06 -1.877369e-06 -7.689656e-07 -6.261832e-06
#> mu[2,1]    1.058942e-06  2.112573e-05 -5.578203e-07 -5.257306e-06  2.947167e-06
#> beta[1,1] -1.877369e-06 -5.578203e-07  7.018983e-03  1.249410e-03 -7.510025e-04
#> beta[2,1] -7.689656e-07 -5.257306e-06  1.249410e-03  9.426809e-03 -1.556410e-04
#> beta[1,2] -6.261832e-06  2.947167e-06 -7.510025e-04 -1.556410e-04  6.902944e-03
#> beta[2,2] -5.400272e-07 -5.664552e-06 -1.332651e-04 -1.005671e-03  1.220838e-03
#> psi[1,1]   9.849754e-11  3.911971e-10 -8.348740e-08 -4.866270e-09 -1.034223e-09
#> psi[2,1]   2.134886e-10  1.007771e-09 -2.861814e-09 -3.014807e-08 -4.301166e-08
#> psi[2,2]  -2.810225e-11 -1.258764e-10 -5.919666e-12 -6.052651e-10 -4.902449e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -5.400272e-07  9.849754e-11  2.134886e-10 -2.810225e-11
#> mu[2,1]   -5.664552e-06  3.911971e-10  1.007771e-09 -1.258764e-10
#> beta[1,1] -1.332651e-04 -8.348740e-08 -2.861814e-09 -5.919666e-12
#> beta[2,1] -1.005671e-03 -4.866270e-09 -3.014807e-08 -6.052651e-10
#> beta[1,2]  1.220838e-03 -1.034223e-09 -4.301166e-08 -4.902449e-09
#> beta[2,2]  9.203810e-03 -1.389036e-10 -3.226622e-09 -6.199440e-08
#> psi[1,1]  -1.389036e-10  1.248670e-08  2.204978e-09  3.904869e-10
#> psi[2,1]  -3.226622e-09  2.204978e-09  8.525043e-09  2.947909e-09
#> psi[2,2]  -6.199440e-08  3.904869e-10  2.947909e-09  2.226597e-08
#> 
#> $FitVARMxID_DTVAR_ID3.Rds
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    3.956465e-05 -2.605512e-05 -2.689226e-06 -1.339019e-07  6.028045e-06
#> mu[2,1]   -2.605512e-05  4.447480e-05 -7.426768e-06  1.170020e-05 -1.748228e-05
#> beta[1,1] -2.689226e-06 -7.426768e-06  8.526695e-03 -1.788195e-03  2.714848e-03
#> beta[2,1] -1.339019e-07  1.170020e-05 -1.788195e-03  1.031885e-02 -5.843406e-04
#> beta[1,2]  6.028045e-06 -1.748228e-05  2.714848e-03 -5.843406e-04  6.670957e-03
#> beta[2,2] -1.690799e-06  6.489087e-06 -5.971570e-04  3.286143e-03 -1.443809e-03
#> psi[1,1]  -1.312948e-09  9.972140e-10 -9.150418e-08  6.913170e-08 -1.007768e-08
#> psi[2,1]  -4.578084e-09 -2.040000e-09  1.000294e-07 -6.344638e-08  8.698298e-09
#> psi[2,2]   3.650955e-09 -3.008838e-10 -5.830741e-08  4.041893e-09  6.987421e-10
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -1.690799e-06 -1.312948e-09 -4.578084e-09  3.650955e-09
#> mu[2,1]    6.489087e-06  9.972140e-10 -2.040000e-09 -3.008838e-10
#> beta[1,1] -5.971570e-04 -9.150418e-08  1.000294e-07 -5.830741e-08
#> beta[2,1]  3.286143e-03  6.913170e-08 -6.344638e-08  4.041893e-09
#> beta[1,2] -1.443809e-03 -1.007768e-08  8.698298e-09  6.987421e-10
#> beta[2,2]  8.023238e-03  3.011425e-09  1.138262e-08 -7.842541e-08
#> psi[1,1]   3.011425e-09  1.747280e-08 -3.703242e-09  8.009035e-10
#> psi[2,1]   1.138262e-08 -3.703242e-09  1.123285e-08 -4.604302e-09
#> psi[2,2]  -7.842541e-08  8.009035e-10 -4.604302e-09  2.672319e-08
#> 
#> $FitVARMxID_DTVAR_ID4.Rds
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    1.047358e-05 -3.615253e-06  4.293831e-06 -1.482836e-06 -1.315178e-07
#> mu[2,1]   -3.615253e-06  3.796395e-05  3.391114e-07 -2.948432e-06  7.138941e-06
#> beta[1,1]  4.293831e-06  3.391114e-07  9.817313e-03  4.733717e-05  2.376923e-04
#> beta[2,1] -1.482836e-06 -2.948432e-06  4.733717e-05  1.343079e-02 -2.621492e-05
#> beta[1,2] -1.315178e-07  7.138941e-06  2.376923e-04 -2.621492e-05  5.440657e-03
#> beta[2,2]  6.401391e-08 -1.550832e-06 -2.643971e-06  3.316132e-04  2.321236e-05
#> psi[1,1]   1.711329e-10  5.480349e-10 -2.047104e-08  1.743606e-08  9.209791e-09
#> psi[2,1]   1.299650e-10 -2.878504e-09  6.543352e-09 -4.816932e-08 -5.273417e-08
#> psi[2,2]  -2.564160e-10 -7.815142e-10 -5.468959e-09 -1.044796e-10 -5.426176e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]    6.401391e-08  1.711329e-10  1.299650e-10 -2.564160e-10
#> mu[2,1]   -1.550832e-06  5.480349e-10 -2.878504e-09 -7.815142e-10
#> beta[1,1] -2.643971e-06 -2.047104e-08  6.543352e-09 -5.468959e-09
#> beta[2,1]  3.316132e-04  1.743606e-08 -4.816932e-08 -1.044796e-10
#> beta[1,2]  2.321236e-05  9.209791e-09 -5.273417e-08 -5.426176e-09
#> beta[2,2]  7.416751e-03 -1.354025e-09  1.683624e-08 -9.209035e-08
#> psi[1,1]  -1.354025e-09  1.042173e-08  7.198991e-11  1.472669e-12
#> psi[2,1]   1.683624e-08  7.198991e-11  7.278373e-09  1.005518e-10
#> psi[2,2]  -9.209035e-08  1.472669e-12  1.005518e-10  2.029715e-08
#> 
#> $FitVARMxID_DTVAR_ID5.Rds
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    2.115599e-05 -6.313085e-06 -8.455222e-07 -6.523996e-06  3.222463e-07
#> mu[2,1]   -6.313085e-06  2.860499e-05  3.811191e-08  2.385850e-08 -7.184013e-07
#> beta[1,1] -8.455222e-07  3.811191e-08  9.210378e-03 -1.531006e-03  1.918390e-03
#> beta[2,1] -6.523996e-06  2.385850e-08 -1.531006e-03  8.024902e-03 -3.269920e-04
#> beta[1,2]  3.222463e-07 -7.184013e-07  1.918390e-03 -3.269920e-04  9.408317e-03
#> beta[2,2] -7.624169e-08 -6.813719e-06 -3.182397e-04  1.663490e-03 -1.555718e-03
#> psi[1,1]  -1.570878e-10 -1.912446e-11 -6.118108e-08  1.015120e-08 -2.502559e-09
#> psi[2,1]  -9.423487e-10 -3.964165e-10  1.307761e-08 -2.859344e-08 -2.763634e-08
#> psi[2,2]   4.550814e-10  2.122827e-10 -4.880256e-10 -5.905289e-09  2.300960e-08
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -7.624169e-08 -1.570878e-10 -9.423487e-10  4.550814e-10
#> mu[2,1]   -6.813719e-06 -1.912446e-11 -3.964165e-10  2.122827e-10
#> beta[1,1] -3.182397e-04 -6.118108e-08  1.307761e-08 -4.880256e-10
#> beta[2,1]  1.663490e-03  1.015120e-08 -2.859344e-08 -5.905289e-09
#> beta[1,2] -1.555718e-03 -2.502559e-09 -2.763634e-08  2.300960e-08
#> beta[2,2]  8.163135e-03  1.412009e-09  8.753244e-09 -8.080474e-08
#> psi[1,1]   1.412009e-09  1.982295e-08 -3.301305e-09  5.509737e-10
#> psi[2,1]   8.753244e-09 -3.301305e-09  8.820453e-09 -2.848674e-09
#> psi[2,2]  -8.080474e-08  5.509737e-10 -2.848674e-09  1.474366e-08
#> 
converged(fit)
#>    1    2    3    4    5 
#> TRUE TRUE TRUE TRUE TRUE 

# Fit the model---------------------------------------------------------
# center = FALSE
library(fitVARMxID)
fit <- FitVARMxID(
  data = data,
  observed = paste0("y", seq_len(p)),
  id = "id",
  center = FALSE
)
#> Running DTVAR_ID1 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID1 with 9 parameters
#> 
#>  Lowest minimum so far:  -822.233310857433
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-822.23331 (started at 367.82458)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.333254943464222,-0.0190080920894466,0.0253166561249842,0.538198970140709,0.00372785429892239,0.00333544147994188,0.0637988049163301,-6.91227127020935,-6.98947243154168
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -834.103680044339
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-834.10368 (started at 367.84317)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.546443807198358,-0.0198812369809403,-0.0486262708077796,0.297604929683324,-0.00228132570015841,-0.0139890583409225,0.176755845224718,-7.1430336059661,-6.87737952481038
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -809.349912768023
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-809.34991 (started at 367.86864)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.52650778827242,-0.331250495775968,0.0107371020578199,0.361871011553281,-0.0018648750616947,-0.00250975063094179,-0.211711607160665,-6.97411291000763,-6.79982064268018
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -845.547008646618
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-845.54701 (started at 367.80212)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.163120379284031,-0.12251515099738,-0.0298429410055069,0.481831987255303,-0.0109308305895661,8.92031211728531e-05,0.0067695242979424,-7.23336706933092,-6.90008554905431
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -832.621477783842
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-832.62148 (started at 367.79735)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.298976061038617,0.0346760656606741,-0.0805248147352181,0.465054537969198,-0.000499265322332591,0.00187510576974513,-0.166539205052085,-6.91183952406312,-7.09261698384688
print(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = FALSE)
#> 
#> Convergence: 100.0%
#> 
#> Estimated paramaters per individual.
#>                          alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID1.Rds     0.0037     0.0033    0.3333   -0.0190    0.0253
#> FitVARMxID_DTVAR_ID2.Rds    -0.0023    -0.0140    0.5464   -0.0199   -0.0486
#> FitVARMxID_DTVAR_ID3.Rds    -0.0019    -0.0025    0.5265   -0.3313    0.0107
#> FitVARMxID_DTVAR_ID4.Rds    -0.0109     0.0001    0.1631   -0.1225   -0.0298
#> FitVARMxID_DTVAR_ID5.Rds    -0.0005     0.0019    0.2990    0.0347   -0.0805
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID1.Rds    0.5382    1e-03    1e-04   0.0009
#> FitVARMxID_DTVAR_ID2.Rds    0.2976    8e-04    1e-04   0.0011
#> FitVARMxID_DTVAR_ID3.Rds    0.3619    9e-04   -2e-04   0.0012
#> FitVARMxID_DTVAR_ID4.Rds    0.4818    7e-04    0e+00   0.0010
#> FitVARMxID_DTVAR_ID5.Rds    0.4651    1e-03   -2e-04   0.0009
summary(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = FALSE)
#> 
#> Convergence: 100.0%
#> 
#> Estimated paramaters per individual.
#>                          alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2]
#> FitVARMxID_DTVAR_ID1.Rds     0.0037     0.0033    0.3333   -0.0190    0.0253
#> FitVARMxID_DTVAR_ID2.Rds    -0.0023    -0.0140    0.5464   -0.0199   -0.0486
#> FitVARMxID_DTVAR_ID3.Rds    -0.0019    -0.0025    0.5265   -0.3313    0.0107
#> FitVARMxID_DTVAR_ID4.Rds    -0.0109     0.0001    0.1631   -0.1225   -0.0298
#> FitVARMxID_DTVAR_ID5.Rds    -0.0005     0.0019    0.2990    0.0347   -0.0805
#>                          beta[2,2] psi[1,1] psi[2,1] psi[2,2]
#> FitVARMxID_DTVAR_ID1.Rds    0.5382    1e-03    1e-04   0.0009
#> FitVARMxID_DTVAR_ID2.Rds    0.2976    8e-04    1e-04   0.0011
#> FitVARMxID_DTVAR_ID3.Rds    0.3619    9e-04   -2e-04   0.0012
#> FitVARMxID_DTVAR_ID4.Rds    0.4818    7e-04    0e+00   0.0010
#> FitVARMxID_DTVAR_ID5.Rds    0.4651    1e-03   -2e-04   0.0009
coef(fit)
#> $FitVARMxID_DTVAR_ID1.Rds
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#>  3.727854e-03  3.335441e-03  3.332549e-01 -1.900809e-02  2.531666e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  5.381990e-01  9.950090e-04  6.348039e-05  9.251682e-04 
#> 
#> $FitVARMxID_DTVAR_ID2.Rds
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0022813257 -0.0139890583  0.5464438072 -0.0198812370 -0.0486262708 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.2976049297  0.0007900487  0.0001396457  0.0010550040 
#> 
#> $FitVARMxID_DTVAR_ID3.Rds
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0018648751 -0.0025097506  0.5265077883 -0.3312504958  0.0107371021 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.3618710116  0.0009353686 -0.0001980284  0.0011552898 
#> 
#> $FitVARMxID_DTVAR_ID4.Rds
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -1.093083e-02  8.920312e-05  1.631204e-01 -1.225152e-01 -2.984294e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  4.818320e-01  7.218349e-04  4.886479e-06  1.007235e-03 
#> 
#> $FitVARMxID_DTVAR_ID5.Rds
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0004992653  0.0018751058  0.2989760610  0.0346760657 -0.0805248147 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.4650545380  0.0009954385 -0.0001657795  0.0008584927 
#> 
vcov(fit)
#> $FitVARMxID_DTVAR_ID1.Rds
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  1.040405e-05  6.552696e-07 -5.067549e-05  2.780217e-07
#> alpha[2,1]  6.552696e-07  9.491882e-06 -2.947575e-06 -4.384114e-05
#> beta[1,1]  -5.067549e-05 -2.947575e-06  8.835687e-03  5.262839e-04
#> beta[2,1]   2.780217e-07 -4.384114e-05  5.262839e-04  8.194423e-03
#> beta[1,2]  -4.148412e-05 -5.058188e-06 -6.349792e-04 -5.800685e-05
#> beta[2,2]  -2.576055e-06 -3.613426e-05 -3.765706e-05 -5.758213e-04
#> psi[1,1]    3.554102e-10  1.727894e-10 -6.520834e-08 -2.782115e-09
#> psi[2,1]    8.838387e-10  8.969550e-10 -1.081656e-08 -4.839606e-08
#> psi[2,2]    1.767759e-10  4.767859e-10 -1.517461e-09  7.292320e-10
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -4.148412e-05 -2.576055e-06  3.554102e-10  8.838387e-10
#> alpha[2,1] -5.058188e-06 -3.613426e-05  1.727894e-10  8.969550e-10
#> beta[1,1]  -6.349792e-04 -3.765706e-05 -6.520834e-08 -1.081656e-08
#> beta[2,1]  -5.800685e-05 -5.758213e-04 -2.782115e-09 -4.839606e-08
#> beta[1,2]   7.849008e-03  4.618133e-04 -1.408814e-09 -4.073178e-08
#> beta[2,2]   4.618133e-04  7.235332e-03  2.386326e-09  8.175094e-09
#> psi[1,1]   -1.408814e-09  2.386326e-09  1.980604e-08  1.264524e-09
#> psi[2,1]   -4.073178e-08  8.175094e-09  1.264524e-09  9.244155e-09
#> psi[2,2]   -7.103329e-09 -1.014094e-07  8.071384e-11  1.175388e-09
#>                 psi[2,2]
#> alpha[1,1]  1.767759e-10
#> alpha[2,1]  4.767859e-10
#> beta[1,1]  -1.517461e-09
#> beta[2,1]   7.292320e-10
#> beta[1,2]  -7.103329e-09
#> beta[2,2]  -1.014094e-07
#> psi[1,1]    8.071384e-11
#> psi[2,1]    1.175388e-09
#> psi[2,2]    1.712419e-08
#> 
#> $FitVARMxID_DTVAR_ID2.Rds
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  1.029524e-05  1.893469e-06  4.604283e-06 -6.326424e-08
#> alpha[2,1]  1.893469e-06  1.387131e-05  5.535183e-07  3.718259e-06
#> beta[1,1]   4.604283e-06  5.535183e-07  7.019096e-03  1.249509e-03
#> beta[2,1]  -6.326424e-08  3.718259e-06  1.249509e-03  9.426717e-03
#> beta[1,2]   1.320382e-04  2.570837e-05 -7.510597e-04 -1.556326e-04
#> beta[2,2]   2.330721e-05  1.756397e-04 -1.333661e-04 -1.005536e-03
#> psi[1,1]   -2.001642e-10  2.585105e-10 -8.355541e-08 -4.898985e-09
#> psi[2,1]   -7.164322e-10  5.616828e-10 -2.783940e-09 -3.005815e-08
#> psi[2,2]   -1.167814e-10 -1.320160e-09 -1.643699e-11 -6.136534e-10
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1]  1.320382e-04  2.330721e-05 -2.001642e-10 -7.164322e-10
#> alpha[2,1]  2.570837e-05  1.756397e-04  2.585105e-10  5.616828e-10
#> beta[1,1]  -7.510597e-04 -1.333661e-04 -8.355541e-08 -2.783940e-09
#> beta[2,1]  -1.556326e-04 -1.005536e-03 -4.898985e-09 -3.005815e-08
#> beta[1,2]   6.903057e-03  1.220867e-03 -1.073580e-09 -4.308214e-08
#> beta[2,2]   1.220867e-03  9.203803e-03 -2.008538e-10 -3.182954e-09
#> psi[1,1]   -1.073580e-09 -2.008538e-10  1.248670e-08  2.204916e-09
#> psi[2,1]   -4.308214e-08 -3.182954e-09  2.204916e-09  8.524983e-09
#> psi[2,2]   -4.939743e-09 -6.199169e-08  3.904725e-10  2.947893e-09
#>                 psi[2,2]
#> alpha[1,1] -1.167814e-10
#> alpha[2,1] -1.320160e-09
#> beta[1,1]  -1.643699e-11
#> beta[2,1]  -6.136534e-10
#> beta[1,2]  -4.939743e-09
#> beta[2,2]  -6.199169e-08
#> psi[1,1]    3.904725e-10
#> psi[2,1]    2.947893e-09
#> psi[2,2]    2.226604e-08
#> 
#> $FitVARMxID_DTVAR_ID3.Rds
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.340843e-06 -1.963146e-06  3.781785e-05 -8.399116e-06
#> alpha[2,1] -1.963146e-06  1.174954e-05 -1.386467e-05  5.463494e-05
#> beta[1,1]   3.781785e-05 -1.386467e-05  8.526967e-03 -1.788364e-03
#> beta[2,1]  -8.399116e-06  5.463494e-05 -1.788364e-03  1.031903e-02
#> beta[1,2]   2.630207e-05 -1.418238e-05  2.714901e-03 -5.844808e-04
#> beta[2,2]  -5.944130e-06  3.164117e-05 -5.973533e-04  3.286390e-03
#> psi[1,1]   -1.016129e-09  4.827497e-10 -9.151607e-08  6.918818e-08
#> psi[2,1]   -1.733814e-09 -3.052105e-09  9.956372e-08 -6.371291e-08
#> psi[2,2]    1.502141e-09  8.891827e-10 -5.812852e-08  4.237814e-09
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1]  2.630207e-05 -5.944130e-06 -1.016129e-09 -1.733814e-09
#> alpha[2,1] -1.418238e-05  3.164117e-05  4.827497e-10 -3.052105e-09
#> beta[1,1]   2.714901e-03 -5.973533e-04 -9.151607e-08  9.956372e-08
#> beta[2,1]  -5.844808e-04  3.286390e-03  6.918818e-08 -6.371291e-08
#> beta[1,2]   6.671131e-03 -1.444095e-03 -1.006865e-08  8.387432e-09
#> beta[2,2]  -1.444095e-03  8.023660e-03  3.017719e-09  1.093295e-08
#> psi[1,1]   -1.006865e-08  3.017719e-09  1.747277e-08 -3.703282e-09
#> psi[2,1]    8.387432e-09  1.093295e-08 -3.703282e-09  1.123360e-08
#> psi[2,2]    8.322652e-10 -7.819309e-08  8.009451e-10 -4.604690e-09
#>                 psi[2,2]
#> alpha[1,1]  1.502141e-09
#> alpha[2,1]  8.891827e-10
#> beta[1,1]  -5.812852e-08
#> beta[2,1]   4.237814e-09
#> beta[1,2]   8.322652e-10
#> beta[2,2]  -7.819309e-08
#> psi[1,1]    8.009451e-10
#> psi[2,1]   -4.604690e-09
#> psi[2,2]    2.672343e-08
#> 
#> $FitVARMxID_DTVAR_ID4.Rds
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.026113e-06  6.933757e-08  1.321985e-04 -6.160165e-07
#> alpha[2,1]  6.933757e-08  1.223571e-05  1.337887e-06  1.742009e-04
#> beta[1,1]   1.321985e-04  1.337887e-06  9.817131e-03  4.757226e-05
#> beta[2,1]  -6.160165e-07  1.742009e-04  4.757226e-05  1.343078e-02
#> beta[1,2]  -1.465319e-05  3.262029e-06  2.377439e-04 -2.618116e-05
#> beta[2,2]  -1.038912e-07 -2.081403e-05 -2.659061e-06  3.315292e-04
#> psi[1,1]   -1.401861e-10  5.401248e-10 -2.044338e-08  1.750339e-08
#> psi[2,1]    2.846303e-10 -2.169138e-09  6.715402e-09 -4.845605e-08
#> psi[2,2]   -2.918403e-10 -1.350043e-10 -5.436418e-09 -1.150139e-10
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -1.465319e-05 -1.038912e-07 -1.401861e-10  2.846303e-10
#> alpha[2,1]  3.262029e-06 -2.081403e-05  5.401248e-10 -2.169138e-09
#> beta[1,1]   2.377439e-04 -2.659061e-06 -2.044338e-08  6.715402e-09
#> beta[2,1]  -2.618116e-05  3.315292e-04  1.750339e-08 -4.845605e-08
#> beta[1,2]   5.440650e-03  2.313063e-05  9.246764e-09 -5.272430e-08
#> beta[2,2]   2.313063e-05  7.416896e-03 -1.338132e-09  1.669386e-08
#> psi[1,1]    9.246764e-09 -1.338132e-09  1.042171e-08  7.203822e-11
#> psi[2,1]   -5.272430e-08  1.669386e-08  7.203822e-11  7.278619e-09
#> psi[2,2]   -5.391685e-09 -9.206201e-08  1.478190e-12  1.005329e-10
#>                 psi[2,2]
#> alpha[1,1] -2.918403e-10
#> alpha[2,1] -1.350043e-10
#> beta[1,1]  -5.436418e-09
#> beta[2,1]  -1.150139e-10
#> beta[1,2]  -5.391685e-09
#> beta[2,2]  -9.206201e-08
#> psi[1,1]    1.478190e-12
#> psi[2,1]    1.005329e-10
#> psi[2,2]    2.029716e-08
#> 
#> $FitVARMxID_DTVAR_ID5.Rds
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.974665e-06 -1.651261e-06  3.016483e-06 -5.142903e-06
#> alpha[2,1] -1.651261e-06  8.564402e-06 -5.523771e-07  3.407704e-06
#> beta[1,1]   3.016483e-06 -5.523771e-07  9.210067e-03 -1.530817e-03
#> beta[2,1]  -5.142903e-06  3.407704e-06 -1.530817e-03  8.024700e-03
#> beta[1,2]  -3.001107e-05  4.583139e-06  1.918125e-03 -3.269145e-04
#> beta[2,2]   4.386532e-06 -2.982906e-05 -3.179716e-04  1.663464e-03
#> psi[1,1]   -1.708399e-10  1.608177e-12 -6.118749e-08  1.019606e-08
#> psi[2,1]   -5.829635e-10 -2.407718e-10  1.288749e-08 -2.855128e-08
#> psi[2,2]    2.566603e-10  3.686716e-10 -4.602463e-10 -5.911527e-09
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -3.001107e-05  4.386532e-06 -1.708399e-10 -5.829635e-10
#> alpha[2,1]  4.583139e-06 -2.982906e-05  1.608177e-12 -2.407718e-10
#> beta[1,1]   1.918125e-03 -3.179716e-04 -6.118749e-08  1.288749e-08
#> beta[2,1]  -3.269145e-04  1.663464e-03  1.019606e-08 -2.855128e-08
#> beta[1,2]   9.407954e-03 -1.555423e-03 -2.488572e-09 -2.770077e-08
#> beta[2,2]  -1.555423e-03  8.162993e-03  1.432996e-09  8.667184e-09
#> psi[1,1]   -2.488572e-09  1.432996e-09  1.982293e-08 -3.301351e-09
#> psi[2,1]   -2.770077e-08  8.667184e-09 -3.301351e-09  8.820625e-09
#> psi[2,2]    2.297280e-08 -8.076767e-08  5.509566e-10 -2.848785e-09
#>                 psi[2,2]
#> alpha[1,1]  2.566603e-10
#> alpha[2,1]  3.686716e-10
#> beta[1,1]  -4.602463e-10
#> beta[2,1]  -5.911527e-09
#> beta[1,2]   2.297280e-08
#> beta[2,2]  -8.076767e-08
#> psi[1,1]    5.509566e-10
#> psi[2,1]   -2.848785e-09
#> psi[2,2]    1.474378e-08
#> 
converged(fit)
#>    1    2    3    4    5 
#> TRUE TRUE TRUE TRUE TRUE 
# }
```

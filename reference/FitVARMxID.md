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
  seed = NULL,
  tries_explore = 100,
  tries_local = 100,
  max_attempts = 10,
  silent = FALSE,
  ncores = NULL
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
  `ct = TRUE`, diagonal upper bounds are set to `-1e-05`.

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

- seed:

  Random seed for reproducibility.

- tries_explore:

  Integer. Number of extra tries for the wide exploration phase.

- tries_local:

  Integer. Number of extra tries for local polishing.

- max_attempts:

  Integer. Maximum number of remediation attempts after the first
  Hessian computation fails the criteria.

- silent:

  Logical. If `TRUE`, suppresses messages during the model fitting
  stage.

- ncores:

  Positive integer. Number of cores to use.

## Value

Returns an object of class `varmxid` which is a list with the following
elements:

- call:

  Function call.

- args:

  List of function arguments.

- fun:

  Function used ("FitVARMxID").

- model:

  A list of generated OpenMx models.

- output:

  A list of fitted OpenMx models.

- converged:

  A logical vector indicating converged cases.

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
\boldsymbol{\eta}\_{i, t} \right) \mathrm{d} t +
\boldsymbol{\Psi}\_{i}^{\frac{1}{2}} \mathrm{d} \mathbf{W}\_{i, t} \$\$
note that \\\mathrm{d}\boldsymbol{W}\\ is a Wiener process or Brownian
motion, which represents random fluctuations.

If `center = TRUE`, the dynamic structure is parameterized as follows
\$\$ \mathrm{d} \boldsymbol{\eta}\_{i, t} = \boldsymbol{\beta}\_{i}
\left( \boldsymbol{\eta}\_{i, t} - \boldsymbol{\mu}\_{i} \right)
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
mu0 <- simStateSpace::SSMMeanEta(
  beta = beta,
  alpha = alpha
)
sigma0 <- simStateSpace::SSMCovEta(
  beta = beta,
  psi = psi
)
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
#>  Lowest minimum so far:  -822.060942313193
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-822.06094 (started at 367.82482)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.331612745243841,-0.0197631400065759,0.0270181292624815,0.539260086092713,0.0057946951525851,0.007106199232002,0.0623713422440293,-6.91195717901486,-6.98806630902827
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -834.035953636412
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-834.03595 (started at 367.84346)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.546679030340841,-0.0201020488638611,-0.0487574618599386,0.297450290600703,-0.00284153166188121,-0.0199122101192943,0.176134255014816,-7.14253861726531,-6.87719884724769
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -808.550007472268
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-808.55001 (started at 367.87017)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.528105561142997,-0.332501283495961,0.0108536161301484,0.361419705300276,-0.00426229999671594,-0.00173173484843314,-0.21387789357269,-6.9657202697529,-6.80024208411447
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -845.339407101868
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-845.33941 (started at 367.80199)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.160844162100514,-0.121824766994102,-0.0298919550660853,0.481815653357755,-0.0130955259827441,0.00326100822229185,0.00601848006477796,-7.23151794331632,-6.89984913049538
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -832.354548096018
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-832.35455 (started at 367.7976)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.299055985152669,0.0348621727088368,-0.0801687055865619,0.465890390856868,-0.00111115045695215,0.00331563195705935,-0.166419668597626,-6.91180267781828,-7.08999323366805
print(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = TRUE)
#> 
#> Convergence:
#> 100.0%
#> 
#> Estimated paramaters per individual.
#>   mu[1,1] mu[2,1] beta[1,1] beta[2,1] beta[1,2] beta[2,2] psi[1,1] psi[2,1]
#> 1  0.0058  0.0071    0.3316   -0.0198    0.0270    0.5393    1e-03    1e-04
#> 2 -0.0028 -0.0199    0.5467   -0.0201   -0.0488    0.2975    8e-04    1e-04
#> 3 -0.0043 -0.0017    0.5281   -0.3325    0.0109    0.3614    9e-04   -2e-04
#> 4 -0.0131  0.0033    0.1608   -0.1218   -0.0299    0.4818    7e-04    0e+00
#> 5 -0.0011  0.0033    0.2991    0.0349   -0.0802    0.4659    1e-03   -2e-04
#>   psi[2,2]
#> 1   0.0009
#> 2   0.0011
#> 3   0.0012
#> 4   0.0010
#> 5   0.0009
summary(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = TRUE)
#> 
#> Convergence:
#> 100.0%
#> 
#> Estimated paramaters per individual.
#>   mu[1,1] mu[2,1] beta[1,1] beta[2,1] beta[1,2] beta[2,2] psi[1,1] psi[2,1]
#> 1  0.0058  0.0071    0.3316   -0.0198    0.0270    0.5393    1e-03    1e-04
#> 2 -0.0028 -0.0199    0.5467   -0.0201   -0.0488    0.2975    8e-04    1e-04
#> 3 -0.0043 -0.0017    0.5281   -0.3325    0.0109    0.3614    9e-04   -2e-04
#> 4 -0.0131  0.0033    0.1608   -0.1218   -0.0299    0.4818    7e-04    0e+00
#> 5 -0.0011  0.0033    0.2991    0.0349   -0.0802    0.4659    1e-03   -2e-04
#>   psi[2,2]
#> 1   0.0009
#> 2   0.0011
#> 3   0.0012
#> 4   0.0010
#> 5   0.0009
coef(fit)
#> $`1`
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#>  5.794695e-03  7.106199e-03  3.316127e-01 -1.976314e-02  2.701813e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  5.392601e-01  9.953214e-04  6.207953e-05  9.262857e-04 
#> 
#> $`2`
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0028415317 -0.0199122101  0.5466790303 -0.0201020489 -0.0487574619 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.2974502906  0.0007904397  0.0001392235  0.0010550290 
#> 
#> $`3`
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0042623000 -0.0017317348  0.5281055611 -0.3325012835  0.0108536161 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.3614197053  0.0009432480 -0.0002017399  0.0011560438 
#> 
#> $`4`
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -1.309553e-02  3.261008e-03  1.608442e-01 -1.218248e-01 -2.989196e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  4.818157e-01  7.231704e-04  4.352386e-06  1.007466e-03 
#> 
#> $`5`
#>       mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0011111505  0.0033156320  0.2990559852  0.0348621727 -0.0801687056 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.4658903909  0.0009954751 -0.0001656666  0.0008606361 
#> 
vcov(fit)
#> $`1`
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    2.224531e-05  2.743979e-06 -5.546138e-06  5.372819e-06  1.426060e-05
#> mu[2,1]    2.743979e-06  4.246265e-05 -8.513834e-08  2.692920e-07 -6.084754e-06
#> beta[1,1] -5.546138e-06 -8.513834e-08  8.856671e-03  5.015831e-04 -6.327507e-04
#> beta[2,1]  5.372819e-06  2.692920e-07  5.015831e-04  8.222799e-03 -5.447017e-05
#> beta[1,2]  1.426060e-05 -6.084754e-06 -6.327507e-04 -5.447017e-05  7.838173e-03
#> beta[2,2]  1.561657e-06  2.505703e-05 -3.578235e-05 -5.710681e-04  4.375766e-04
#> psi[1,1]  -6.356703e-11  4.508286e-10 -6.465520e-08 -2.604991e-09 -2.201980e-09
#> psi[2,1]   1.052388e-09  1.585577e-09 -1.335929e-08 -4.590393e-08 -4.219508e-08
#> psi[2,2]   2.048862e-10 -5.688192e-10 -2.195562e-09  1.320718e-09 -6.345910e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]    1.561657e-06 -6.356703e-11  1.052388e-09  2.048862e-10
#> mu[2,1]    2.505703e-05  4.508286e-10  1.585577e-09 -5.688192e-10
#> beta[1,1] -3.578235e-05 -6.465520e-08 -1.335929e-08 -2.195562e-09
#> beta[2,1] -5.710681e-04 -2.604991e-09 -4.590393e-08  1.320718e-09
#> beta[1,2]  4.375766e-04 -2.201980e-09 -4.219508e-08 -6.345910e-09
#> beta[2,2]  7.234812e-03  3.359103e-09  1.100977e-08 -1.024578e-07
#> psi[1,1]   3.359103e-09  1.981853e-08  1.237250e-09  7.717316e-11
#> psi[2,1]   1.100977e-08  1.237250e-09  9.257098e-09  1.150936e-09
#> psi[2,2]  -1.024578e-07  7.717316e-11  1.150936e-09  1.716564e-08
#> 
#> $`2`
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    3.711430e-05  1.028041e-06 -1.259632e-06 -1.486527e-06 -6.233540e-06
#> mu[2,1]    1.028041e-06  2.111878e-05 -5.442272e-07 -5.152523e-06  3.401863e-06
#> beta[1,1] -1.259632e-06 -5.442272e-07  7.020210e-03  1.240322e-03 -7.462724e-04
#> beta[2,1] -1.486527e-06 -5.152523e-06  1.240322e-03  9.418442e-03 -1.528294e-04
#> beta[1,2] -6.233540e-06  3.401863e-06 -7.462724e-04 -1.528294e-04  6.909651e-03
#> beta[2,2] -5.125566e-07 -6.251956e-06 -1.319441e-04 -9.994834e-04  1.212534e-03
#> psi[1,1]   1.736505e-10  4.490027e-10 -8.316323e-08 -4.757987e-09 -5.289942e-10
#> psi[2,1]   4.315405e-10  1.152683e-09 -1.582423e-09 -3.001699e-08 -4.177727e-08
#> psi[2,2]  -6.295115e-11 -1.484608e-10 -2.478939e-10 -5.296051e-10 -4.988704e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -5.125566e-07  1.736505e-10  4.315405e-10 -6.295115e-11
#> mu[2,1]   -6.251956e-06  4.490027e-10  1.152683e-09 -1.484608e-10
#> beta[1,1] -1.319441e-04 -8.316323e-08 -1.582423e-09 -2.478939e-10
#> beta[2,1] -9.994834e-04 -4.757987e-09 -3.001699e-08 -5.296051e-10
#> beta[1,2]  1.212534e-03 -5.289942e-10 -4.177727e-08 -4.988704e-09
#> beta[2,2]  9.204832e-03 -6.900777e-10 -4.464222e-09 -6.176501e-08
#> psi[1,1]  -6.900777e-10  1.249914e-08  2.199571e-09  3.880986e-10
#> psi[2,1]  -4.464222e-09  2.199571e-09  8.528443e-09  2.938846e-09
#> psi[2,2]  -6.176501e-08  3.880986e-10  2.938846e-09  2.226704e-08
#> 
#> $`3`
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    4.014794e-05 -2.654775e-05 -4.975392e-06  3.545267e-08  6.952597e-06
#> mu[2,1]   -2.654775e-05  4.483621e-05 -7.485950e-06  1.159674e-05 -2.039629e-05
#> beta[1,1] -4.975392e-06 -7.485950e-06  8.624703e-03 -1.819206e-03  2.783507e-03
#> beta[2,1]  3.545267e-08  1.159674e-05 -1.819206e-03  1.025332e-02 -5.999974e-04
#> beta[1,2]  6.952597e-06 -2.039629e-05  2.783507e-03 -5.999974e-04  6.799241e-03
#> beta[2,2] -1.948947e-06  7.272828e-06 -6.216471e-04  3.312132e-03 -1.494444e-03
#> psi[1,1]  -1.436036e-09  1.121628e-09 -8.827167e-08  6.928421e-08 -1.229378e-08
#> psi[2,1]  -5.397337e-09 -2.352972e-09  1.362150e-07 -6.786872e-08  2.827157e-08
#> psi[2,2]   4.203122e-09 -3.178531e-10 -8.092158e-08  6.993384e-09 -5.252178e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -1.948947e-06 -1.436036e-09 -5.397337e-09  4.203122e-09
#> mu[2,1]    7.272828e-06  1.121628e-09 -2.352972e-09 -3.178531e-10
#> beta[1,1] -6.216471e-04 -8.827167e-08  1.362150e-07 -8.092158e-08
#> beta[2,1]  3.312132e-03  6.928421e-08 -6.786872e-08  6.993384e-09
#> beta[1,2] -1.494444e-03 -1.229378e-08  2.827157e-08 -5.252178e-09
#> beta[2,2]  8.033171e-03  3.692584e-09  4.371743e-09 -7.603266e-08
#> psi[1,1]   3.692584e-09  1.776845e-08 -3.803148e-09  8.297955e-10
#> psi[2,1]   4.371743e-09 -3.803148e-09  1.136282e-08 -4.703032e-09
#> psi[2,2]  -7.603266e-08  8.297955e-10 -4.703032e-09  2.676450e-08
#> 
#> $`4`
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    1.043712e-05 -3.604418e-06  4.814324e-06 -1.628211e-06 -1.951168e-07
#> mu[2,1]   -3.604418e-06  3.796609e-05  3.531995e-07 -3.004506e-06  7.858673e-06
#> beta[1,1]  4.814324e-06  3.531995e-07  9.865757e-03  3.424691e-05  2.406062e-04
#> beta[2,1] -1.628211e-06 -3.004506e-06  3.424691e-05  1.342206e-02 -2.793637e-05
#> beta[1,2] -1.951168e-07  7.858673e-06  2.406062e-04 -2.793637e-05  5.470098e-03
#> beta[2,2]  7.280477e-08 -1.813611e-06 -3.572421e-06  3.342110e-04  1.482257e-05
#> psi[1,1]   1.858414e-10  6.042985e-10 -1.927989e-08  1.700900e-08  1.075401e-08
#> psi[2,1]   1.409379e-10 -3.190850e-09  6.911712e-09 -4.795484e-08 -6.116108e-08
#> psi[2,2]  -2.788222e-10 -8.534671e-10 -6.757041e-09  2.822853e-10 -7.525012e-09
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]    7.280477e-08  1.858414e-10  1.409379e-10 -2.788222e-10
#> mu[2,1]   -1.813611e-06  6.042985e-10 -3.190850e-09 -8.534671e-10
#> beta[1,1] -3.572421e-06 -1.927989e-08  6.911712e-09 -6.757041e-09
#> beta[2,1]  3.342110e-04  1.700900e-08 -4.795484e-08  2.822853e-10
#> beta[1,2]  1.482257e-05  1.075401e-08 -6.116108e-08 -7.525012e-09
#> beta[2,2]  7.419211e-03 -1.769062e-09  1.850297e-08 -9.165652e-08
#> psi[1,1]  -1.769062e-09  1.046050e-08  6.372424e-11  1.141598e-12
#> psi[2,1]   1.850297e-08  6.372424e-11  7.297033e-09  9.078742e-11
#> psi[2,2]  -9.165652e-08  1.141598e-12  9.078742e-11  2.030675e-08
#> 
#> $`5`
#>                 mu[1,1]       mu[2,1]     beta[1,1]     beta[2,1]     beta[1,2]
#> mu[1,1]    2.115776e-05 -6.312505e-06 -9.365997e-07 -7.441133e-06  2.767397e-07
#> mu[2,1]   -6.312505e-06  2.876505e-05  3.661845e-08  8.679316e-08 -8.396412e-07
#> beta[1,1] -9.365997e-07  3.661845e-08  9.209205e-03 -1.527788e-03  1.910733e-03
#> beta[2,1] -7.441133e-06  8.679316e-08 -1.527788e-03  8.067790e-03 -3.233289e-04
#> beta[1,2]  2.767397e-07 -8.396412e-07  1.910733e-03 -3.233289e-04  9.374810e-03
#> beta[2,2] -6.090495e-08 -7.854492e-06 -3.163124e-04  1.665073e-03 -1.546388e-03
#> psi[1,1]  -1.799574e-10 -2.759494e-11 -6.116907e-08  1.073268e-08 -2.432120e-09
#> psi[2,1]  -1.077773e-09 -4.450186e-10  1.327054e-08 -2.513345e-08 -2.731715e-08
#> psi[2,2]   5.203866e-10  2.457130e-10 -6.550906e-10 -7.755098e-09  2.272470e-08
#>               beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2]
#> mu[1,1]   -6.090495e-08 -1.799574e-10 -1.077773e-09  5.203866e-10
#> mu[2,1]   -7.854492e-06 -2.759494e-11 -4.450186e-10  2.457130e-10
#> beta[1,1] -3.163124e-04 -6.116907e-08  1.327054e-08 -6.550906e-10
#> beta[2,1]  1.665073e-03  1.073268e-08 -2.513345e-08 -7.755098e-09
#> beta[1,2] -1.546388e-03 -2.432120e-09 -2.731715e-08  2.272470e-08
#> beta[2,2]  8.178308e-03  1.594600e-09  1.057114e-08 -8.224086e-08
#> psi[1,1]   1.594600e-09  1.982445e-08 -3.299155e-09  5.501745e-10
#> psi[2,1]   1.057114e-08 -3.299155e-09  8.842776e-09 -2.854392e-09
#> psi[2,2]  -8.224086e-08  5.501745e-10 -2.854392e-09  1.481772e-08
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
#>  Lowest minimum so far:  -822.060942313204
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-822.06094 (started at 367.82482)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.331612810420896,-0.0197631306798523,0.027018148758157,0.539260047061468,0.00368111266356549,0.00338863296810361,0.0623714148367602,-6.9119567442846,-6.98806613376272
#> Running DTVAR_ID2 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID2 with 9 parameters
#> 
#>  Lowest minimum so far:  -834.035953636483
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-834.03595 (started at 367.84346)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.546679083679444,-0.0201029544964559,-0.0487573560553898,0.29745045841592,-0.0022590347266253,-0.0140464530832986,0.176135728656938,-7.14253888427364,-6.87719774329376
#> Running DTVAR_ID3 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID3 with 9 parameters
#> 
#>  Lowest minimum so far:  -808.550007472284
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-808.55001 (started at 367.87017)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.52810552384264,-0.332501184944442,0.0108536588742205,0.361419710176755,-0.00199256396304628,-0.00252307444345536,-0.213878020138358,-6.9657199385558,-6.80024241140314
#> Running DTVAR_ID4 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID4 with 9 parameters
#> 
#>  Lowest minimum so far:  -845.339407101152
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-845.33941 (started at 367.80199)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.160844825671735,-0.121822547746862,-0.0298910806237062,0.481816258706521,-0.0108917261651341,9.44597699330245e-05,0.00601786289000614,-7.23151852202068,-6.89984834600342
#> Running DTVAR_ID5 with 9 parameters
#> 
#> Beginning initial fit attempt
#> Running DTVAR_ID5 with 9 parameters
#> 
#>  Lowest minimum so far:  -832.354548096109
#> 
#> Solution found
#> 
#> 
#>  Solution found!  Final fit=-832.35455 (started at 367.7976)  (1 attempt(s): 1 valid, 0 errors)
#>  Start values from best fit:
#> 0.299056714950255,0.0348620015095441,-0.080168388399385,0.465889962011985,-0.0005130370000419,0.00180964949230418,-0.166419692672795,-6.91180279386919,-7.08999354610295
print(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = FALSE)
#> 
#> Convergence:
#> 100.0%
#> 
#> Estimated paramaters per individual.
#>   alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2] beta[2,2] psi[1,1]
#> 1     0.0037     0.0034    0.3316   -0.0198    0.0270    0.5393    1e-03
#> 2    -0.0023    -0.0140    0.5467   -0.0201   -0.0488    0.2975    8e-04
#> 3    -0.0020    -0.0025    0.5281   -0.3325    0.0109    0.3614    9e-04
#> 4    -0.0109     0.0001    0.1608   -0.1218   -0.0299    0.4818    7e-04
#> 5    -0.0005     0.0018    0.2991    0.0349   -0.0802    0.4659    1e-03
#>   psi[2,1] psi[2,2]
#> 1    1e-04   0.0009
#> 2    1e-04   0.0011
#> 3   -2e-04   0.0012
#> 4    0e+00   0.0010
#> 5   -2e-04   0.0009
summary(fit)
#> Call:
#> FitVARMxID(data = data, observed = paste0("y", seq_len(p)), id = "id", 
#>     center = FALSE)
#> 
#> Convergence:
#> 100.0%
#> 
#> Estimated paramaters per individual.
#>   alpha[1,1] alpha[2,1] beta[1,1] beta[2,1] beta[1,2] beta[2,2] psi[1,1]
#> 1     0.0037     0.0034    0.3316   -0.0198    0.0270    0.5393    1e-03
#> 2    -0.0023    -0.0140    0.5467   -0.0201   -0.0488    0.2975    8e-04
#> 3    -0.0020    -0.0025    0.5281   -0.3325    0.0109    0.3614    9e-04
#> 4    -0.0109     0.0001    0.1608   -0.1218   -0.0299    0.4818    7e-04
#> 5    -0.0005     0.0018    0.2991    0.0349   -0.0802    0.4659    1e-03
#>   psi[2,1] psi[2,2]
#> 1    1e-04   0.0009
#> 2    1e-04   0.0011
#> 3   -2e-04   0.0012
#> 4    0e+00   0.0010
#> 5   -2e-04   0.0009
coef(fit)
#> $`1`
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#>  3.681113e-03  3.388633e-03  3.316128e-01 -1.976313e-02  2.701815e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  5.392600e-01  9.953219e-04  6.207963e-05  9.262859e-04 
#> 
#> $`2`
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0022590347 -0.0140464531  0.5466790837 -0.0201029545 -0.0487573561 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.2974504584  0.0007904395  0.0001392246  0.0010550305 
#> 
#> $`3`
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0019925640 -0.0025230744  0.5281055238 -0.3325011849  0.0108536589 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.3614197102  0.0009432483 -0.0002017401  0.0011560435 
#> 
#> $`4`
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -1.089173e-02  9.445977e-05  1.608448e-01 -1.218225e-01 -2.989108e-02 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  4.818163e-01  7.231700e-04  4.351938e-06  1.007467e-03 
#> 
#> $`5`
#>    alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]     beta[1,2] 
#> -0.0005130370  0.0018096495  0.2990567150  0.0348620015 -0.0801683884 
#>     beta[2,2]      psi[1,1]      psi[2,1]      psi[2,2] 
#>  0.4658899620  0.0009954750 -0.0001656666  0.0008606358 
#> 
vcov(fit)
#> $`1`
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  1.041603e-05  6.394386e-07 -5.052813e-05  1.065411e-06
#> alpha[2,1]  6.394386e-07  9.499927e-06 -2.801871e-06 -4.336068e-05
#> beta[1,1]  -5.052813e-05 -2.801871e-06  8.856580e-03  5.015575e-04
#> beta[2,1]   1.065411e-06 -4.336068e-05  5.015575e-04  8.222857e-03
#> beta[1,2]  -4.233847e-05 -5.314284e-06 -6.329150e-04 -5.463914e-05
#> beta[2,2]  -2.535518e-06 -3.652708e-05 -3.563574e-05 -5.710657e-04
#> psi[1,1]    3.362529e-10  1.975913e-10 -6.466855e-08 -2.573362e-09
#> psi[2,1]    1.039750e-09  9.398095e-10 -1.334551e-08 -4.606274e-08
#> psi[2,2]    2.105697e-10  4.622880e-10 -2.154239e-09  1.310655e-09
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -4.233847e-05 -2.535518e-06  3.362529e-10  1.039750e-09
#> alpha[2,1] -5.314284e-06 -3.652708e-05  1.975913e-10  9.398095e-10
#> beta[1,1]  -6.329150e-04 -3.563574e-05 -6.466855e-08 -1.334551e-08
#> beta[2,1]  -5.463914e-05 -5.710657e-04 -2.573362e-09 -4.606274e-08
#> beta[1,2]   7.838493e-03  4.374482e-04 -2.271557e-09 -4.256298e-08
#> beta[2,2]   4.374482e-04  7.234741e-03  3.353554e-09  1.101489e-08
#> psi[1,1]   -2.271557e-09  3.353554e-09  1.981856e-08  1.237235e-09
#> psi[2,1]   -4.256298e-08  1.101489e-08  1.237235e-09  9.257335e-09
#> psi[2,2]   -6.485253e-09 -1.024456e-07  7.716120e-11  1.150882e-09
#>                 psi[2,2]
#> alpha[1,1]  2.105697e-10
#> alpha[2,1]  4.622880e-10
#> beta[1,1]  -2.154239e-09
#> beta[2,1]   1.310655e-09
#> beta[1,2]  -6.485253e-09
#> beta[2,2]  -1.024456e-07
#> psi[1,1]    7.716120e-11
#> psi[2,1]    1.150882e-09
#> psi[2,2]    1.716566e-08
#> 
#> $`2`
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  1.032520e-05  1.895363e-06  4.491604e-06 -4.439589e-07
#> alpha[2,1]  1.895363e-06  1.388419e-05  4.954290e-07  3.218983e-06
#> beta[1,1]   4.491604e-06  4.954290e-07  7.020108e-03  1.240217e-03
#> beta[2,1]  -4.439589e-07  3.218983e-06  1.240217e-03  9.418247e-03
#> beta[1,2]   1.328065e-04  2.597512e-05 -7.461932e-04 -1.528260e-04
#> beta[2,2]   2.323419e-05  1.760379e-04 -1.316317e-04 -9.990625e-04
#> psi[1,1]   -1.467923e-10  2.928268e-10 -8.315922e-08 -4.779164e-09
#> psi[2,1]   -5.798542e-10  6.511350e-10 -1.399162e-09 -2.990968e-08
#> psi[2,2]   -1.336522e-10 -1.333107e-09 -1.481766e-10 -4.862756e-10
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1]  1.328065e-04  2.323419e-05 -1.467923e-10 -5.798542e-10
#> alpha[2,1]  2.597512e-05  1.760379e-04  2.928268e-10  6.511350e-10
#> beta[1,1]  -7.461932e-04 -1.316317e-04 -8.315922e-08 -1.399162e-09
#> beta[2,1]  -1.528260e-04 -9.990625e-04 -4.779164e-09 -2.990968e-08
#> beta[1,2]   6.909674e-03  1.212584e-03 -5.267598e-10 -4.155880e-08
#> beta[2,2]   1.212584e-03  9.204365e-03 -6.247447e-10 -4.119408e-09
#> psi[1,1]   -5.267598e-10 -6.247447e-10  1.249911e-08  2.199620e-09
#> psi[2,1]   -4.155880e-08 -4.119408e-09  2.199620e-09  8.528063e-09
#> psi[2,2]   -4.896433e-09 -6.155999e-08  3.881269e-10  2.938828e-09
#>                 psi[2,2]
#> alpha[1,1] -1.336522e-10
#> alpha[2,1] -1.333107e-09
#> beta[1,1]  -1.481766e-10
#> beta[2,1]  -4.862756e-10
#> beta[1,2]  -4.896433e-09
#> beta[2,2]  -6.155999e-08
#> psi[1,1]    3.881269e-10
#> psi[2,1]    2.938828e-09
#> psi[2,2]    2.226711e-08
#> 
#> $`3`
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.428506e-06 -2.010191e-06  3.931285e-05 -8.901042e-06
#> alpha[2,1] -2.010191e-06  1.178478e-05 -1.526270e-05  5.685430e-05
#> beta[1,1]   3.931285e-05 -1.526270e-05  8.624447e-03 -1.818927e-03
#> beta[2,1]  -8.901042e-06  5.685430e-05 -1.818927e-03  1.025298e-02
#> beta[1,2]   2.713936e-05 -1.585628e-05  2.783340e-03 -5.998268e-04
#> beta[2,2]  -6.234640e-06  3.202370e-05 -6.213590e-04  3.311956e-03
#> psi[1,1]   -1.087323e-09  5.406398e-10 -8.823624e-08  6.928668e-08
#> psi[2,1]   -1.890360e-09 -3.577258e-09  1.364448e-07 -6.764901e-08
#> psi[2,2]    1.632746e-09  1.092380e-09 -8.091549e-08  6.958967e-09
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1]  2.713936e-05 -6.234640e-06 -1.087323e-09 -1.890360e-09
#> alpha[2,1] -1.585628e-05  3.202370e-05  5.406398e-10 -3.577258e-09
#> beta[1,1]   2.783340e-03 -6.213590e-04 -8.823624e-08  1.364448e-07
#> beta[2,1]  -5.998268e-04  3.311956e-03  6.928668e-08 -6.764901e-08
#> beta[1,2]   6.799025e-03 -1.494191e-03 -1.226517e-08  2.847862e-08
#> beta[2,2]  -1.494191e-03  8.032890e-03  3.724920e-09  4.538555e-09
#> psi[1,1]   -1.226517e-08  3.724920e-09  1.776846e-08 -3.803147e-09
#> psi[2,1]    2.847862e-08  4.538555e-09 -3.803147e-09  1.136256e-08
#> psi[2,2]   -5.258376e-09 -7.606566e-08  8.298031e-10 -4.702820e-09
#>                 psi[2,2]
#> alpha[1,1]  1.632746e-09
#> alpha[2,1]  1.092380e-09
#> beta[1,1]  -8.091549e-08
#> beta[2,1]   6.958967e-09
#> beta[1,2]  -5.258376e-09
#> beta[2,2]  -7.606566e-08
#> psi[1,1]    8.298031e-10
#> psi[2,1]   -4.702820e-09
#> psi[2,2]    2.676429e-08
#> 
#> $`4`
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.037944e-06  5.971385e-08  1.324679e-04 -9.195905e-07
#> alpha[2,1]  5.971385e-08  1.220647e-05  1.226437e-06  1.729198e-04
#> beta[1,1]   1.324679e-04  1.226437e-06  9.866100e-03  3.402501e-05
#> beta[2,1]  -9.195905e-07  1.729198e-04  3.402501e-05  1.342181e-02
#> beta[1,2]  -1.461605e-05  3.635078e-06  2.405932e-04 -2.785645e-05
#> beta[2,2]  -8.980359e-08 -2.074502e-05 -3.676591e-06  3.344239e-04
#> psi[1,1]   -1.140286e-10  5.653372e-10 -1.928848e-08  1.710657e-08
#> psi[2,1]    3.124039e-10 -2.321308e-09  6.868227e-09 -4.763686e-08
#> psi[2,2]   -3.243453e-10 -1.735596e-10 -6.826949e-09  3.194079e-10
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -1.461605e-05 -8.980359e-08 -1.140286e-10  3.124039e-10
#> alpha[2,1]  3.635078e-06 -2.074502e-05  5.653372e-10 -2.321308e-09
#> beta[1,1]   2.405932e-04 -3.676591e-06 -1.928848e-08  6.868227e-09
#> beta[2,1]  -2.785645e-05  3.344239e-04  1.710657e-08 -4.763686e-08
#> beta[1,2]   5.470059e-03  1.493185e-05  1.079037e-08 -6.126221e-08
#> beta[2,2]   1.493185e-05  7.419103e-03 -1.708817e-09  1.861242e-08
#> psi[1,1]    1.079037e-08 -1.708817e-09  1.046046e-08  6.374499e-11
#> psi[2,1]   -6.126221e-08  1.861242e-08  6.374499e-11  7.297141e-09
#> psi[2,2]   -7.529354e-09 -9.163166e-08  1.154333e-12  9.071773e-11
#>                 psi[2,2]
#> alpha[1,1] -3.243453e-10
#> alpha[2,1] -1.735596e-10
#> beta[1,1]  -6.826949e-09
#> beta[2,1]   3.194079e-10
#> beta[1,2]  -7.529354e-09
#> beta[2,2]  -9.163166e-08
#> psi[1,1]    1.154333e-12
#> psi[2,1]    9.071773e-11
#> psi[2,2]    2.030681e-08
#> 
#> $`5`
#>               alpha[1,1]    alpha[2,1]     beta[1,1]     beta[2,1]
#> alpha[1,1]  9.968760e-06 -1.649475e-06  3.243225e-06 -5.834209e-06
#> alpha[2,1] -1.649475e-06  8.582750e-06 -5.982085e-07  3.749137e-06
#> beta[1,1]   3.243225e-06 -5.982085e-07  9.208669e-03 -1.527171e-03
#> beta[2,1]  -5.834209e-06  3.749137e-06 -1.527171e-03  8.067261e-03
#> beta[1,2]  -2.883141e-05  4.306912e-06  1.910692e-03 -3.230196e-04
#> beta[2,2]   4.101270e-06 -2.945464e-05 -3.156739e-04  1.665135e-03
#> psi[1,1]   -1.883995e-10 -2.257554e-12 -6.106649e-08  1.085567e-08
#> psi[2,1]   -6.860031e-10 -2.637887e-10  1.350304e-08 -2.491736e-08
#> psi[2,2]    3.083962e-10  3.770891e-10 -6.765003e-10 -7.777452e-09
#>                beta[1,2]     beta[2,2]      psi[1,1]      psi[2,1]
#> alpha[1,1] -2.883141e-05  4.101270e-06 -1.883995e-10 -6.860031e-10
#> alpha[2,1]  4.306912e-06 -2.945464e-05 -2.257554e-12 -2.637887e-10
#> beta[1,1]   1.910692e-03 -3.156739e-04 -6.106649e-08  1.350304e-08
#> beta[2,1]  -3.230196e-04  1.665135e-03  1.085567e-08 -2.491736e-08
#> beta[1,2]   9.374112e-03 -1.545459e-03 -2.321767e-09 -2.714276e-08
#> beta[2,2]  -1.545459e-03  8.177319e-03  1.768581e-09  1.092935e-08
#> psi[1,1]   -2.321767e-09  1.768581e-09  1.982437e-08 -3.299070e-09
#> psi[2,1]   -2.714276e-08  1.092935e-08 -3.299070e-09  8.842287e-09
#> psi[2,2]    2.269641e-08 -8.223520e-08  5.501767e-10 -2.854173e-09
#>                 psi[2,2]
#> alpha[1,1]  3.083962e-10
#> alpha[2,1]  3.770891e-10
#> beta[1,1]  -6.765003e-10
#> beta[2,1]  -7.777452e-09
#> beta[1,2]   2.269641e-08
#> beta[2,2]  -8.223520e-08
#> psi[1,1]    5.501767e-10
#> psi[2,1]   -2.854173e-09
#> psi[2,2]    1.481758e-08
#> 
converged(fit)
#>    1    2    3    4    5 
#> TRUE TRUE TRUE TRUE TRUE 
# }
```

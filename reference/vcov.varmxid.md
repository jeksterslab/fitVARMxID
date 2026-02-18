# Sampling Covariance Matrix of the Parameter Estimates

Sampling Covariance Matrix of the Parameter Estimates

## Usage

``` r
# S3 method for class 'varmxid'
vcov(
  object,
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
  grad_tol = 0.01,
  hess_tol_abs = 1e-08,
  hess_tol_rel = 1e-10,
  check_condition = FALSE,
  cond_max = 1e+12,
  abs_bnd_tol = 1e-06,
  rel_bnd_tol = 1e-04,
  ok_codes = 0L,
  require_finite_fit = TRUE,
  robust = FALSE,
  ...
)
```

## Arguments

- object:

  Object of class `varmxid`.

- mu:

  Logical. If `mu = TRUE`, include estimates of the `mu` vector, if
  available. If `mu = FALSE`, exclude estimates of the `mu` vector.

- alpha:

  Logical. If `alpha = TRUE`, include estimates of the `alpha` vector,
  if available. If `alpha = FALSE`, exclude estimates of the `alpha`
  vector.

- beta:

  Logical. If `beta = TRUE`, include estimates of the `beta` matrix, if
  available. If `beta = FALSE`, exclude estimates of the `beta` matrix.

- nu:

  Logical. If `nu = TRUE`, include estimates of the `nu` vector, if
  available. If `nu = FALSE`, exclude estimates of the `nu` vector.

- psi:

  Logical. If `psi = TRUE`, include estimates of the `psi` matrix, if
  available. If `psi = FALSE`, exclude estimates of the `psi` matrix.

- theta:

  Logical. If `theta = TRUE`, include estimates of the `theta` matrix,
  if available. If `theta = FALSE`, exclude estimates of the `theta`
  matrix.

- var_metric:

  Character string. If `var_metric = "var"`, `psi` and `theta` are in
  the original variance/covariance metric. If `var_metric = "logvar"`,
  the diagonal elements of `psi` and `theta` are the log of the
  variances and the off-diagonal elements correspond to strict `L` in
  the `LDL'` decomposition. If `var_metric = "softplusvar"`, the
  diagonal elements of `psi` and `theta` are the softplus of the
  variances and the off-diagonal elements correspond to strict `L` in
  the `LDL'` decomposition.

- converged:

  Logical. Only include converged cases.

- vanishing_theta:

  Logical. Test for measurement error variance going to zero if
  `converged = TRUE`.

- theta_tol:

  Numeric. Tolerance for vanishing theta test if `converged` and
  `theta_tol` are `TRUE`.

- prop:

  Logical. If `prop = FALSE`, a named logical vector indicating, for
  each individual fit, whether the convergence criteria are met. If
  `prop = TRUE`, the proportion of cases that converged.

- grad_tol:

  Numeric. Tolerance for the gradient-based convergence check.

- hess_tol_abs:

  Numeric. Absolute tolerance used when checking whether the Hessian is
  positive-definite.

- hess_tol_rel:

  Numeric. Relative tolerance used when checking whether the Hessian is
  positive-definite.

- check_condition:

  Logical. If `TRUE`, also check the Hessian condition number as part of
  the Hessian diagnostics.

- cond_max:

  Numeric. Maximum allowed condition number for the Hessian when
  `check_condition = TRUE`.

- abs_bnd_tol:

  Numeric. Absolute tolerance for detecting whether a parameter is at
  its lower or upper bound.

- rel_bnd_tol:

  Numeric. Relative tolerance for detecting whether a parameter is at
  its lower or upper bound.

- ok_codes:

  Integer vector. Optimizer status codes that are considered acceptable.

- require_finite_fit:

  Logical. If `TRUE`, require a finite objective value (fit) as part of
  the convergence check.

- robust:

  Logical. If `TRUE`, use robust (sandwich) sampling variance-covariance
  matrix. If `FALSE`, use normal theory sampling variance-covariance
  matrix.

- ...:

  additional arguments.

## Value

Returns a list of sampling variance-covariance matrices.

## Author

Ivan Jacob Agaloos Pesigan

# Check Model Convergence

Determines whether each fitted OpenMx model in a `varmxid` object meets
convergence criteria based on (a) acceptable optimizer status and
gradient size, (b) a positive-definite Hessian, (c) parameters not being
at their bounds, and (optionally) non-vanishing measurement error
variances (`theta`).

## Usage

``` r
converged(object, ...)

# S3 method for class 'varmxid'
converged(
  object,
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
  ...
)
```

## Arguments

- object:

  A fit object.

- ...:

  Passed to and/or used by methods.

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

## Value

For the `varmxid` method: If `prop = FALSE`, a named logical vector
indicating, for each individual fit, whether the convergence criteria
are met. If `prop = TRUE`, the proportion of cases that converged.

## Author

Ivan Jacob Agaloos Pesigan

# Confidence Intervals for the Parameter Estimates

Confidence Intervals for the Parameter Estimates

## Usage

``` r
# S3 method for class 'varmxid'
confint(
  object,
  parm = NULL,
  level = 0.95,
  mu = TRUE,
  alpha = TRUE,
  beta = TRUE,
  nu = TRUE,
  psi = TRUE,
  theta = TRUE,
  robust = FALSE,
  ncores = NULL,
  ...
)
```

## Arguments

- object:

  Object of class `varmxid`.

- parm:

  Argument not used.

- level:

  the confidence level required.

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

- robust:

  Logical. If `TRUE`, use robust (sandwich) sampling variance-covariance
  matrix. If `FALSE`, use normal theory sampling variance-covariance
  matrix.

- ncores:

  Positive integer. Number of cores to use.

- ...:

  additional arguments.

## Value

Returns list of matrices of confidence intervals.

## Author

Ivan Jacob Agaloos Pesigan

# Parameter Estimates

Parameter Estimates

## Usage

``` r
# S3 method for class 'varmxid'
coef(
  object,
  mu = TRUE,
  alpha = TRUE,
  beta = TRUE,
  nu = TRUE,
  psi = TRUE,
  theta = TRUE,
  ncores = NULL,
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

- ncores:

  Positive integer. Number of cores to use.

- ...:

  additional arguments.

## Value

Returns a list of vectors of parameter estimates.

## Author

Ivan Jacob Agaloos Pesigan

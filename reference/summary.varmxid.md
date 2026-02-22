# Summary Method for Object of Class `varmxid`

Summary Method for Object of Class `varmxid`

## Usage

``` r
# S3 method for class 'varmxid'
summary(
  object,
  means = FALSE,
  mu = TRUE,
  alpha = TRUE,
  beta = TRUE,
  nu = TRUE,
  psi = TRUE,
  theta = TRUE,
  digits = 4,
  ncores = NULL,
  ...
)
```

## Arguments

- object:

  an object of class `varmxid`.

- means:

  Logical. If `means = TRUE`, return means. Otherwise, the function
  returns raw estimates.

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

- digits:

  Integer indicating the number of decimal places to display.

- ncores:

  Positive integer. Number of cores to use.

- ...:

  further arguments.

## Value

Returns means or raw estimates depending the the value of the argument
`means`.

## Author

Ivan Jacob Agaloos Pesigan

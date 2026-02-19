# Check Model Convergence

Determines whether each fitted OpenMx model in a `varmxid` object meets
convergence criteria based on (a) acceptable optimizer status and
gradient size, (b) a positive-definite Hessian, and (c) parameters not
being at their bounds.

## Usage

``` r
converged(object, ...)

# S3 method for class 'varmxid'
converged(object, prop = FALSE, ...)
```

## Arguments

- object:

  A fit object.

- ...:

  Passed to and/or used by methods.

- prop:

  Logical. If `prop = FALSE`, a named logical vector indicating, for
  each individual fit, whether the convergence criteria are met. If
  `prop = TRUE`, the proportion of cases that converged.

## Value

For the `varmxid` method: If `prop = FALSE`, a named logical vector
indicating, for each individual fit, whether the convergence criteria
are met. If `prop = TRUE`, the proportion of cases that converged.

## Author

Ivan Jacob Agaloos Pesigan

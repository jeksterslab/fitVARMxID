# Softplus and Inverse Softplus Transformations

The softplus transformation maps unconstrained real values to the
positive real line. This is useful when parameters (e.g., variances)
must be positive. The inverse softplus transformation recovers the
unconstrained value from a strictly positive input.

## Usage

``` r
Softplus(x)

InvSoftplus(x)
```

## Arguments

- x:

  Numeric vector or matrix. Input values to be transformed.

## Value

- `Softplus()`: numeric vector or matrix of nonnegative values
  (mathematically strictly positive for finite inputs, but can underflow
  to 0 for very negative values).

- `InvSoftplus()`: numeric vector or matrix of unconstrained values.

## Details

Mathematical definitions:

- `Softplus(x) = log(1 + exp(x))`

- `InvSoftplus(x) = log(exp(x) - 1)`

Numerical implementation (stable forms):

- `Softplus(x) = max(x, 0) + log1p(exp(-abs(x)))`

- `InvSoftplus(y)` uses `log(expm1(y))`, and for large `y` uses the
  rewrite `y + log1p(-exp(-y))` for stability.

For numerical stability, these functions use
[`log1p()`](https://rdrr.io/r/base/Log.html) and
[`expm1()`](https://rdrr.io/r/base/Log.html) internally. `InvSoftplus()`
requires strictly positive input and will error if any values are
`<= 0`.

## See also

Other VAR Functions:
[`FitVARMxID()`](https://github.com/jeksterslab/fitVARMxID/reference/FitVARMxID.md),
[`LDL()`](https://github.com/jeksterslab/fitVARMxID/reference/LDL.md)

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
# Apply softplus to unconstrained values
x <- c(-5, 0, 5)
y <- Softplus(x)

# Recover unconstrained values
x_recovered <- InvSoftplus(y)

y
#> [1] 0.006715348 0.693147181 5.006715348
x_recovered
#> [1] -5  0  5
```

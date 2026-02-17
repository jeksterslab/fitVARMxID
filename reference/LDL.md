# LDL' Decomposition of a Symmetric Positive-Definite Matrix

Performs an LDL' factorization of a symmetric positive-definite matrix
\\X\\, such that \$\$X = L D L^\top,\$\$ where \\L\\ is unit
lower-triangular (ones on the diagonal) and \\D\\ is diagonal.

## Usage

``` r
LDL(x, epsilon = 1e-10)

InvLDL(s_l, uc_d)
```

## Arguments

- x:

  Numeric matrix. Must be symmetric positive-definite.

- epsilon:

  Numeric. Small positive value used to replace zero diagonal entries.

- s_l:

  Matrix. Strictly lower-triangular part of \\L\\.

- uc_d:

  Vector. Unconstrained vector with \\log1p(exp(uc\\d)) = d\\.

## Value

- `LDL()`: a list with components:

  - `l`: a unit lower-triangular matrix \\L\\

  - `s_l`: a strictly lower-triangular part of \\L\\

  - `d`: a vector of diagonal entries of \\D\\

  - `uc_d`: unconstrained vector with \\\mathrm{softplus}(uc\\d) = d\\

  - `x`: input matrix

- `InvLDL()`: a symmetric positive definite matrix

## Details

`LDL()` returns both the unit lower-triangular factor \\L\\ and the
diagonal factor \\D\\. The strictly lower-triangular part of \\L\\ is
also provided for convenience. The function additionally computes an
unconstrained vector `uc_d` such that `softplus(uc_d) = d`, using
\\\mathrm{softplus}^{-1}(y) = \log(\exp(y) - 1)\\ for stable
back-transformation. `InvLDL()` returns a symmetric positive definite
matrix from the strictly lower-triangular part of \\L\\ and the
unconstrained vector `uc_d`.

## See also

Other VAR Functions:
[`FitVARMxID()`](https://github.com/jeksterslab/fitVARMxID/reference/FitVARMxID.md),
[`Softplus()`](https://github.com/jeksterslab/fitVARMxID/reference/Softplus.md)

## Examples

``` r
set.seed(123)
x <- crossprod(matrix(rnorm(16), 4, 4)) + diag(1e-6, 4)
ldl <- LDL(x = x)
ldl
#> $l
#>            [,1]       [,2]     [,3] [,4]
#> [1,]  1.0000000  0.0000000 0.000000    0
#> [2,]  0.0578245  1.0000000 0.000000    0
#> [3,]  0.8640960 -0.1856754 1.000000    0
#> [4,] -0.3535410 -0.4657727 1.945589    1
#> 
#> $s_l
#>            [,1]       [,2]     [,3] [,4]
#> [1,]  0.0000000  0.0000000 0.000000    0
#> [2,]  0.0578245  0.0000000 0.000000    0
#> [3,]  0.8640960 -0.1856754 0.000000    0
#> [4,] -0.3535410 -0.4657727 1.945589    0
#> 
#> $d
#> [1] 2.8016587 4.7616201 0.0421744 2.1320553
#> 
#> $uc_d
#> [1]  2.739028  4.753032 -3.144781  2.005819
#> 
#> $x
#>            [,1]       [,2]       [,3]       [,4]
#> [1,]  2.8016587  0.1620045  2.4209020 -0.9905011
#> [2,]  0.1620045  4.7709879 -0.7441283 -2.2751078
#> [3,]  2.4209020 -0.7441283  2.2982247 -0.3620371
#> [4,] -0.9905011 -2.2751078 -0.3620371  3.6748873
#> 
#> $epsilon
#> [1] 1e-10
#> 
inv_ldl <- InvLDL(s_l = ldl$s_l, uc_d = ldl$uc_d)
inv_ldl
#>            [,1]       [,2]       [,3]       [,4]
#> [1,]  2.8016587  0.1620045  2.4209020 -0.9905011
#> [2,]  0.1620045  4.7709879 -0.7441283 -2.2751078
#> [3,]  2.4209020 -0.7441283  2.2982247 -0.3620371
#> [4,] -0.9905011 -2.2751078 -0.3620371  3.6748873
max(abs(x - inv_ldl))
#> [1] 4.440892e-16
```

# Changelog

## fitVARMxID 1.0.6

### Patch

- Improved convergence assessment and Hessian-rescue behavior, including
  more robust selection of the best candidate fit.
- Treats lower-bound solutions for softplus covariance-diagonal
  parameters as admissible rather than automatically classifying them as
  convergence failures.
- Hardened parameter-bound detection, nudging, and bound relaxation.

## fitVARMxID 1.0.5

CRAN release: 2026-08-02

### Patch

- Added [`confint()`](https://rdrr.io/r/stats/confint.html) and
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) methods.
- Added the
  [`FitVARMxIDSave()`](https://github.com/jeksterslab/fitVARMxID/reference/FitVARMxIDSave.md)
  function.

## fitVARMxID 1.0.3

CRAN release: 2026-03-31

### Patch

- Edits to documentation.

## fitVARMxID 1.0.2

CRAN release: 2026-02-27

### Patch

- Initial CRAN release.

## fitVARMxID 1.0.1

### Patch

- Initial CRAN submission.

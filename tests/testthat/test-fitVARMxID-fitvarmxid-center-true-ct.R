## ---- test-fitVARMxID-fitvarmxid-center-true-ct
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    message(text)
    set.seed(42)
    if (!identical(Sys.getenv("NOT_CRAN"), "true") && !interactive()) {
      message("CRAN: tests skipped.")
      # nolint start
      return(invisible(NULL))
      # nolint end
    }
    if (identical(Sys.getenv("GITHUB_TEST"), "true")) {
      ci <- TRUE
      n <- 10
      time <- 1000
      tol <- 0.20
    } else {
      ci <- FALSE
      n <- 2
      time <- 1000
      tol <- 1.00
    }
    Sys.setenv(
      OMP_NUM_THREADS = "1",
      MKL_NUM_THREADS = "1",
      OPENBLAS_NUM_THREADS = "1"
    )
    k <- 2
    mu <- stats::runif(n = k)
    beta <- -0.35 * diag(k)
    alpha <- c(-beta %*% mu)
    psi <- diag(k)
    psi_l <- t(chol(psi))
    mu0 <- c(solve(-beta) %*% alpha)
    sigma0 <- matrix(
      data = c(
        solve(
          beta %x% diag(k) + diag(k) %x% beta
        ) %*% -c(psi)
      ),
      nrow = k,
      ncol = k
    )
    sigma0_l <- t(chol(sigma0))
    sim <- simStateSpace::SimSSMLinSDEIVary(
      n = n,
      time = time,
      delta_t = 0.1,
      mu0 = list(mu0),
      sigma0_l = list(sigma0_l),
      iota = list(alpha),
      phi = list(beta),
      sigma_l = list(psi_l),
      nu = list(rep(x = 0, times = k)),
      lambda = list(diag(k)),
      theta_l = list(matrix(data = 0, nrow = k, ncol = k))
    )
    data <- as.data.frame(sim)
    fit <- FitVARMxID(
      data = data,
      observed = paste0("y", seq_len(k)),
      id = "id",
      ct = TRUE,
      time = "time",
      center = TRUE,
      theta_fixed = TRUE, # no measurement component
      robust = FALSE,
      seed = 42
    )
    if (ci) {
      print(fit)
      print(fit, means = TRUE)
      summary(fit)
      summary(fit, means = TRUE)
      summary(fit, var_metric = "logvar")
      summary(fit, var_metric = "softplusvar")
      coef(fit)
      coef(fit, var_metric = "logvar")
      coef(fit, var_metric = "softplusvar")
      vcov(fit)
      vcov(fit, var_metric = "logvar")
      vcov(fit, var_metric = "softplusvar")
      vcov(fit, robust = TRUE)
    }
    testthat::test_that(
      paste(text, "converged"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(converged(fit, prop = FALSE))
        )
        testthat::expect_true(
          converged(fit, prop = TRUE) == 1
        )
      }
    )
    library(OpenMx)
    mu_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "mu",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    alpha_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "alpha",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    beta_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "beta",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    psi_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "psi",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    testthat::test_that(
      paste(text, "mu"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                mu
              ) - c(
                mu_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "alpha"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                alpha
              ) - c(
                alpha_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "beta"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                beta
              ) - c(
                beta_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "psi"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                psi
              ) - c(
                psi_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "error"),
      {
        testthat::skip_on_cran()
        testthat::expect_error(
          FitVARMxID(
            data = data,
            observed = paste0("y", seq_len(k)),
            id = "id",
            ct = TRUE
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-fitvarmxid-center-true-ct"
)

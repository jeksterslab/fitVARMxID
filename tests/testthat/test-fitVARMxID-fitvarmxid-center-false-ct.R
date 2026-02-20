## ---- test-fitVARMxID-fitvarmxid-center-false-ct
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
      n <- 5
      time <- 1000
      tol <- 0.20
    } else {
      ci <- FALSE
      n <- 2
      time <- 100
      tol <- 1.00
    }
    k <- 2
    mu <- rep(x = 0, times = k)
    beta <- -0.35 * diag(k)
    alpha <- c(-beta %*% mu)
    psi <- 0.10 * diag(k)
    psi_l <- t(chol(psi))
    mu0 <- simStateSpace::LinSDEMeanEta(
      phi = beta,
      iota = alpha
    )
    sigma0 <- simStateSpace::LinSDECovEta(
      phi = beta,
      sigma = psi
    )
    sigma0_ldl <- LDL(sigma0)
    sigma0_l <- t(chol(sigma0))
    nu <- rep(x = 0, times = k)
    lambda <- diag(k)
    theta <- matrix(data = 0, nrow = k, ncol = k)
    sim <- simStateSpace::SimSSMLinSDEFixed(
      n = n,
      time = time,
      delta_t = 0.1,
      mu0 = mu0,
      sigma0_l = sigma0_l,
      iota = alpha,
      phi = beta,
      sigma_l = psi_l,
      nu = nu,
      lambda = lambda,
      theta_l = theta
    )
    data <- as.data.frame(sim)
    fit <- FitVARMxID(
      data = data,
      observed = paste0("y", seq_len(k)),
      id = "id",
      ct = TRUE,
      time = "time",
      center = FALSE,
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
    mu0_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "mu0",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    sigma0_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "sigma0",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
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
    nu_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "nu",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    lambda_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "lambda",
                model = fit$output[[i]]
              )
            )
          }
        )
      )
    )
    theta_hat <- colMeans(
      do.call(
        what = "rbind",
        args = lapply(
          X = seq_len(n),
          FUN = function(i) {
            c(
              mxEvalByName(
                name = "theta",
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
      paste(text, "nu"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                nu
              ) - c(
                nu_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "lambda"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                lambda
              ) - c(
                lambda_hat
              )
            ) <= tol
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "theta"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            abs(
              c(
                theta
              ) - c(
                theta_hat
              )
            ) <= tol
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-fitvarmxid-center-false-ct"
)

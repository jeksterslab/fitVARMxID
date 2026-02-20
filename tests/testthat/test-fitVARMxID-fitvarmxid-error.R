## ---- test-fitVARMxID-fitvarmxid-error
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
    alpha <- rep(x = 0, times = k)
    beta <- 0.50 * diag(k)
    mu <- c(solve(diag(k) - beta) %*% alpha)
    psi <- 0.10 * diag(k)
    psi_l <- t(chol(psi))
    mu0 <- simStateSpace::SSMMeanEta(
      beta = beta,
      alpha = alpha
    )
    sigma0 <- simStateSpace::SSMCovEta(
      beta = beta,
      psi = psi
    )
    sigma0 <- 0.5 * (sigma0 + t(sigma0))
    sigma0_l <- t(chol(sigma0))
    nu <- rep(x = 0, times = k)
    lambda <- diag(k)
    theta <- matrix(data = 0, nrow = k, ncol = k)
    sim <- simStateSpace::SimSSMVARFixed(
      n = n,
      time = time,
      mu0 = mu0,
      sigma0_l = sigma0_l,
      alpha = alpha,
      beta = beta,
      psi_l = psi_l
    )
    data <- as.data.frame(sim)
    testthat::test_that(
      paste(text, "mu and nu"),
      {
        testthat::skip_on_cran()
        testthat::expect_error(
          FitVARMxID(
            data = data,
            observed = paste0("y", seq_len(k)),
            id = "id",
            center = TRUE,
            mu_fixed = FALSE,
            nu_fixed = FALSE,
            theta_fixed = TRUE # no measurement component
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "alpha and nu"),
      {
        testthat::skip_on_cran()
        testthat::expect_error(
          FitVARMxID(
            data = data,
            observed = paste0("y", seq_len(k)),
            id = "id",
            center = FALSE,
            alpha_fixed = FALSE,
            nu_fixed = FALSE,
            theta_fixed = TRUE # no measurement component
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "alpha and nu"),
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
  text = "test-fitVARMxID-fitvarmxid-error"
)

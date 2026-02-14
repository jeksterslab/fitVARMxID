## ---- test-fitVARMxID-theta-default
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    message(text)
    if (!identical(Sys.getenv("NOT_CRAN"), "true") && !interactive()) {
      message("CRAN: tests skipped.")
      # nolint start
      return(invisible(NULL))
      # nolint end
    }
    k <- 3
    idx <- seq_len(k)
    observed <- paste0("y", idx)
    theta <- fitVARMxID:::.FitVARMxIDTheta(
      k = k,
      observed = observed,
      theta_diag = TRUE,
      theta_fixed = TRUE,
      theta_d_free = NULL,
      theta_d_values = NULL,
      theta_d_lbound = NULL,
      theta_d_ubound = NULL,
      theta_d_equal = FALSE
    )
    theta_name <- theta$theta@name
    theta_values <- theta$theta@values
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(theta$theta) == "ZeroMatrix"
        )
      }
    )
    testthat::test_that(
      paste(text, "name"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          theta_name == "theta"
        )
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_values), rep(x = 0, times = k * k)
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-theta-default"
)

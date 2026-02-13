## ---- test-fitVARMxID-mu-fixed-false
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
    statenames <- paste0("eta", idx)
    mu <- fitVARMxID:::.FitVARMxIDMu(
      k = k,
      statenames = statenames,
      center = FALSE,
      mu_fixed = FALSE,
      mu_free = rep(x = TRUE, times = k),
      mu_values = rep(x = 1, times = k),
      mu_lbound = rep(x = -1, times = k),
      mu_ubound = rep(x = +1, times = k),
      ct = FALSE
    )
    mu_name <- mu$mu@name
    mu_values <- mu$mu@values
    mu_labels <- mu$mu@labels
    mu_free <- mu$mu@free
    mu_lbound <- mu$mu@lbound
    mu_ubound <- mu$mu@ubound
    mu_vec_name <- mu$mu_vec@name
    mu_vec_values <- mu$mu_vec@values
    mu_vec_labels <- mu$mu_vec@labels
    mu_vec_free <- mu$mu_vec@free
    mu_vec_lbound <- mu$mu_vec@lbound
    mu_vec_ubound <- mu$mu_vec@ubound
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(mu$mu) == "FullMatrix"
        )
        testthat::expect_true(
          class(mu$mu_vec) == "FullMatrix"
        )
      }
    )
    testthat::test_that(
      paste(text, "name"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          mu_name == "mu"
        )
        testthat::expect_true(
          mu_vec_name == "mu_vec"
        )
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu_values) == 1
          )
        )
        testthat::expect_true(
          all(
            c(mu_vec_values) == 0
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "labels"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu_labels) == paste0("mu_", idx, "_1")
          )
        )
        testthat::expect_true(
          all(
            c(mu_vec_labels) == paste0("mu[", idx, ",1]")
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "free"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(mu_free)
        )
        testthat::expect_true(
          all(!mu_vec_free)
        )
      }
    )
    testthat::test_that(
      paste(text, "lbound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu_lbound) == c(
              matrix(
                data = -1,
                nrow = k,
                ncol = 1
              )
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(mu_vec_lbound)
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "ubound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu_ubound) == c(
              matrix(
                data = 1,
                nrow = k,
                ncol = 1
              )
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(mu_vec_ubound)
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-mu-fixed-false"
)

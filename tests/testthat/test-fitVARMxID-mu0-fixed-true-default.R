## ---- test-fitVARMxID-mu0-fixed-true-default
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
    mu0 <- fitVARMxID:::.FitVARMxIDMu0(
      k = k,
      statenames = statenames,
      mu0_fixed = TRUE,
      mu0_func = FALSE,
      mu0_free = NULL,
      mu0_values = NULL,
      mu0_lbound = NULL,
      mu0_ubound = NULL,
      ct = FALSE
    )
    mu0_name <- mu0$mu0@name
    mu0_values <- mu0$mu0@values
    mu0_labels <- mu0$mu0@labels
    mu0_free <- mu0$mu0@free
    mu0_lbound <- mu0$mu0@lbound
    mu0_ubound <- mu0$mu0@ubound
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(mu0$mu0) == "FullMatrix"
        )
      }
    )
    testthat::test_that(
      paste(text, "name"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          mu0_name == "mu0"
        )
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu0_values) == 0
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
            is.na(mu0_labels)
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "free"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          !all(mu0_free)
        )
      }
    )
    testthat::test_that(
      paste(text, "lbound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            is.na(mu0_lbound)
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
            is.na(mu0_ubound)
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-mu0-fixed-true-default"
)

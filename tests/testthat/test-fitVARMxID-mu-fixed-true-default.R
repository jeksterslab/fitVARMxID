## ---- test-fitVARMxID-mu-fixed-true-default
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
      mu_fixed = TRUE,
      mu_free = NULL,
      mu_values = NULL,
      mu_lbound = NULL,
      mu_ubound = NULL,
      name_mu = "mu",
      name_alpha = "alpha",
      name_beta = "beta",
      ct = FALSE
    )
    mu_name <- mu[[1]]@name
    mu_values <- mu[[1]]@values
    mu_labels <- mu[[1]]@labels
    mu_free <- mu[[1]]@free
    mu_lbound <- mu[[1]]@lbound
    mu_ubound <- mu[[1]]@ubound
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(mu[[1]]) == "ZeroMatrix"
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
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            c(mu_values) == 0
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
            is.na(mu_labels)
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "free"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          !all(mu_free)
        )
      }
    )
    testthat::test_that(
      paste(text, "lbound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            is.na(mu_lbound)
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
            is.na(mu_ubound)
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-mu-fixed-true-default"
)

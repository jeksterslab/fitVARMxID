## ---- test-fitVARMxID-beta-fixed-true
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
    beta <- fitVARMxID:::.FitVARMxIDBeta(
      k = k,
      statenames = statenames,
      beta_fixed = TRUE,
      beta_free = diag(
        x = TRUE,
        nrow = k,
        ncol = k
      ),
      beta_values = matrix(
        data = 1,
        nrow = k,
        ncol = k
      ),
      beta_lbound = matrix(
        data = -1,
        nrow = k,
        ncol = k
      ),
      beta_ubound = matrix(
        data = +1,
        nrow = k,
        ncol = k
      ),
      ct = FALSE
    )
    beta_name <- beta$beta@name
    beta_values <- beta$beta@values
    beta_labels <- beta$beta@labels
    beta_free <- beta$beta@free
    beta_lbound <- beta$beta@lbound
    beta_ubound <- beta$beta@ubound
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(beta$beta) == "FullMatrix"
        )
      }
    )
    testthat::test_that(
      paste(text, "name"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          beta_name == "beta"
        )
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            beta_values == matrix(
              data = 1,
              nrow = k,
              ncol = k
            )
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
            is.na(beta_labels)
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "free"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(!beta_free)
        )
      }
    )
    testthat::test_that(
      paste(text, "lbound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          all(
            is.na(beta_lbound)
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
            is.na(beta_ubound)
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-beta-fixed-true"
)

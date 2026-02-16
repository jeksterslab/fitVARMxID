## ---- test-fitVARMxID-beta-fixed-true-null-ct
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
    statenames <- paste0(
      "eta",
      idx
    )
    beta <- fitVARMxID:::.FitVARMxIDBeta(
      k = k,
      statenames = statenames,
      beta_fixed = TRUE,
      beta_free = NULL,
      beta_values = NULL,
      beta_lbound = NULL,
      beta_ubound = NULL,
      ct = TRUE
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            beta
          )
        )
        testthat::expect_true(
          all(
            names(
              beta
            ) == c(
              "beta",
              "a_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "beta"),
      {
        testthat::skip_on_cran()
        obj <- beta$beta
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "beta"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = 0,
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(
              obj$labels
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = FALSE,
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(
              obj$lbound
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(
              obj$ubound
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "a_mat"),
      {
        testthat::skip_on_cran()
        obj <- beta$a_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "A"
        )
        testthat::expect_true(
          is.null(
            obj$values
          )
        )
        testthat::expect_true(
          is.null(
            obj$labels
          )
        )
        testthat::expect_true(
          is.null(
            obj$free
          )
        )
        testthat::expect_true(
          is.null(
            obj$lbound
          )
        )
        testthat::expect_true(
          is.null(
            obj$ubound
          )
        )
      }
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
            beta_values == diag(
              x = 0,
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
  text = "test-fitVARMxID-beta-fixed-true-null-ct"
)

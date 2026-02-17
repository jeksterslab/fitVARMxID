## ---- test-fitVARMxID-mu0-fixed-true-null
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
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(mu0)
        )
        testthat::expect_true(
          all(
            names(mu0) == c(
              "mu0",
              "x0_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "mu0"),
      {
        testthat::skip_on_cran()
        obj <- mu0$mu0
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "mu0"
        )
        testthat::expect_true(
          all(
            obj$values == rep(
              x = 0,
              times = k
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
            obj$free == rep(
              x = FALSE,
              times = k
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
      paste(text, "x0_mat"),
      {
        testthat::skip_on_cran()
        obj <- mu0$x0_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "x0"
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
  },
  text = "test-fitVARMxID-mu0-fixed-true-null"
)

## ---- test-fitVARMxID-sigma0-fixed-true-func-false-ct
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
    sigma0 <- fitVARMxID:::.FitVARMxIDSigma0(
      k = k,
      statenames = statenames,
      sigma0_diag = FALSE,
      sigma0_fixed = TRUE,
      sigma0_func = TRUE,
      ct = TRUE
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            sigma0
          )
        )
        testthat::expect_true(
          all(
            names(
              sigma0
            ) == c(
              "sigma0",
              "sigma0_column",
              "sigma0_mat",
              "p0_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "sigma0"),
      {
        testthat::skip_on_cran()
        obj <- sigma0$sigma0
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "sigma0"
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
    testthat::test_that(
      paste(text, "p0_mat"),
      {
        testthat::skip_on_cran()
        obj <- sigma0$p0_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "P0"
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
  text = "test-fitVARMxID-sigma0-fixed-true-func-false-ct"
)

## ---- test-fitVARMxID-sigma0-fixed-true-diag-d-equal-false-null
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
      sigma0_diag = TRUE,
      sigma0_fixed = TRUE,
      sigma0_func = FALSE,
      sigma0_d_equal = FALSE,
      sigma0_d_values = NULL,
      sigma0_d_lbound = NULL,
      sigma0_d_ubound = NULL
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
              "sigma0_l",
              "sigma0_d",
              "sigma0",
              "sigma0_vech",
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
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "sigma0"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = c(
                1, 0, 0,
                0, 1, 0,
                0, 0, 1
              ),
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
  text = "test-fitVARMxID-sigma0-fixed-true-diag-d-equal-false-null"
)

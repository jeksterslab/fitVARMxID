## ---- test-fitVARMxID-sigma0-fixed-false-diag-d-equal-false-values
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
      sigma0_fixed = FALSE,
      sigma0_d_equal = FALSE,
      sigma0_d_values = rep(x = 1, times = k),
      sigma0_d_free = NULL,
      sigma0_d_lbound = rep(x = -2.5, times = k),
      sigma0_d_ubound = rep(x = 2.5, times = k),
      sigma0_l_values = NULL
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
              "sigma0_d",
              "sigma0_d_vec",
              "sigma0",
              "sigma0_vech",
              "sigma0_vec",
              "p0_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "sigma0_d"),
      {
        testthat::skip_on_cran()
        obj <- sigma0$sigma0_d
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "sigma0_d"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = 1,
              nrow = k,
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            c(
              obj$labels
            ) == paste0(
              "sigma0",
              "_",
              "d",
              "_",
              idx,
              "_",
              1
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = TRUE,
              nrow = k,
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            obj$lbound == -2.5
          )
        )
        testthat::expect_true(
          all(
            obj$ubound == 2.5
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "sigma0_vec"),
      {
        testthat::skip_on_cran()
        obj <- sigma0$sigma0_vec
        testthat::expect_true(
          class(obj) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "sigma0_vec"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = 0,
              nrow = k,
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            c(obj$labels) == paste0(
              "sigma0",
              "[",
              idx,
              ",",
              idx,
              "]"
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = FALSE,
              nrow = k,
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            is.na(obj$lbound)
          )
        )
        testthat::expect_true(
          all(
            is.na(obj$ubound)
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
  text = "test-fitVARMxID-sigma0-fixed-false-diag-d-equal-false-values"
)

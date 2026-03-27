## ---- test-fitVARMxID-psi-fixed-false-diag-d-equal-true-null
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
    psi <- fitVARMxID:::.FitVARMxIDPsi(
      k = k,
      statenames = statenames,
      psi_diag = TRUE,
      psi_fixed = FALSE,
      psi_d_equal = TRUE,
      psi_d_values = NULL,
      psi_d_free = NULL,
      psi_d_lbound = NULL,
      psi_d_ubound = NULL,
      psi_l_values = NULL
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            psi
          )
        )
        testthat::expect_true(
          all(
            names(
              psi
            ) == c(
              "psi_d",
              "psi_d_vec",
              "psi",
              "psi_vech",
              "psi_vec",
              "q_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "psi_d"),
      {
        testthat::skip_on_cran()
        obj <- psi$psi_d
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "psi_d"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = log(expm1(1)),
              nrow = k,
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            c(obj$labels) == paste0(
              "psi",
              "_",
              "d",
              "_",
              "eq"
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
            obj$lbound == -30
          )
        )
        testthat::expect_true(
          all(
            obj$ubound == 650
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "psi"),
      {
        testthat::skip_on_cran()
        obj <- psi$psi
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "psi"
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
      paste(text, "q_mat"),
      {
        testthat::skip_on_cran()
        obj <- psi$q_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "Q"
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
  text = "test-fitVARMxID-psi-fixed-false-diag-d-equal-true-null"
)

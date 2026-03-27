## ---- test-fitVARMxID-theta-fixed-false-diag-d-equal-true-null
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
    observed <- paste0(
      "y",
      idx
    )
    theta <- fitVARMxID:::.FitVARMxIDTheta(
      k = k,
      observed = observed,
      theta_diag = TRUE,
      theta_fixed = FALSE,
      theta_d_equal = TRUE,
      theta_d_values = NULL,
      theta_d_free = NULL,
      theta_d_lbound = NULL,
      theta_d_ubound = NULL,
      theta_l_values = NULL
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            theta
          )
        )
        testthat::expect_true(
          all(
            names(
              theta
            ) == c(
              "theta_d",
              "theta_d_vec",
              "theta",
              "theta_vech",
              "theta_vec",
              "r_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "theta_d"),
      {
        testthat::skip_on_cran()
        obj <- theta$theta_d
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "theta_d"
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
              "theta",
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
      paste(text, "theta"),
      {
        testthat::skip_on_cran()
        obj <- theta$theta
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "theta"
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
      paste(text, "r_mat"),
      {
        testthat::skip_on_cran()
        obj <- theta$r_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "R"
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
  text = "test-fitVARMxID-theta-fixed-false-diag-d-equal-true-null"
)

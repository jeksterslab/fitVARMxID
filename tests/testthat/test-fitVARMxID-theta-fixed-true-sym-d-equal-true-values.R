## ---- test-fitVARMxID-theta-fixed-true-sym-d-equal-true-values
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
      theta_diag = FALSE,
      theta_fixed = TRUE,
      theta_d_equal = TRUE,
      theta_d_free = matrix(
        data = TRUE,
        nrow = k,
        ncol = 1
      ),
      theta_d_values = matrix(
        data = 1,
        nrow = k,
        ncol = 1
      ),
      theta_d_lbound = matrix(
        data = -1,
        nrow = k,
        ncol = 1
      ),
      theta_d_ubound = matrix(
        data = +1,
        nrow = k,
        ncol = 1
      ),
      theta_l_free = matrix(
        data = TRUE,
        nrow = k,
        ncol = k
      ),
      theta_l_values = matrix(
        data = 1,
        nrow = k,
        ncol = k
      ),
      theta_l_lbound = matrix(
        data = -1,
        nrow = k,
        ncol = k
      ),
      theta_l_ubound = matrix(
        data = +1,
        nrow = k,
        ncol = k
      )
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
              "theta_l",
              "theta_d",
              "theta",
              "theta_vech",
              "r_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "theta_l"),
      {
        testthat::skip_on_cran()
        obj <- theta$theta_l
        testthat::expect_true(
          class(
            obj
          ) == "SdiagMatrix"
        )
        testthat::expect_true(
          obj$name == "theta_l"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = c(
                0, 1, 1,
                0, 0, 1,
                0, 0, 0
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
              data = c(
                FALSE, FALSE, FALSE,
                FALSE, FALSE, FALSE,
                FALSE, FALSE, FALSE
              ),
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
              data = 1,
              nrow = k,
              ncol = 1
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
              ncol = 1
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
  text = "test-fitVARMxID-theta-fixed-true-sym-d-equal-true-values"
)

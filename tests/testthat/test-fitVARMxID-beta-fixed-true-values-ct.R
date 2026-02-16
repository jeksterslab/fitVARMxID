## ---- test-fitVARMxID-beta-fixed-true-values-ct
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
      beta_free = c(
        diag(
          x = TRUE,
          nrow = k,
          ncol = k
        )
      ),
      beta_values = c(
        matrix(
          data = 1,
          nrow = k,
          ncol = k
        )
      ),
      beta_lbound = c(
        matrix(
          data = -1,
          nrow = k,
          ncol = k
        )
      ),
      beta_ubound = c(
        matrix(
          data = +1,
          nrow = k,
          ncol = k
        )
      ),
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
            obj$values == simStateSpace::ProjectToHurwitz(
              matrix(
                data = 1,
                nrow = k,
                ncol = k
              )
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
  },
  text = "test-fitVARMxID-beta-fixed-true-values-ct"
)

## ---- test-fitVARMxID-beta-fixed-false-null
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
      beta_fixed = FALSE,
      beta_free = NULL,
      beta_values = NULL,
      beta_lbound = NULL,
      beta_ubound = NULL,
      ct = FALSE
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
              "beta_vec",
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
            obj$values == 0.001 * diag(k)
          )
        )
        testthat::expect_true(
          all(
            obj$labels == outer(
              X = idx,
              Y = idx,
              FUN = function(x, y) {
                paste0(
                  "beta",
                  "_",
                  x,
                  "_",
                  y
                )
              }
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = TRUE,
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$lbound == matrix(
              data = -2.5,
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$ubound == matrix(
              data = 2.5,
              nrow = k,
              ncol = k
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "beta_vec"),
      {
        testthat::skip_on_cran()
        obj <- beta$beta_vec
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "beta_vec"
        )
        testthat::expect_true(
          all(
            obj$values == rep(
              x = 0,
              times = k * k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$labels == c(
              outer(
                X = idx,
                Y = idx,
                FUN = function(x, y) {
                  paste0(
                    "beta",
                    "[",
                    x,
                    ",",
                    y,
                    "]"
                  )
                }
              )
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == rep(
              x = FALSE,
              times = k * k
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
  text = "test-fitVARMxID-beta-fixed-false-null"
)

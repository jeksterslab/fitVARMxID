## ---- test-fitVARMxID-nu-fixed-false-null
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
    nu <- fitVARMxID:::.FitVARMxIDNu(
      k = k,
      observed = observed,
      nu_fixed = FALSE,
      nu_free = NULL,
      nu_values = NULL,
      nu_lbound = NULL,
      nu_ubound = NULL
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            nu
          )
        )
        testthat::expect_true(
          all(
            names(
              nu
            ) == c(
              "nu",
              "nu_vec",
              "d_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "nu"),
      {
        testthat::skip_on_cran()
        obj <- nu$nu
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "nu"
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
            obj$labels == paste0(
              "nu_",
              seq_len(k),
              "_1"
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == rep(
              x = TRUE,
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
      paste(text, "nu_vec"),
      {
        testthat::skip_on_cran()
        obj <- nu$nu_vec
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "nu_vec"
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
            obj$labels == paste0(
              "nu[",
              seq_len(k),
              ",",
              "1]"
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
      paste(text, "d_mat"),
      {
        testthat::skip_on_cran()
        obj <- nu$d_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "D"
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
  text = "test-fitVARMxID-nu-fixed-false-null"
)

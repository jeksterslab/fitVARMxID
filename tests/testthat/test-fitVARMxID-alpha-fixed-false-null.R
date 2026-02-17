## ---- test-fitVARMxID-alpha-fixed-false-null
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
    alpha <- fitVARMxID:::.FitVARMxIDAlpha(
      k = k,
      statenames = statenames,
      alpha_fixed = FALSE,
      alpha_free = NULL,
      alpha_values = NULL,
      alpha_lbound = NULL,
      alpha_ubound = NULL,
      ct = FALSE
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(
            alpha
          )
        )
        testthat::expect_true(
          all(
            names(
              alpha
            ) == c(
              "alpha",
              "alpha_vec",
              "mu",
              "b_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "alpha"),
      {
        testthat::skip_on_cran()
        obj <- alpha$alpha
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "alpha"
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
              "alpha_",
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
      paste(text, "alpha_vec"),
      {
        testthat::skip_on_cran()
        obj <- alpha$alpha_vec
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "alpha_vec"
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
              "alpha[",
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
      paste(text, "mu"),
      {
        testthat::skip_on_cran()
        obj <- alpha$mu
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "mu"
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
      paste(text, "b_mat"),
      {
        testthat::skip_on_cran()
        obj <- alpha$b_mat
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "B"
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
  text = "test-fitVARMxID-alpha-fixed-false-null"
)

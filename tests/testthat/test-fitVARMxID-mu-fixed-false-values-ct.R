## ---- test-fitVARMxID-mu-fixed-false-values-ct
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
    mu <- fitVARMxID:::.FitVARMxIDMu(
      k = k,
      statenames = statenames,
      mu_fixed = FALSE,
      mu_free = matrix(
        data = rep(
          x = TRUE,
          times = k
        ),
        nrow = k
      ),
      mu_values = matrix(
        data = rep(
          x = 1,
          times = k
        ),
        nrow = k
      ),
      mu_lbound = matrix(
        data = rep(
          x = -1,
          times = k
        ),
        nrow = k
      ),
      mu_ubound = matrix(
        data = rep(
          x = +1,
          times = k
        ),
        nrow = k
      ),
      ct = TRUE
    )
    testthat::test_that(
      paste(text, "list"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          is.list(mu)
        )
        testthat::expect_true(
          all(
            names(mu) == c(
              "alpha",
              "mu",
              "mu_vec",
              "b_mat"
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "mu"),
      {
        testthat::skip_on_cran()
        obj <- mu$mu
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "mu"
        )
        testthat::expect_true(
          all(
            obj$values == rep(
              x = 1,
              times = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$labels == paste0(
              "mu_",
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
            obj$lbound == rep(
              x = -1,
              times = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$ubound == rep(
              x = 1,
              times = k
            )
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "mu_vec"),
      {
        testthat::skip_on_cran()
        obj <- mu$mu_vec
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "mu_vec"
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
              "mu[",
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
      paste(text, "alpha"),
      {
        testthat::skip_on_cran()
        obj <- mu$alpha
        testthat::expect_true(
          class(
            obj
          ) == "MxAlgebra"
        )
        testthat::expect_true(
          obj$name == "alpha"
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
        obj <- mu$b_mat
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
  text = "test-fitVARMxID-mu-fixed-false-values-ct"
)

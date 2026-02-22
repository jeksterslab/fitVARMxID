## ---- test-fitVARMxID-sigma0-fixed-false-sym-d-equal-true-values
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
      sigma0_diag = FALSE,
      sigma0_fixed = FALSE,
      sigma0_d_equal = TRUE,
      sigma0_d_values = rep(
        x = 1,
        times = k
      ),
      sigma0_d_free = NULL,
      sigma0_d_lbound = rep(
        x = -2.5,
        times = k
      ),
      sigma0_d_ubound = rep(
        x = 2.5,
        times = k
      ),
      sigma0_l_values = rep(
        x = 1,
        times = k * k
      ),
      sigma0_l_free = NULL,
      sigma0_l_lbound = rep(
        x = -2.5,
        times = k * k
      ),
      sigma0_l_ubound = rep(
        x = 2.5,
        times = k * k
      )
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
              "sigma0_l_vec",
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
      paste(text, "sigma0_l"),
      {
        testthat::skip_on_cran()
        obj <- sigma0$sigma0_l
        testthat::expect_true(
          class(
            obj
          ) == "SdiagMatrix"
        )
        testthat::expect_true(
          obj$name == "sigma0_l"
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
            c(
              obj$labels
            )[
              complete.cases(
                c(
                  obj$labels
                )
              )
            ] == c(
              "sigma0_l_2_1",
              "sigma0_l_3_1",
              "sigma0_l_3_2"
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = c(
                FALSE, TRUE, TRUE,
                FALSE, FALSE, TRUE,
                FALSE, FALSE, FALSE
              ),
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            c(
              obj$lbound
            )[
              complete.cases(
                c(
                  obj$lbound
                )
              )
            ] == -2.5
          )
        )
        testthat::expect_true(
          all(
            c(
              obj$ubound
            )[
              complete.cases(
                c(
                  obj$ubound
                )
              )
            ] == 2.5
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
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "sigma0_vec"
        )
        testthat::expect_true(
          all(
            obj$values == matrix(
              data = 0,
              nrow = 0.5 * (k * (k + 1)),
              ncol = 1
            )
          )
        )
        testthat::expect_true(
          all(
            c(
              obj$labels
            ) == .Vech(
              outer(
                X = idx,
                Y = idx,
                FUN = function(x, y) {
                  paste0(
                    "sigma0[",
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
            obj$free == matrix(
              data = FALSE,
              nrow = 0.5 * (k * (k + 1)),
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
  text = "test-fitVARMxID-sigma0-fixed-false-sym-d-equal-true-values"
)

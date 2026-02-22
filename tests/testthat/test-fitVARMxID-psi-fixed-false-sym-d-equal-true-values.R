## ---- test-fitVARMxID-psi-fixed-false-sym-d-equal-true-values
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
      psi_diag = FALSE,
      psi_fixed = FALSE,
      psi_d_equal = TRUE,
      psi_d_values = rep(
        x = 1,
        times = k
      ),
      psi_d_free = NULL,
      psi_d_lbound = rep(
        x = -2.5,
        times = k
      ),
      psi_d_ubound = rep(
        x = 2.5,
        times = k
      ),
      psi_l_values = rep(
        x = 1,
        times = k * k
      ),
      psi_l_free = NULL,
      psi_l_lbound = rep(
        x = -2.5,
        times = k * k
      ),
      psi_l_ubound = rep(
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
            psi
          )
        )
        testthat::expect_true(
          all(
            names(
              psi
            ) == c(
              "psi_l",
              "psi_l_vec",
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
      paste(text, "psi_l"),
      {
        testthat::skip_on_cran()
        obj <- psi$psi_l
        testthat::expect_true(
          class(
            obj
          ) == "SdiagMatrix"
        )
        testthat::expect_true(
          obj$name == "psi_l"
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
              "psi_l_2_1",
              "psi_l_3_1",
              "psi_l_3_2"
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
      paste(text, "psi_vec"),
      {
        testthat::skip_on_cran()
        obj <- psi$psi_vec
        testthat::expect_true(
          class(
            obj
          ) == "FullMatrix"
        )
        testthat::expect_true(
          obj$name == "psi_vec"
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
                    "psi[",
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
  text = "test-fitVARMxID-psi-fixed-false-sym-d-equal-true-values"
)

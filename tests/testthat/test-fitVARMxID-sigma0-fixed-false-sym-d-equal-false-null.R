## ---- test-fitVARMxID-sigma0-fixed-false-sym-d-equal-false-null
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
      sigma0_d_equal = FALSE,
      sigma0_d_values = NULL,
      sigma0_d_free = NULL,
      sigma0_d_lbound = NULL,
      sigma0_d_ubound = NULL,
      sigma0_l_values = NULL,
      sigma0_l_free = NULL,
      sigma0_l_lbound = NULL,
      sigma0_l_ubound = NULL
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
              data = 0,
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
              data = log(expm1(1)),
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
              idx,
              "_",
              1
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
  text = "test-fitVARMxID-sigma0-fixed-false-sym-d-equal-false-null"
)

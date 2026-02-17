## ---- test-fitVARMxID-beta-fixed-false-values
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
      beta_free = diag(
        x = TRUE,
        nrow = k,
        ncol = k
      ),
      beta_values = matrix(
        data = 1,
        nrow = k,
        ncol = k
      ),
      beta_lbound = matrix(
        data = -1,
        nrow = k,
        ncol = k
      ),
      beta_ubound = matrix(
        data = +1,
        nrow = k,
        ncol = k
      ),
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
            obj$values == simStateSpace::ProjectToStability(
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
            c(
              obj$labels
            )[
              complete.cases(
                c(
                  obj$labels
                )
              )
            ] == paste0(
              "beta",
              "_",
              idx,
              "_",
              idx
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = c(
                TRUE, FALSE, FALSE,
                FALSE, TRUE, FALSE,
                FALSE, FALSE, TRUE
              ),
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            diag(
              obj$lbound
            ) == diag(
              matrix(
                data = c(
                  -1, NA, NA,
                  NA, -1, NA,
                  NA, NA, -1
                ),
                nrow = k,
                ncol = k
              )
            )
          )
        )
        testthat::expect_true(
          all(
            diag(
              obj$ubound
            ) == diag(
              matrix(
                data = c(
                  1, NA, NA,
                  NA, 1, NA,
                  NA, NA, 1
                ),
                nrow = k,
                ncol = k
              )
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
              times = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$labels == paste0(
              "beta",
              "[",
              idx,
              ",",
              idx,
              "]"
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
    beta <- fitVARMxID:::.FitVARMxIDBeta(
      k = k,
      statenames = statenames,
      beta_fixed = FALSE,
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
            obj$values == simStateSpace::ProjectToStability(
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
            c(
              obj$labels
            )[
              complete.cases(
                c(
                  obj$labels
                )
              )
            ] == paste0(
              "beta",
              "_",
              idx,
              "_",
              idx
            )
          )
        )
        testthat::expect_true(
          all(
            obj$free == matrix(
              data = c(
                TRUE, FALSE, FALSE,
                FALSE, TRUE, FALSE,
                FALSE, FALSE, TRUE
              ),
              nrow = k,
              ncol = k
            )
          )
        )
        testthat::expect_true(
          all(
            diag(
              obj$lbound
            ) == diag(
              matrix(
                data = c(
                  -1, NA, NA,
                  NA, -1, NA,
                  NA, NA, -1
                ),
                nrow = k,
                ncol = k
              )
            )
          )
        )
        testthat::expect_true(
          all(
            diag(
              obj$ubound
            ) == diag(
              matrix(
                data = c(
                  1, NA, NA,
                  NA, 1, NA,
                  NA, NA, 1
                ),
                nrow = k,
                ncol = k
              )
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
              times = k
            )
          )
        )
        testthat::expect_true(
          all(
            obj$labels == paste0(
              "beta",
              "[",
              idx,
              ",",
              idx,
              "]"
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
  text = "test-fitVARMxID-beta-fixed-false-values"
)

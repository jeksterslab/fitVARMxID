## ---- test-fitVARMxID-theta-fixed-false-sym
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
    observed <- paste0("y", idx)
    theta <- fitVARMxID:::.FitVARMxIDTheta(
      k = k,
      observed = observed,
      theta_diag = FALSE,
      theta_fixed = FALSE,
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
      theta_d_equal = FALSE,
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
      ),
      name = "theta"
    )
    theta_d_name <- theta$theta_d@name
    theta_d_vec_name <- theta$theta_d_vec@name
    theta_name <- theta$theta@name
    theta_vech_name <- theta$theta_vech@name
    theta_vec_name <- theta$theta_vec@name
    theta_d_values <- theta$theta_d@values
    theta_d_vec_values <- theta$theta_d_vec@values
    theta_vec_values <- theta$theta_vec@values
    theta_d_labels <- theta$theta_d@labels
    theta_d_vec_labels <- theta$theta_d_vec@labels
    theta_vec_labels <- theta$theta_vec@labels
    theta_d_free <- theta$theta_d@free
    theta_d_vec_free <- theta$theta_d_vec@free
    theta_vec_free <- theta$theta_vec@free
    theta_d_lbound <- theta$theta_d@lbound
    theta_d_vec_lbound <- theta$theta_d_vec@lbound
    theta_vec_lbound <- theta$theta_vec@lbound
    theta_d_ubound <- theta$theta_d@ubound
    theta_d_vec_ubound <- theta$theta_d_vec@ubound
    theta_vec_ubound <- theta$theta_vec@ubound
    theta_l_name <- theta$theta_l@name
    theta_l_vec_name <- theta$theta_l_vec@name
    theta_l_values <- theta$theta_l@values
    theta_l_vec_values <- theta$theta_l_vec@values
    theta_l_labels <- theta$theta_l@labels
    theta_l_vec_labels <- theta$theta_l_vec@labels
    theta_l_free <- theta$theta_l@free
    theta_l_vec_free <- theta$theta_l_vec@free
    theta_l_lbound <- theta$theta_l@lbound
    theta_l_vec_lbound <- theta$theta_l_vec@lbound
    theta_l_ubound <- theta$theta_l@ubound
    theta_l_vec_ubound <- theta$theta_l_vec@ubound
    testthat::test_that(
      paste(text, "class"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          class(theta$theta_d) == "FullMatrix"
        )
        testthat::expect_true(
          class(theta$theta_l) == "SdiagMatrix"
        )
        testthat::expect_true(
          class(theta$theta) == "MxAlgebra"
        )
        testthat::expect_true(
          class(theta$theta_vech) == "MxAlgebra"
        )
        testthat::expect_true(
          class(theta$theta_vec) == "FullMatrix"
        )
      }
    )
    testthat::test_that(
      paste(text, "values"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_d_values),
            rep(x = 1, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_d_vec_values),
            rep(x = 0, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_values),
            c(0, 1, 1, 0, 0, 1, 0, 0, 0)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_vec_values),
            rep(x = 0, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_vec_values),
            rep(x = 0, times = 0.5 * (k * (k + 1)))
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "labels"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_d_labels),
            paste0("theta_d_", idx, "_1")
          )
        )
        testthat::expect_true(
          identical(
            c(theta_d_vec_labels),
            paste0("theta_d[", idx, ",1]")
          )
        )
        theta_l_labels_results <- outer(
          X = idx,
          Y = idx,
          FUN = function(x, y) {
            paste0(
              "theta_l[",
              x,
              ",",
              y,
              "]"
            )
          }
        )
        theta_l_labels_results <- theta_l_labels_results[
          lower.tri(
            x = theta_l_labels_results,
            diag = FALSE
          )
        ]
        testthat::expect_true(
          identical(
            c(theta_l_vec_labels),
            theta_l_labels_results
          )
        )
        theta_labels_results <- outer(
          X = idx,
          Y = idx,
          FUN = function(x, y) {
            paste0(
              "theta[",
              x,
              ",",
              y,
              "]"
            )
          }
        )
        theta_labels_results <- theta_labels_results[
          lower.tri(
            x = theta_labels_results,
            diag = TRUE
          )
        ]
        testthat::expect_true(
          identical(
            c(theta_vec_labels),
            theta_labels_results
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "free"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_d_free),
            rep(x = TRUE, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_d_vec_free),
            rep(x = FALSE, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_free),
            c(FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_vec_free),
            rep(x = FALSE, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_vec_free),
            rep(x = FALSE, times = 0.5 * (k * (k + 1)))
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "lbound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_d_lbound),
            rep(x = -1, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_d_vec_lbound),
            rep(x = NA_real_, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_lbound),
            c(NA, -1, -1, NA, NA, -1, NA, NA, NA)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_vec_lbound),
            rep(x = NA_real_, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_vec_lbound),
            rep(x = NA_real_, times = 0.5 * (k * (k + 1)))
          )
        )
      }
    )
    testthat::test_that(
      paste(text, "ubound"),
      {
        testthat::skip_on_cran()
        testthat::expect_true(
          identical(
            c(theta_d_ubound),
            rep(x = 1, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_d_vec_ubound),
            rep(x = NA_real_, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_ubound),
            c(NA, 1, 1, NA, NA, 1, NA, NA, NA)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_l_vec_ubound),
            rep(x = NA_real_, times = k)
          )
        )
        testthat::expect_true(
          identical(
            c(theta_vec_ubound),
            rep(x = NA_real_, times = 0.5 * (k * (k + 1)))
          )
        )
      }
    )
  },
  text = "test-fitVARMxID-theta-fixed-false-sym"
)

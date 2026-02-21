.FitVARMxIDPsi <- function(k,
                           statenames,
                           psi_diag,
                           psi_fixed,
                           psi_d_free,
                           psi_d_values,
                           psi_d_lbound,
                           psi_d_ubound,
                           psi_d_equal,
                           psi_l_free,
                           psi_l_values,
                           psi_l_lbound,
                           psi_l_ubound) {
  # Q
  # process noise
  if (isTRUE(psi_fixed)) {
    psi_d_free <- FALSE
    psi_l_free <- FALSE
  }
  type <- NULL
  if (isTRUE(psi_fixed)) {
    if (is.null(psi_d_values)) {
      # fix to a zero matrix (jitter 1e-10)
      type <- "zero"
    }
  } else {
    if (is.null(psi_d_lbound)) {
      psi_d_lbound <- -30
    } else {
      if (
        any(psi_d_lbound <= -700)
      ) {
        stop(
          paste0(
            "`psi_d_ubound` <= -700."
          )
        )
      }
    }
    if (is.null(psi_d_ubound)) {
      psi_d_ubound <- 650
    } else {
      if (
        any(psi_d_ubound >= 700)
      ) {
        stop(
          "`psi_d_ubound` >= 700."
        )
      }
    }
  }
  psi <- .FitVARMxIDCov(
    k = k,
    row = statenames,
    name = "psi",
    type = type,
    diag = psi_diag,
    fixed = psi_fixed,
    d_free = psi_d_free,
    d_values = psi_d_values,
    d_lbound = psi_d_lbound,
    d_ubound = psi_d_ubound,
    d_equal = psi_d_equal,
    l_free = psi_l_free,
    l_values = psi_l_values,
    l_lbound = psi_l_lbound,
    l_ubound = psi_l_ubound
  )
  if (isTRUE(psi_fixed)) {
    if (!is.null(type)) {
      if (type == "zero") {
        psi$psi <- .MxHelperFullMxMatrix(
          m = k,
          n = k,
          free_val = FALSE,
          values = 0,
          lbound_val = NA,
          ubound_val = NA,
          vec = FALSE,
          row = statenames,
          col = statenames,
          name = "psi"
        )[["psi"]]
      }
    }
  }
  q_mat <- list(
    q_mat = OpenMx::mxAlgebraFromString(
      algString = "psi",
      name = "Q",
      dimnames = list(
        statenames,
        statenames
      )
    )
  )
  c(
    psi,
    q_mat
  )
}

.FitVARMxParameterVec <- function(mean_str,
                                  beta,
                                  nu,
                                  psi,
                                  theta,
                                  mu0,
                                  sigma0) {
  if (is.null(mu0[["mu0_vec"]])) {
    mu0_vec <- NA
    mu0_vec_labels <- NA
  } else {
    mu0_vec <- "mu0_vec"
    mu0_vec_labels <- c(
      mu0$mu0_vec$labels
    )
  }
  if (is.null(sigma0[["sigma0_vec"]])) {
    sigma0_vec <- NA
    sigma0_vec_labels <- NA
  } else {
    sigma0_vec <- "sigma0_vec"
    sigma0_vec_labels <- c(
      sigma0$sigma0_vec$labels
    )
  }
  if (is.null(mean_str[["mu_vec"]])) {
    mu_vec <- NA
    mu_vec_labels <- NA
  } else {
    mu_vec <- "mu_vec"
    mu_vec_labels <- c(
      mean_str$mu_vec$labels
    )
  }
  if (is.null(mean_str[["alpha_vec"]])) {
    alpha_vec <- NA
    alpha_vec_labels <- NA
  } else {
    alpha_vec <- "alpha_vec"
    alpha_vec_labels <- c(
      mean_str$alpha_vec$labels
    )
  }
  if (is.null(beta[["beta_vec"]])) {
    beta_vec <- NA
    beta_vec_labels <- NA
  } else {
    beta_vec <- "beta_vec"
    beta_vec_labels <- c(
      beta$beta_vec$labels
    )
  }
  if (is.null(nu[["nu_vec"]])) {
    nu_vec <- NA
    nu_vec_labels <- NA
  } else {
    nu_vec <- "nu_vec"
    nu_vec_labels <- c(
      nu$nu_vec$labels
    )
  }
  if (is.null(psi[["psi_vec"]])) {
    psi_vec <- NA
    psi_vec_labels <- NA
  } else {
    psi_vec <- "psi_vec"
    psi_vec_labels <- c(
      psi$psi_vec$labels
    )
  }
  if (is.null(theta[["theta_vec"]])) {
    theta_vec <- NA
    theta_vec_labels <- NA
  } else {
    theta_vec <- "theta_vec"
    theta_vec_labels <- c(
      theta$theta_vec$labels
    )
  }
  parameter_vec <- c(
    mu_vec,
    alpha_vec,
    beta_vec,
    psi_vec,
    nu_vec,
    theta_vec,
    mu0_vec,
    sigma0_vec
  )
  parameter_vec <- parameter_vec[
    stats::complete.cases(
      parameter_vec
    )
  ]
  parameter_vec <- paste0(
    parameter_vec,
    collapse = ","
  )
  parameter_vec_labels <- c(
    mu_vec_labels,
    alpha_vec_labels,
    beta_vec_labels,
    psi_vec_labels,
    nu_vec_labels,
    theta_vec_labels,
    mu0_vec_labels,
    sigma0_vec_labels
  )
  parameter_vec_labels <- parameter_vec_labels[
    stats::complete.cases(
      parameter_vec_labels
    )
  ]
  list(
    parameter_vec = OpenMx::mxAlgebraFromString(
      algString = paste0(
        "rbind(",
        parameter_vec,
        ")"
      ),
      name = "parameter_vec",
      dimnames = list(
        parameter_vec_labels,
        "parameter_vec"
      )
    )
  )
}

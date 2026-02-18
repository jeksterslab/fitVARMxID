.FitVARMxIDModelID <- function(id,
                               data,
                               observed,
                               ct,
                               time,
                               beta,
                               mean_str,
                               lambda,
                               nu,
                               psi,
                               theta,
                               mu0,
                               sigma0,
                               covariate,
                               sigma,
                               algebras) {
  parameter_vec <- .FitVARMxParameterVec(
    mean_str = mean_str,
    beta = beta,
    nu = nu,
    psi = psi,
    theta = theta,
    mu0 = mu0,
    sigma0 = sigma0
  )
  if (isTRUE(ct)) {
    model <- paste0(
      "CTVAR",
      "_",
      "ID",
      id
    )
    time <- OpenMx::mxMatrix(
      type = "Full",
      nrow = 1,
      ncol = 1,
      free = FALSE,
      labels = paste0(
        "data.",
        time
      ),
      name = "time"
    )
    expectation <- OpenMx::mxExpectationStateSpaceContinuousTime(
      A = "A",
      B = "B",
      C = "C",
      D = "D",
      Q = "Q",
      R = "R",
      x0 = "x0",
      P0 = "P0",
      u = "covariate",
      t = "time",
      dimnames = observed
    )
  } else {
    model <- paste0(
      "DTVAR",
      "_",
      "ID",
      id
    )
    time <- OpenMx::mxMatrix(
      type = "Full",
      nrow = 1,
      ncol = 1,
      free = FALSE,
      name = "time"
    )
    expectation <- OpenMx::mxExpectationStateSpace(
      A = "A",
      B = "B",
      C = "C",
      D = "D",
      Q = "Q",
      R = "R",
      x0 = "x0",
      P0 = "P0",
      u = "covariate",
      dimnames = observed
    )
  }
  OpenMx::mxModel(
    model = model,
    beta,
    mean_str,
    lambda,
    nu,
    psi,
    theta,
    mu0,
    sigma0,
    covariate,
    sigma,
    algebras,
    parameter_vec,
    expectation,
    time,
    OpenMx::mxFitFunctionML(),
    OpenMx::mxData(
      observed = data,
      type = "raw"
    )
  )
}

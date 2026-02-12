.FitVARMxIDModelID <- function(id,
                               data,
                               observed,
                               ct,
                               time,
                               beta,
                               alpha,
                               lambda,
                               nu,
                               psi,
                               theta,
                               mu0,
                               sigma0,
                               covariate) {
  if (ct) {
    time <- OpenMx::mxMatrix(
      "Full",
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
      t = time,
      dimnames = observed
    )
  } else {
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
    model = paste0(
      "VAR",
      "_",
      "ID",
      id
    ),
    beta,
    alpha,
    lambda,
    nu,
    psi,
    theta,
    mu0,
    sigma0,
    covariate,
    expectation,
    .FitVARMxParameterVec(
      alpha = alpha,
      beta = beta,
      nu = nu,
      psi = psi,
      theta = theta
    ),
    OpenMx::mxFitFunctionML(),
    OpenMx::mxData(
      observed = data,
      type = "raw"
    )
  )
}

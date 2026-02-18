.FitVARMxIDAlgebras <- function(k,
                                ct,
                                eigenval_beta,
                                eigenvec_beta,
                                eigenmod_beta,
                                spectral_beta,
                                solve_psi,
                                halflife_beta,
                                cor_psi,
                                pcor_psi) {
  if (isTRUE(pcor_psi)) {
    solve_psi <- TRUE
  }
  out <- list()
  iden <- list(
    iden_k = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k,
      ncol = k,
      name = "iden_k"
    ),
    iden_k_sqr = OpenMx::mxMatrix(
      type = "Iden",
      nrow = k^2,
      ncol = k^2,
      name = "iden_k_sqr"
    )
  )
  out <- c(
    out,
    iden
  )
  if (isTRUE(eigenval_beta)) {
    eigenval_beta <- list(
      eigenval_beta = OpenMx::mxAlgebraFromString(
        algString = "eigenval(beta)",
        name = "eigenval_beta"
      ),
      ieigenval_beta = OpenMx::mxAlgebraFromString(
        algString = "ieigenval(beta)",
        name = "ieigenval_beta"
      )
    )
    out <- c(
      out,
      eigenval_beta
    )
  }
  if (isTRUE(eigenvec_beta)) {
    eigenvec_beta <- list(
      eigenvec_beta = OpenMx::mxAlgebraFromString(
        algString = "eigenvec(beta)",
        name = "eigenvec_beta"
      ),
      ieigenvec_beta = OpenMx::mxAlgebraFromString(
        algString = "ieigenvec(beta)",
        name = "ieigenvec_beta"
      )
    )
    out <- c(
      out,
      eigenvec_beta
    )
  }
  if (isTRUE(solve_psi)) {
    solve_psi <- list(
      solve_psi = OpenMx::mxAlgebraFromString(
        algString = "solve(psi)",
        name = "solve_psi"
      )
    )
    out <- c(
      out,
      solve_psi
    )
  }
  if (isTRUE(eigenmod_beta)) {
    eigenmod_beta_algebra <- paste0(
      "sqrt(eigenval(beta)",
      " * eigenval(beta) + ieigenval(beta) * ",
      "ieigenval(beta))"
    )
    eigenmod_beta <- list(
      eigenmod_beta = OpenMx::mxAlgebraFromString(
        algString = eigenmod_beta_algebra,
        name = "eigenmod_beta"
      )
    )
    out <- c(
      out,
      eigenmod_beta
    )
  }
  if (isTRUE(spectral_beta)) {
    if (isTRUE(ct)) {
      spectral_beta <- list(
        spectral_beta = OpenMx::mxAlgebraFromString(
          algString = "max(eigenval(beta))",
          name = "spectral_beta"
        )
      )
    } else {
      spectral_beta_algebra <- paste0(
        "max(sqrt(eigenval(beta)",
        " * eigenval(beta) + ieigenval(beta)",
        " * ieigenval(beta)))"
      )
      spectral_beta <- list(
        spectral_beta = OpenMx::mxAlgebraFromString(
          algString = spectral_beta_algebra,
          name = "spectral_beta"
        )
      )
    }
    out <- c(
      out,
      spectral_beta
    )
  }
  if (isTRUE(halflife_beta)) {
    if (isTRUE(ct)) {
      halflife_beta_algebra <- paste0(
        "log(2) / (-max(eigenval(beta)))"
      )
      halflife_beta <- list(
        halflife_beta = OpenMx::mxAlgebraFromString(
          algString = halflife_beta_algebra,
          name = "halflife_beta"
        )
      )
    } else {
      halflife_beta_algebra <- paste0(
        "log(0.5) / log(max(sqrt(eigenval(beta)^2",
        " + ieigenval(beta)^2)))"
      )
      halflife_beta <- list(
        halflife_beta = OpenMx::mxAlgebraFromString(
          algString = halflife_beta_algebra,
          name = "halflife_beta"
        )
      )
    }
    out <- c(
      out,
      halflife_beta
    )
  }
  if (isTRUE(cor_psi)) {
    cor_psi_algebra <- paste0(
      "vec2diag(1 / sqrt(diag2vec(psi)))",
      " %*% psi %*% ",
      "vec2diag(1 / sqrt(diag2vec(psi)))"
    )
    cor_psi <- list(
      cor_psi = OpenMx::mxAlgebraFromString(
        algString = cor_psi_algebra,
        name = "cor_psi"
      )
    )
    out <- c(
      out,
      cor_psi
    )
  }
  if (isTRUE(pcor_psi)) {
    pcor_raw <- paste0(
      "-vec2diag(1 / sqrt(diag2vec(solve_psi)))",
      " %*% solve_psi %*% ",
      "vec2diag(1 / sqrt(diag2vec(solve_psi)))"
    )
    pcor_psi_algebra <- paste0(
      "(",
      pcor_raw,
      ") - vec2diag(diag2vec(",
      pcor_raw,
      ")) + iden_k"
    )
    pcor_psi <- list(
      pcor_psi = OpenMx::mxAlgebraFromString(
        algString = pcor_psi_algebra,
        name = "pcor_psi"
      )
    )
    out <- c(
      out,
      pcor_psi
    )
  }
  out
}

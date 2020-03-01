library(RcppEigen)
library(microbenchmark)

Sys.setenv("PKG_CPPFLAGS" = "-march=native")

# Use Rcpp attributes -----------------------------------------------------

sourceCpp(file = "MatrixMult.cpp", verbose = TRUE, rebuild = TRUE)
sourceCpp(file = "MatrixSolver.cpp", verbose = TRUE, rebuild = TRUE)

A = matrix(rnorm(1000*1000), nrow = 1000)
B = matrix(rnorm(1000*1000), nrow = 1000)
x = matrix(rnorm(1000), nrow = 1000)
b = MatrixMultC(A, x)

microbenchmark(
  RcppEigen = MatrixSolverC(A,b),
  R = solve(A, b),
  times = 100L
)

2/(63.85*10^-3)
2/(466.36*10^-3)




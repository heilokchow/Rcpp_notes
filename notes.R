library(Rcpp)
library(rbenchmark)

fibR <- function(n) {
  if (n == 0) return(0)
  if (n == 1) return(1)
  return(fibR(n - 1) + fibR(n - 2))
}

sourceCpp(file = "fibonacci.cpp")

# Benchmarking
tests = list(rep=expression(fibR(20)), 
             arr=expression(fibC(20)))
do.call(benchmark,
        c(tests, list(replications=100,
                      columns=c('test', 'elapsed', 'replications'),
                      order='elapsed')))
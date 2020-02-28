#include <Rcpp.h>
using namespace Rcpp;

int fibC(int);

extern "C" SEXP fibWrapper(SEXP xs) {
  int x = Rcpp::as<int>(xs);
  int fib = fibC(x);
  return (Rcpp::wrap(fib));
}

int fibC(int x) {
  if (x < 2)
    return x;
  else
    return (fibC(x - 1) + fibC(x - 2));
}



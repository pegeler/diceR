#' @importFrom  Rcpp sourceCpp
#' @useDynLib diceR
NULL

#' Roll the dice
#'
#' These functions let us roll the dice
#'
#' The `fast_roll` function is an example
#' [Rcpp](https://cran.r-project.org/package=Rcpp) function. See more in the
#' _src/_ folder of the package source.
#'
#' @param r A character vector in the format "ndm" where _n_ is the number of
#'   dice and _m_ is the number of faces.
#' @param n An integer representing the number of dice.
#' @param m An integer representing the number of faces per die.
#' @examples
#' dice("2d6")
#'
#' 2 %d% 6
#' @author Paul Egeler, MS
#' @return An integer vector with the class "dice".
#' @export
dice <- function(r) {
  i <- strsplit(r, "d", TRUE)[[1]]
  v <- sample.int(i[2], i[1], TRUE)
  structure(v, class = "dice")
}

#' @rdname dice
#' @export
`%d%` <- function(n,m) structure(sample.int(m, n, TRUE), class = "dice")

#' @export
print.dice <- function(x, ...) {
  cat("You rolled...", paste0(sum(x), ":"), x, "\n")
  invisible(x)
}

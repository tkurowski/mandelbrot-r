
#' Build matrix with Mandelbrot fractal
#'
#' @param xrange Numeric vector.
#' @param yrange Numeric vector.
#' @param iter Number of iterations, > 0
#' @return A matrix
mandelbrot <- function (xrange = seq(-2.2, .8, length.out = 300), 
                        yrange = seq(-1.5, 1.5, length.out = 300),
                        iter = 25) {
    # mesh
    C <- complex(real=rep(xrange, times = length(yrange)),
                 imag=rep(yrange, each = length(xrange)))
    C <- matrix(C, 300, 300)
    m <- matrix(1, 300, 300)
    Z <- 0
    for (i in 1:iter) {
        Z = Z^2 + C
        m[Mod(Z) > 2 & m == 1] <- -i
    }

    m[m == 1] <- -iter
    -m
}

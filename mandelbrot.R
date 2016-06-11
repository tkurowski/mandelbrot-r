
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
    mx <- matrix(xrange, nrow = length(yrange), ncol = length(xrange))
    my <- matrix(yrange, nrow = length(yrange), ncol = length(xrange), byrow = T)
    
    m <- matrix(1, nrow = length(yrange), ncol = length(xrange))
    re <- matrix(0, nrow = length(yrange), ncol = length(xrange))
    im <- matrix(0, nrow = length(yrange), ncol = length(xrange))

    for (i in 1:iter) {
        # z <- z^2 + c
        re2 <- re^2
        im2 <- im^2

        # if mod(z) > 2 then m[_] = i
        m[re2 + im2 > 4 & m == 1] = -i

        im <- re * im * 2 + my
        re <- re2 - im2 + mx
    }

    m[m == 1] <- -iter
    -m
}

#image(m, col=c(heat.colors(50), "black"), asp=1)
    
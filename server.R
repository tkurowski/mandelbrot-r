library(shiny)
source('mandelbrot.R')

#draws <- 0

ORIGINAL_SIZE <- 3
ORIGINAL_YMIN <- -1.5

THEMES <- list(
    heat = heat.colors(12),
    red = rgb(.8 + 20:0 / 100, 20:0 / 20, 20:0 / 20),
    gray = grey(20:0 / 20)
)

shinyServer(function (input, output) {
    #generate <- eventReactive(input$draw, {
    generate <- (function () {
        xr <- input$xr
        vsize <- xr[2] - xr[1]

        # align sy% of viewport with sy% of original image
        ymin <- ORIGINAL_YMIN + input$sy / 100 * (ORIGINAL_SIZE - vsize)

        xrange <- seq(xr[1], xr[2], length.out = 300) # TODO parametrize resolution
        yrange <- seq(ymin, ymin + vsize, length.out = 300)

        list(x = xrange,
             y = yrange,
             z = mandelbrot(xrange, yrange, iter = input$iter))
    })
    output$img <- renderPlot({
        m <- generate()
        image(m$x, m$y, m$z, col = THEMES[[input$theme]],
              asp = 1, axes = FALSE, xlab='x', ylab='y')
        Axis(side=1)
        Axis(side=2)
        #draws <<- draws + 1
    }, width=450, height=450)
})

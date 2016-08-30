library(shiny)

shinyUI(fluidPage(
    titlePanel("Mandelbrot fractal"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("iter", h4("Iterations"),
                        min=5, max=40, value=25, step=1),
            p(HTML('The more the <em>steps</em>, the more mature the fractal.')),
            h4("Viewport"),
            p(HTML(paste("Set viewport size and horizontal position with",
                         "<em>x range</em>. Move it up and down with",
                         "<em>scroll y</em>."))),
            sliderInput("xr", "x range",
                        min=-2.2, max=.8, value=c(-2.2, .8), step=0.01),
            sliderInput("sy", "scroll y", post='%',
                        min=0, max=100, value=50, step=.1),
            p(HTML(paste("<em>Note, scroll has no effect",
                         "until you limit the the range</em>.")))
            #actionButton("draw", "Update"),
        ),
        mainPanel(p(HTML(paste("Mandelbrot fractal is probably the",
                               "most famous fractal of all time.",
                               "It is named after a french mathematician",
                               "of polish origin,",
                               "<a href='https://en.wikipedia.org/wiki/Benoit_Mandelbrot'>Benoit Mandelbrot</a>."))),
                  selectInput("theme", "Theme",
                              choices = list("Black Ink" = 'gray',
                                             "Blood" = 'red',
                                             "Solar" = 'heat')),
                  plotOutput("img"))
    )
))

# -0.74, -0.3, 75%

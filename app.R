library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel("Old Faithful Geyser Data"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("set_bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            actionButton("submit",
                         "Submit")
        ),

        mainPanel(
           plotOutput("dist_plot"),
           textOutput("print_bins")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  observeEvent(input$submit, {
    set_bins <- isolate(input$set_bins)

    output$dist_plot <- renderPlot({
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = set_bins + 1)

      hist(x, breaks = bins, col = 'darkgray', border = 'white',
           xlab = 'Waiting time to next eruption (in mins)',
           main = 'Histogram of waiting times')
    })

    output$print_bins <- renderText({
      set_bins
    })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

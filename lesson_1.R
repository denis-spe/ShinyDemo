# Import libraries .........
library (shiny)

# Define the UI for the app .......
ui <- fluidPage(
  # Application title .
  titlePanel("Hello Shiny"),
  
  # A Sidebar with input and output definition.
  sidebarLayout(
    sliderInput(
      inputId = "bins",
      label="Number of bins",
      min = 1,
      max = 50,
      value=30
    ),
  
    # Main panel for displaying the output ...........
    mainPanel(
    
    # Output: histograms.
    plotOutput(outputId="distplot")
    
    )
  )
  
)


# Define the App server .................
server <- function (input, output){
  
  # Assign the rendered plot to output.
  output$distplot <- renderPlot({
    
    # Get the waiting column from faith.
    x <- faithful$waiting
    
    # Initialize the bins.
    bins <- seq(
      min(x), 
      max(x), 
      length.out=input$bins + 1
    )
    
    hist(x, breaks=bins,
         col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
}

# Run the App ..............
shinyApp(ui=ui, server=server)
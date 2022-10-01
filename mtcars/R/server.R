# Motor Trend Car Road Tests 
# ==========================
# Server

library(tidyverse)
library(shiny)


# Define server for the application ..........
shinyServer(function(input, output) {
    
    # Display the data frame .......
    output$data_id <- renderDataTable({
      mtcars
    })
    
    # Categorical charts ..........
    output$categorical_id <- renderPlot({
      
      # X axis select box .....
      x_axis_var = input$cat_x_axis_id
      
      # kind of chart ....
      chart_type <- input$cat_chart_id
        
      if(chart_type == 'bar'){
        ggplot(mtcars, aes(x = .data[[x_axis_var]])) +
          geom_bar()
      }
    })

})

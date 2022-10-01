# Motor Trend Car Road Tests 
# ==========================
# User Interface

library(shiny)


get_categorical_columns <- function(data){
  # All data columns ....
  columns <- colnames(data)
  
  # Unique column vector ....
  unique_val_vector <- c()
  
  # Loop through the columns ....
  for(col in columns){
    
    # Number of unique values ....
    n_unique <- length(unique(data[[col]]))
    
    if (n_unique < 15){
      unique_val_vector <- append(col, unique_val_vector)
    }
    
  }
  
  return(unique_val_vector)
}

# Define UI for application .............
shinyUI(fluidPage(

    # Application title ..........
    titlePanel(strong("Motor Trend Car Road Tests")),

    # A Sidebar layout with sidebar panel and main panel ..........
    sidebarLayout(
        
        # Sidebar panel ............
        sidebarPanel(
          
          # Tab set panel .........
          tabsetPanel(
            
            # Description tab .....
            tabPanel(
              title = strong("Data Description"),
              
              h2(strong("Description")),
              
              p("The data was extracted from the 
              1974 Motor Trend US magazine, and 
              comprises fuel consumption and 10 
              aspects of automobile design and 
              performance for 32 automobiles 
              (1973–74 models)."),
              
              h3(strong("Format")),
              
              p("A data frame with 
                32 observations on 11 
                (numeric) variables."),
              
              p(strong("mpg:"),	"Miles/(US) gallon"),
              
              p(strong("cyl:"),	"Number of cylinders"),
              p(strong("disp:"),	"Displacement (cu.in.)"),
              p(strong("hp:"),	"Gross horsepower"),
              p(strong("drat:"),	"Rear axle ratio"),
              p(strong("wt:"),	"Weight (1000 lbs)"),
              p(strong("qsec:"),	"1/4 mile time"),
              p(strong("vs:"),	"Engine (0 = V-shaped, 1 = straight)"),
              p(strong("am:"),	"Transmission (0 = automatic, 1 = manual)"),
              p(strong("gear:"),	"Number of forward gears"),
              p(strong("carb:"),	"Number of carburetors"),
              
            ),
            
            # Categorical tab ............
            tabPanel(
              title=strong("Categorical"),
              h2("Categorical Panel"),
              
              selectInput(
                inputId = "cat_x_axis_id", 
                label = "X Axis", 
                choices = get_categorical_columns(mtcars)),
              
              textInput(
                inputId = "cat_color_id", 
                label = "Color", 
                placeholder = "color"),
              
              selectInput(
                inputId = "cat_chart_id", 
                label = "Chart",
                choices = c('bar', 'pie')
              )
            ),
            
              
            
            # Continuous tab ............
            tabPanel(
              title=strong("Continuous"),
            ),
            
            # relationship tab ............
            tabPanel(
              title=strong("Relative"),
            ),

          )
        ),
        
        

        # Main panel ...............
        mainPanel(
          # Tab set panel .........
          tabsetPanel(
            
            # Description tab .....
            tabPanel(
              title = strong("Dataset"),
              
              h2(strong("Mtcars Dataset")),
              
              # Show the data frame ...
              dataTableOutput(outputId = "data_id"),
              
            ),
            
            # Categorical tab ............
            tabPanel(
              title=strong("Categorical Graphs"),
              plotOutput(outputId = 'categorical_id')
            ),
            
            # Continuous tab ............
            tabPanel(
              title=strong("Continuous Graphs"),
              plotOutput(outputId = 'continuous_id')
            ),
            
            # relationship tab ............
            tabPanel(
              title=strong("Relative Graphs"),
              plotOutput(outputId = 'relative_id')
            ),
            
          )
        )
    )
))

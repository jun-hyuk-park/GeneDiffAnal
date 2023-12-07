#' Shiny app
#' 
#' @description Use shiny app to create interactive user interface.
#' 
#' @import shiny
#' @improt ggplot2
#' 
#' @export
#' 

# Define UI
ui <- shiny::fluidPage(
  # Title 
  shiny::titlePanel("Gene expression bar graph"),
  
  # Side bar. User can upload file, select variables, turn on or off 
  # normalizaiton
  shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::fileInput("file", "Choose a CSV file"),
        # Select variable
        shiny::selectInput("x_var", "Choose X variable:", ""),
        shiny::selectInput("y_var", "Choose Y variable:", ""),
        checkboxInput("normalize", "Use Counts Per Million normalization",
                      value = FALSE)
    ),
    
  # Main panel
  shiny::mainPanel(
    shiny::plotOutput("scatter_plot")
  )
  
)
)

server <- function(input, output, session) {
  # Read the uploaded dataset
  data <- reactive({
    shiny::req(input$file)
    read_data(input$file$datapath)
    
  })
  # Update choices for x and y variable based on the selected dataset
  observe({
    if (!is.null(data())) {
      shiny::updateSelectInput(session, "x_var", choices = rownames(data()))
      shiny::updateSelectInput(session, "y_var", choices = rownames(data()))
    }
    
  })
  
  output$scatter_plot <- renderPlot({
    shiny::req(input$x_var, input$y_var)
    if(input$normalize) { # If a user wants normalization
      coexpression_plot(cpm(data()), input$x_var, input$y_var)
    } else { # If a user does not want normalization
      coexpression_plot(data(), input$x_var, input$y_var)
    }
  })
}
# Run the Shiny app
runGeneDiffAnal <- function() {
    shiny::shinyApp(ui, server)
}


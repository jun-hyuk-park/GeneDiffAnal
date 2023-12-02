#' Shiny app
#' 
#' @description
#' 
#' @import shiny
#' @import plotly
#' @improt ggplot2
#' 
#' @export
#' 

# Define UI
ui <- shiny::fluidPage(
  # shinyjs::useShinyjs(),
  # Title 
  shiny::titlePanel("Gene expression bar graph"),
  
  # Side bar
  shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::fileInput("file", "Choose a CSV file"),
        # Select variable
        shiny::selectInput("x_var", "Choose X variable:", ""),
        shiny::selectInput("y_var", "Choose Y variable:", ""),
        # shiny::actionButton("showButton", "Submit")
    ),
  shiny::mainPanel(
    shiny::plotOutput("scatter_plot")
  )
  
)
)

server <- function(input, output, session) {
  # Read the uploaded dataset
  data <- reactive({
    req(input$file)
    read_data(input$file$datapath)
    
  })
  # Update choices for x and y variable based on the selected dataset
  observe({
    if (!is.null(data())) {
      updateSelectInput(session, "x_var", choices = rownames(data()))
      updateSelectInput(session, "y_var", choices = rownames(data()))
    }
    
  })

  shiny::observeEvent(input$showButton, {
    if (!is.null(input$x_var) && !is.null(input$y_var) && 
      input$x_var %in% rownames(data()) && input$y_var %in% rownames(data())) {
    # Create a scatter plot based on user inputs
    output$scatter_plot <- shiny::renderPlot({
      coexpression_plot(data(), input$x_var, input$y_var)
      })
    # shinyjs::enable("scatter_plot")
    }
   })
   # shinyjs::disable("scatter_plot")
}
# Run the Shiny app
runGeneDiffAnal <- function() {
    shiny::shinyApp(ui, server)
}


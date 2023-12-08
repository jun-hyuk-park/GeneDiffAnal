#' Launch Shiny App for GeneDiffAnal
#' 
#' A function that launches the Shiny app for GeneDiffAnal.
#' This app runs interactive user interface app for gene differential analysis.
#' 
#' 1. Heatmap
#' 
#' 2. Coexpression plot.
#' A user can visualization the expression of two genes in RNA level at
#' the same time. 
#' 
#' 
#' @references
#  Grolemund, G. (2015). Learn Shiny - Video Tutorials.
#' \href{https://shiny.rstudio.com/tutorial/}{Link}
#' @export
#'
#' @importFrom shiny titlePanel,sidebaryLayout,

# Define UI
ui <- shiny::fluidPage(
  # Title 
  shiny::titlePanel(shiny::div(style="text-align: center;",
                               "GeneDiffAnal interactive user interface")),
  
  # Choose input file. User can upload file.
  div(
    style = "text-align: center;",
    shiny::fileInput("file", "Choose a CSV file")),
  
  shiny::verticalLayout(
      shiny::mainPanel(
        style= "center-items: center;",
        div(style = "text-align: center;",
          "Gene expression heatmap"),
        shiny::plotOutput("heatmap_plot"))),
      

  ####################
  # Side bar layout2 #
  ####################
  # Coexpresion plot. User can select variables, turn on or off 
  # normalizaiton
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      # Select variable
      shiny::selectInput("x_var", "Choose X variable:", ""),
      shiny::selectInput("y_var", "Choose Y variable:", ""),
      # Normalization turn on or off
      shiny::checkboxInput("normalize", "Use Counts Per Million normalization",
                    value = FALSE)),
    
    # Main panel
    shiny::mainPanel(
      shiny::plotOutput("scatter_plot")
    )),
  
  ####################
  # Side bar layout3 #
  ####################
  # Gene boxplot. User can choose a gene to boxplot.
  #shiny::sidebarLayout(
  #  shiny::sidebarPanel(
  #    # Select variable
  #    shiny::selectInput("gene", "Select gene", ""),
  #    
  #  )
  # )
  
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
  
  output$heatmap_plot <- shiny::renderPlot({
    shiny::req(data())
    heatmap_expression(data())
  })
  
  output$scatter_plot <- shiny::renderPlot({
    shiny::req(input$x_var, input$y_var)
    if(input$normalize) { # If a user wants normalization
      coexpression_plot(cpm(data()), input$x_var, input$y_var)
    } else { # If a user does not want normalization
      coexpression_plot(data(), input$x_var, input$y_var)
    }
  })
}
# Run the Shiny app
shiny::shinyApp(ui, server)


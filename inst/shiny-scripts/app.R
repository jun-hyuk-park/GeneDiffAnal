#' Launch Shiny App for GeneDiffAnal
#' 
#' A function that launches the Shiny app for GeneDiffAnal.
#' This app runs interactive user interface app for gene differential analysis.
#' 
#' 1. Heatmap
#' 
#' A graphical output of RNA reads counts data visualized by colors. It also 
#' clusters samples and genes into similar expressions.
#' 
#' 2. Coexpression plot.
#' Visualization the expression of two genes in RNA reads at
#' the same time on x-axis and y-axis. 
#' 
#' 3. Boxplot
#' Create a boxplot of RNA reads of a gene of two different groups.
#' 
#' 4. Column bar plot
#' 
#' @references
#  Grolemund, G. (2015). Learn Shiny - Video Tutorials.
#' \href{https://shiny.rstudio.com/tutorial/}{Link}
#' @export
#'
#' @importFrom shiny titlePanel,sidebarLayout,verticalLayout,fileInput

# Define UI
ui <- shiny::fluidPage(
  # Title 
  shiny::titlePanel(shiny::div(style="text-align: center;",
                               "GeneDiffAnal interactive user interface")),
  
  # Choose input file. User can upload file.
  div(
    style = "text-align: center;",
    shiny::fileInput("file", "Choose a CSV file")),
  
  ###########
  # Heatmap #
  ###########
  shiny::verticalLayout(
      shiny::mainPanel(
        style= "center-items: center;",
        div(style = "text-align: center;",
          "Gene expression heatmap"),
        shiny::plotOutput("heatmap_plot"))),
      

  #######################################
  # Side bar layout2, coexpression plot #
  #######################################
  # User can select variables, turn on or off normalizaiton
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      # Select variable
      shiny::selectInput("x_var", "Choose X variable:", ""),
      shiny::selectInput("y_var", "Choose Y variable:", ""),
      # Normalization turn on or off
      shiny::checkboxInput("scatter_normalize", "Use Counts Per Million normalization",
                    value = FALSE)),
    
    # Main panel
    shiny::mainPanel(
      shiny::plotOutput("scatter_plot")
    )),
  
  ####################
  # Side bar layout3 #
  ####################
  # Gene boxplot. User can choose a gene to boxplot.
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      # Select gene
      shiny::selectInput("boxplot_gene", "Select gene", ""),
      # Normalization turn on or off
      shiny::checkboxInput("boxplot_normalize",
                           "Use Counts Per Million normalization",
                           value=FALSE)
    ),
    shiny::mainPanel(
      shiny::plotOutput("boxplot")
    )
   ),
  ####################
  # Vertical layout #
  ####################
  # Gene expression fold change column bar plot. See fold change of all genes.
  
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      shiny::checkboxInput("column_bar_normalize",
                           "Use counts Per Million normalization",
                           value=FALSE)
    ),
    shiny::mainPanel(
      div("Gene expression column_bar plot"),
      shiny::plotOutput("column_bar_plot")
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
      shiny::updateSelectInput(session, "boxplot_gene", 
                               choices=rownames(data()))
    }
    
  })
  
  output$heatmap_plot <- shiny::renderPlot({
    shiny::req(data())
    heatmap_expression(data())
  })
  
  output$scatter_plot <- shiny::renderPlot({
    shiny::req(input$x_var, input$y_var)
    if(input$scatter_normalize) { # If a user wants normalization
      coexpression_plot(cpm(data()), input$x_var, input$y_var)
    } else { # If a user does not want normalization
      coexpression_plot(data(), input$x_var, input$y_var)
    }
  })
  
  output$boxplot <- shiny::renderPlot({
    shiny::req(input$boxplot_gene)
    if(input$boxplot_normalize) {
      expression_boxplot(data(), input$boxplot_gene)
    } else {
      expression_boxplot(cpm(data()), input$boxplot_gene)
    }
  })
  
  output$column_bar_plot <- shiny::renderPlot({
    shiny::req(data())
    if(input$column_bar_normalize) {
      fold_change_column_plot(data())
    } else {
      fold_change_column_plot(cpm(data()))
    }
  })
}

# Run the Shiny app
shiny::shinyApp(ui, server)

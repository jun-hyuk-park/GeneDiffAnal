#' Shiny app
#' 
#' @description
#' 
#' @import shiny
#' @import plotly
#' @improt ggplot2
#' @export
#' 

# Define UI
ui <- shiny::fluidPage(
  shiny::titlePanel("Gene expression bar graph"),
  
  shiny::sidebarLayout(
    shiny::sidebarPanel("select_data", "Select Data")
  ),
  shiny::mainPanel(
    shiny::plotlyOutput("bar_plot")
  )
  
)

#server <- function(input, output, session) {
#  shiny::reactive({
#    selected_var <- input$select_data
#    plot_data <- ggplot2::ggplot(d)
#  })
#}
#}

#' Launch Shiny App for GeneDiffAnal
#' 
#' A function that launches the Shiny app for GeneDiffAnal.
#' This app runs interactive user interface app for gene differential analysis.
#' 
#' @return No return value but open up a Shiny page.
#' 
#' @examples
#' \dontrun {
#' GeneDiffAnal::runGeneDiffAnal()
#' }
#' 
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials.
#' \href{https://shiny.rstudio.com/tutorial/}{Link}
#' 
#' @export
#' @importFrom shiny runApp

runGeneDiffAnal <- function() {
  appDir <- system.file("shiny-scripts",
                        package="GeneDiffAnal")
  actionShiny <- shiny::runApp(appDir, display.mode = "normal")
  return(actionShiny)
}

# [END]
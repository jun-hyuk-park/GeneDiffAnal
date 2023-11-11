#' Heatmap of expression of data.
#' 
#' Create a heatmap of expression of genes of samples in RNA level.
#' 
#' @param data Data of RNA counts.
#'
#' @return A heatmap of gene expression.
#' 
heatmap_expression <- function(data) {
  return(stats::heatmap(data))
}

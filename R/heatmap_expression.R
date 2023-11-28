#' Heatmap of expression of data.
#' 
#' Create a heatmap of expression of genes of samples in RNA level.
#' 
#' @param data Data of RNA counts.
#'
#' @return A heatmap of gene expression.
#' 
#' @examples
#' dev.off()
#' cpm_d <- cpm(d)
#' heatmap_expression(cpm_d)
#' 
heatmap_expression <- function(data) {
  return(stats::heatmap(data))
}

#[END]
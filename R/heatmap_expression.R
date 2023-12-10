#' Heatmap of expression of data.
#' 
#' Create a heatmap of expression of genes of samples in RNA level.
#' 
#' @param data A RNA counts data matrix where columns are sample names and
#' row names are gene names. Each cell represents the RNA copy counts of that
#' column sample and row gene.
#'
#' @return A heatmap of gene expression.
#' 
#' @examples
#' dev.off()
#' cpm_rna_counts <- cpm(rna_counts)
#' heatmap_expression(rna_counts)
#' 
#' @export

heatmap_expression <- function(data) {
  return(stats::heatmap(data, ylab="Gene", xlab="Sample", margins=c(8, 8)))
}

#[END]
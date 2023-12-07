#' Get Fold Change of all genes in the data and sort the genes by fold change
#' levels.
#' 
#' A function that calculates fold change of the RNA counts of each gene in
#' the data and return the sorted list of gene by gene expression level.
#' 
#' @param data A RNA counts matrix.
#' 
#' @param decreasing Boolean that specifies if the fold is sorted in decreasing
#' order or not.
#' 
#' @return fold change.
#' 
#' @examples
#' fold_change_result <- fold_change_all(rna_counts)
#' fold_change_result[fold_change_result$Gene == "AAAS",]
#' # Gene     Fold
#  # AAAS -0.38032
#' 
#' @export


fold_change_all <- function(data, decreasing=TRUE) {
  result <- data.frame(Gene=c(NA), Fold=c(NA))
  for (gene in rownames(data)) {
    fold <- fold_change(data, gene)
    result <- rbind(result, c(gene, fold))
  }
  result <- na.omit(result)
  return(result[order(result$Fold, decreasing=decreasing),])
}

# [END]
#' Plot Column Bar Plot Of Fold Changes Of genes.
#' 
#' A function that plots fold changes of genes in RNA reads counts data in
#' column bar plot
#' 
#' @param data A data frame where first column is 'Gene', second column is
#' 'Fold'. The names of genes will be in the first column and their fold 
#' changes will be in second column.
#' 
#' @return column bar plot
#' 
#' @examples
#' dev.off()
#' fold_change_result <- fold_change_all(rna_counts)
#' fold_change_column_plot(fold_change_result)
#' 
#' @export



fold_change_column_plot <- function(fold_change_data) {
  ggplot2::ggplot(fold_change_data,
                  mapping=aes(x=Gene, y=Fold, level=fold_change_data$Gene)) +
  ggplot2::geom_col()
}

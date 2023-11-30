#' Plot Coexpression.
#' 
#' A function that plots gene expression of twe genes on same plot.
#' 
#' @param data A RNA counts matrix. Columns are sample names. Rows are gene
#' names.
#' 
#' @param gene1 First gene to plot.
#' 
#' @param gene2 Second gene to plot.
#' 
#' @examples
#' cpm_rna_counts <- cpm(rna_counts)
#' coexpression_plot(cpm_rna_counts, "A1BG", "A2M")
#' 
#' 
#' @return plot
#' @export
#' 
coexpression_plot <- function(data, gene1, gene2) {
  control_group <- get_group_data(data, "control")
  treatment_group <- get_group_data(data, "treatment")
  
  # Convert each matrix data into data frames.
  control_table <- data.frame(Group = rep("control", ncol(control_group)),
                              Gene1 = control_group[gene1,],
                              Gene2 = control_group[gene2,])
  treatment_table <- data.frame(Group = rep("treatment", ncol(control_group)),
                                Gene1 = treatment_group[gene1,],
                                Gene2 = treatment_group[gene2,])
  expression_table <- rbind(control_table, treatment_table)
  expression_plot <- ggplot2::ggplot(expression_table,
                                mapping=aes(x=Gene1, y=Gene2, color=Group)) +
    ggplot2::geom_point() + ggplot2::labs(title=paste0(gene1, " vs ", gene2),
                                          x=gene1, y=gene2)
  return(expression_plot)
}

#' Boxplot expression
#' 
#' A function that boxplots expression of each group of a gene.
#' 
#' @param data RNA counts data.
#' 
#' @param gene A name of gene.
#' 
#' @return plot

expression_boxplot <- function(data, gene) {
  if(gene %in% rownames(data)) {
  control_group <- get_group_data(data, "control")
  treatment_group <- get_group_data(data, "treatment")
  control_table <- data.frame(Group = rep("control", ncol(control_group)),
                              Counts = control_group[gene,])
  treatment_table <- data.frame(Group = rep("treatment", ncol(control_group)),
                                Counts = treatment_group[gene,])
  expression_table <- rbind(control_table, treatment_table)
  expression_plot <- ggplot2::ggplot(expression_table,
                                     mapping=ggplot2::aes(x=Group, y=Counts)) +
                     ggplot2::geom_boxplot() + ggplot2::labs(title=gene)
  return(expression_plot)
  } else {
    stop(paste0(gene, " is not found in data."))
  }
}

# [END]

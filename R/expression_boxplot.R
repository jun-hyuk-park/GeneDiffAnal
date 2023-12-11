#' Boxplot expression
#' 
#' A function that boxplots expression of each group of a gene.
#' 
#' @param data RNA counts data.
#' 
#' @param gene A name of gene.
#' 
#' @return plot
#' 
#' @examples
#' dev.off()
#' cpm_rna_counts <- cpm(rna_counts)
#' expression_boxplot(cpm_rna_counts, "A1BG")
#' 
#' 
#' @import ggplot2
#' 
#' @export

expression_boxplot <- function(data, gene) {
  if(gene %in% rownames(data)) {
  # Get the data of control group and treatment group.
  control_group <- get_group_data(data, "control")
  treatment_group <- get_group_data(data, "treatment")
  
  # Convert each matrix data into data frames.
  control_table <- data.frame(Group = rep("control", ncol(control_group)),
                              Counts = control_group[gene,])
  treatment_table <- data.frame(Group = rep("treatment", ncol(treatment_group)),
                                Counts = treatment_group[gene,])
  
  # Combine these two data frames.
  expression_table <- rbind(control_table, treatment_table)
  
  # Plot boxplot using ggplot2.
  expression_plot <- ggplot2::ggplot(expression_table,
                                     mapping=ggplot2::aes(x=Group, y=Counts)) +
                     ggplot2::geom_boxplot() + ggplot2::labs(title=gene)
  return(expression_plot)
  } else {
    stop(paste0(gene, " is not found in data."))
  }
}

# [END]

#' Get Fold Change between Control Group And Treatment Group
#' 
#' A function that calculates fold change of the RNA counts of gene between
#' control group and treatment group in log10.
#' 
#' @param data A RNA counts matrix.
#' 
#' @param gene A name of gene to be taken for fold change.
#' 
#' @return fold change.
#' 
#' @examples
#' 
#' cpm_d <- cpm(d)
#' fold_change(cpm_d, "AACS")
#' #1.459728
#' 
#' @export


fold_change <- function(data, gene) {
  if(gene %in% rownames(data)) {
    control_group <- get_group_data(data, "control")
    treatment_group <- get_group_data(data, "treatment")
    control_mean <- mean(control_group[gene,])
    treatment_mean <- mean(treatment_group[gene,])
    return(log10(treatment_mean/control_mean))
  } else {
    stop(paste0(gene, " is not found in data."))
  }
}

# [END]
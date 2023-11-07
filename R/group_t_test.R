#' Run Welch T Test On Control Group And Treatment Group
#'
#' A function that runs t.test on RNA expression level 
#'
#' @param gene A name of gene that we want to run t test on RNA expression of.
#' 
#' @param data A matrix data of RNA counts of control and treatment groups.
#' 
#' @return A list object of t.test result.
#'@references
#'B. L. WELCH. The generalization of student's problem when several
#'different population variances are involved. Biometrika. 1947. 34(1-2):28-35.

group_t_test <- function(gene, data) {
  control <- get_group_data(data, "control")[gene,]
  treatment <- get_group_data(data, "treatment")[gene,]
  return(stats::t.test(control, treatment))
}
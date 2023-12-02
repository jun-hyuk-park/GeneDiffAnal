#' Run Welch T Test On Control Group And Treatment Group
#'
#' A function that runs t.test on RNA expression level 
#' 
#' @param data A matrix data of RNA counts of control and treatment groups.
#'
#' @param gene A name of gene that we want to run t test on RNA expression of.
#' 
#' @param alternative A character string specifying the alternative hypothesis.
#' Modify the alternative hypothesis if the control group's expression is less,
#' the same or greater. 
#' 
#' @return A list object of t.test result.
#' 
#' @examples
#' 
#' cpm_rna_counts <- cpm(rna_counts)
#' t_result <- group_t_test(cpm_rna_counts, "A1BG")
#' t_result$estimate
#' # mean of x, mean of y
#' # 2105.722, 1881.544
#' # t_result$p.value
#' # 0.57375
#' 
#' @references
#'B. L. WELCH. The generalization of student's problem when several
#'different population variances are involved. Biometrika. 1947. 34(1-2):28-35.
#' @export

group_t_test <- function(data, gene, alternative="two.sided") {
  if (gene %in% rownames(data)) {
  control <- get_group_data(data, "control")[gene,]
  treatment <- get_group_data(data, "treatment")[gene,]
  return(stats::t.test(control, treatment))
  } else {
    stop(paste0(gene, " is not in data"))
  }
}

# [END]
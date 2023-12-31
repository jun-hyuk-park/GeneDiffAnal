#' Convert A Matrix Of Given RNA Counts To A Matrix Of Counts Per Million.
#' 
#' A function that calculates counts per million(cpm) of each gene for each
#' sample.
#' 
#' @param matrix a matrix of RNA counts
#' 
#' @return Returns a CPM matrix
#' 
#' @examples
#' cpm_rna_counts <- cpm(rna_counts)
#' 
#' rna_counts["A1BG", "Control1"]
#' # 1
#' cpm_rna_counts["A1BG", "Control1"]
#' # 2087.683
#'  
#' @references 
#' 
#' Koch CM, Chiu SF, Akbarpour M, Bharat A, Ridge KM, Bartom ET, Winter DR.
#' A Beginner's Guide to Analysis of RNA Sequencing Data.
#' Am J Respir Cell Mol Biol. 2018. 59(2):145-157.
#' doi: 10.1165/rcmb.2017-0430TR. PMID: 29624415; PMCID: PMC6096346.
#' 
#' @export
 

cpm <- function(matrix) {
  # New matrix
  new_matrix <- matrix[,]
  for (i in seq(along=colnames(matrix))) {
    # Counts transcripts of gene for each sample. For each gene, divide by
    # total transcripts. Then multiply by one million. 
    counts_sum <- sum(matrix[,i])
    new_matrix[, i] <- new_matrix[, i] / counts_sum * 10^6
  }
  return(new_matrix)
}

# [END]
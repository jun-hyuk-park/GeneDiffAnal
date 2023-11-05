#' Create A Matrix Of Given RNA Counts As Counts Per Million.
#' 
#' A functions that calculates counts per million(cpm) of each gene for each
#' sample.
#' 
#' @param matrix a matrix of RNA counts
#' 
#' @return Returns a CPM matrix
#' 
#' @examples
#' data(library="GeneDiffAnal")
#' cpm_d <- cpm(d)
#' 
#' d["A1BG", "Control1"]
#' # 1
#' cpm_d["A1BG", "Control1"]
#' # 2087.683
#'  
#' @references 
#' 
#' Koch CM, Chiu SF, Akbarpour M, Bharat A, Ridge KM, Bartom ET, Winter DR.
#' A Beginner's Guide to Analysis of RNA Sequencing Data.
#' Am J Respir Cell Mol Biol. 2018 Aug;59(2):145-157.
#' doi: 10.1165/rcmb.2017-0430TR. PMID: 29624415; PMCID: PMC6096346.
#' 
#' @export
cpm <- function(matrix) {
  # New matrix
  new_matrix <- matrix[,]
  for (i in 1:ncol(matrix)) {
    # Counts transcripts of gene for each sample. For each gene, divide by
    # total transcripts. Then multiply by one million. 
    counts_sum <- sum(matrix[,i])
    new_matrix[, i] <- new_matrix[, i] / counts_sum * 10^6
  }
  return(new_matrix)
}

# [END]
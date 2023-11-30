#' Convert RNA Counts Matrix To Data Frame.
#' 
#' A function that convert RNA counts matrix into a data frame.
#' 
#' @param matrix A RNA counts data matrix where columns are sample names and
#' row names are gene names. Each cell represents the RNA copy counts of that
#' column sample and row gene.
#' 
#' 
#' @examples
#' matrix_to_frame(rna_counts)
#' 
#' @import dplyr
#' @import stats
#' @export

matrix_to_frame <- function(matrix) {
  new_frame <- data.frame(Sample=c(NA), Gene=c(NA), Counts=c(NA))
  for (row in rownames(matrix)) {
    for (col in colnames(matrix)) {
      new_frame <- rbind(new_frame, c(col, row, matrix[row, col]))
    }
  }
  new_frame <- stats::na.omit(new_frame)
  new_frame <- dplyr::mutate(new_frame,
                             Group=dplyr::case_when(
                               grepl("control", Sample,
                                     ignore.case = TRUE) ~ "Control",
                               grepl("treatment", Sample,
                                     ignore.case = TRUE) ~ "Treatment"))
  return(new_frame)
}

# [END]
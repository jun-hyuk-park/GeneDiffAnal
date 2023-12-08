#' Reads RNA copy counts data
#'
#' A function that reads RNA copy counts data
#'
#' @param file_path path of RNA reads counts data. First column is Gene.
#' Rest of columns are samples
#' @param sep separator charactor in the file. ',' by as default.
#'
#' @return Returns a matrix
#'
#' @examples
#' test1 <- c("Gene,Control1,Treatment1", "A,1,2", "B,3,4")
#' tf <- tempfile()
#' writeLines(test1, tf)
#' RNA_data <- read_data(tf)
#'
#' @export
read_data <- function(file_path, sep=",") {
  RNA_l <- utils::read.csv(file_path, sep=sep, header=TRUE)
  RNA_data <- as.matrix(RNA_l[,2:ncol(RNA_l)])
  row.names(RNA_data) <- RNA_l$Gene
  return(RNA_data)
}

# [END]
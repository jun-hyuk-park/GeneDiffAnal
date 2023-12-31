% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_data.R
\name{read_data}
\alias{read_data}
\title{Reads RNA copy counts data}
\usage{
read_data(file_path, sep = ",")
}
\arguments{
\item{file_path}{path of RNA reads counts data. First column is Gene.
Rest of columns are samples}

\item{sep}{separator charactor in the file. ',' by as default.}
}
\value{
Returns a matrix
}
\description{
A function that reads RNA copy counts data
}
\examples{
test1 <- c("Gene,Control1,Treatment1", "A,1,2", "B,3,4")
tf <- tempfile()
writeLines(test1, tf)
RNA_data <- read_data(tf)

}

## ----fig.cap="vignettes_img1", fig.align="center"-----------------------------
knitr::include_graphics("vignettes_img1.png")

## -----------------------------------------------------------------------------
library(GeneDiffAnal)
knitr::kable(rna_counts, format = "html", caption = "rna_counts, Example of 
             RNA-seq count data included in this R package")

## -----------------------------------------------------------------------------
rna_file <- system.file("extdata/rna_counts.csv", package="GeneDiffAnal")
GeneDiffAnal::read_data(rna_file)


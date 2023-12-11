
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GeneDiffAnal

<!-- badges: start -->
<!-- badges: end -->

## Description

The purpose of this R package is to perform gene differential expression
analysis. RNA copy counts are the biological data being analyzed. This R
package adds gene differential expression analysis to a current work
flow in bioinformatics and computational biology. This R package
improves a current work flow in bioinformatics and computational biology
by better visualization of gene expression. R version 4.3.1 (2023-06-16
ucrt) and platform x86_64-w64-mingw32/x64 (64-bit) were used to develop
the package.

## Installation

To install the latest version of the package:

``` r
install.packages("devtools")
library("devtools")
devtools::install_github("jun-hyuk-park/GeneDiffAnal", build_vignettes = TRUE)
library("GeneDiffAnal")
```

To run the shinyApp:

``` r
runGeneDiffAnal()
```

A user can upload biological data to analyze with the app. A biological
should be in a specific data structure. It should be a table with sample
names including words treatment or control in columns and gene names as
rows. Each cell should represent RNA reads counts of that gene and
sample of the row and column.

For GeneDiffAnal Shiny app, test data is located at
`https://github.com/jun-hyuk-park/GeneDiffAnal/blob/main/inst/extdata/rna_counts.csv`.

Using shiny app, a use can plot heatmap, coexpression plot and RNA reads
boxplots between control and treatment group.

## Overview

``` r
ls("package:GeneDiffAnal")
data(package = "GeneDiffAnal") # optional
browseVignettes("GeneDiffAnal")
```

- coexpression_plot

Generate coexpression plot which has RNA reads counts of a gene in each
x axis and y axis so that a user can see RNA reads counts of two genes
at the same time.

- cpm

Convert A Matrix Of Given RNA Counts To A Matrix Of Counts Per Million.

- expression_boxplot

Boxplots expression of each group of a gene.

- fold_change_all.R

Get fold change of all genes in the RNA reads counts data.

- fold_change

Calculate fold change of gene expression between control group and
treatment group.

- get_group_data

Filters RNA data of control or treatment group.

- group_t_test

Run Welch t test on gene expression of control group and treatment
group.

- heatmap_expression

Create a heatmap of expression of genes of samples in RNA level.

- matrix_to_frame

Convert RNA reads counts matrix into data frame object.

- read_data

Read RNA reads counts data file and return RNA reads counts

- runGeneDiffAnal

Run shiny app of GeneDiffAnal package.

- rna_counts

An arbitrary RNA counts data matrix included in this R package as an
example.

<figure>
<img src="inst/extdata/GeneDiffAnal_overview.png" alt="Overview" />
<figcaption aria-hidden="true">Overview</figcaption>
</figure>

## Contributions

The name of the author of the package is Jun Hyuk Park. I wrote all
codes in this R package as contribution. Generative AI was not used.

The stats R package is used for statistical test.

## References

R Core Team (2023). *R: A Language and Environment for Statistical
Computing*. R Foundation for Statistical Computing, Vienna, Austria.
<https://www.R-project.org/>.

Wickham, H. and Bryan, J. (2019). R Packages (2nd edition). Newton,
Massachusetts: O’Reilly Media. <https://r-pkgs.org/>

Koch CM, Chiu SF, Akbarpour M, Bharat A, Ridge KM, Bartom ET, Winter DR.
A Beginner’s Guide to Analysis of RNA Sequencing Data. Am J Respir Cell
Mol Biol. 2018. 59(2):145-157. doi: 10.1165/rcmb.2017-0430TR. PMID:
29624415; PMCID: PMC6096346.

B. L. WELCH. The generalization of student’s problem when several
different population variances are involved. Biometrika. 1947.
34(1-2):28-35.

Chang W, Cheng J, Allaire J, Sievert C, Schloerke B, Xie Y, Allen J,
McPherson J, Dipert A, Borges B (2023). *shiny: Web Application
Framework for R*. R package version 1.8.0,
<https://CRAN.R-project.org/package=shiny>.

## Acknowledgement

This package was developed as part of an assessment for 2023 BCB410H:
Applied Bioinformatics course at the University of Toronto, Toronto,
CANADA. GeneDiffAnal welcomes issues, enhancement requests, and other
contributions. To submit an issue, use the GitHub issues.

## Package Structure

``` r
- GeneDiffAnal
  |- TestingPackage.Rproj
  |- DESCRIPTION
  |- NAMESPACE
  |- LICENSE
  |- README
  |- data
    |- rna_counts.rda
  |- inst
    |- extdata
      |- GeneDiffnAnal_overview.png
      |- rna_counts.csv
    |- shiny-scripts
      |- app.R
  |- man
    |- coexpression_plot.Rd
    |- cpm.Rd
    |- expression_boxplot.Rd
    |- fold_change_all.Rd
    |- fold_change.Rd
    |- get_group_data.Rd
    |- group_t_test.Rd
    |- heatmap_expression.Rd
    |- matrix_to_frame.Rd
    |- read_data.Rd
    |- rna_counts.Rd
    |- runGeneDiffAnal.Rd
  |- R
    |- runGeneDiffAnal.R
    |- read_data.R
    |- matrix_to_frame.R
    |- heatmap_expression.R
    |- group_t_test.R
    |- get_group_data.R
    |- fold_change.R
    |- fold_change_all.R
    |- expression_boxplot.R
    |- data.R
    |- cpm.R
    |- coxxpression_plot.R
  |- vignettes
    |- GeneDiffAnalVignettes.R
    |- GeneDiffAnalVignettes.Rmd
    |- vignettes_img1.png
  |- tests
    |- testthat.R
    |- testthat
      |- test-cpm.R
      |- test-fold_change_all.R
      |- test_fold_change.R
      |- test-group_t_test.R
      |- test-heatmap_expression.R
```

test_that("fold_change testing", {
  cpm_rna_counts <- cpm(rna_counts)
  expect_identical(round(fold_change(cpm_rna_counts, "A1BG"), 3), -0.049)
})
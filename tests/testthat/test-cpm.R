test_that("cpm testing", {
  new_rna <- cpm(rna_counts)
  expect_identical(trunc(new_rna["A1BG", "Control1"]), 2087)
})
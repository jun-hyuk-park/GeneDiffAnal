test_that("cpm testing", {
  new_rna <- cpm(d)
  expect_identical(trunc(new_rna["A1BG", "Control1"]), 2087)
})
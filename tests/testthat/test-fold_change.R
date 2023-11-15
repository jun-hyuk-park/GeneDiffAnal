test_that("fold_change testing", {
  cpm_d <- cpm(d)
  expect_identical(round(fold_change(cpm_d, "A1BG"), 3), -0.049)
})
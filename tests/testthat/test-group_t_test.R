test_that("group_t_test", {
  cpm_rna_counts<- cpm(rna_counts)
  t_result <- group_t_test(cpm_rna_counts, "A1BG")
  expect_equal(t_result$p.value, 0.5738, tolerance = 0.1)
  expect_equal(as.numeric(round(t_result$estimate["mean of x"])), 2106, tolerance=1)
  expect_equal(as.numeric(round(t_result$estimate["mean of y"])), 1882, tolerance=1)
})

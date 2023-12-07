test_that("test heatmap_expression", {
  h <- heatmap_expression(rna_counts)
  expect_type(h, "list")
  expect_equal(h$rowInd, c(14, 3, 7, 9, 8, 2, 5, 12 ,11 , 1, 10, 6, 4, 13))
  expect_equal(h$colInd, c(2, 5, 4, 1, 3, 8, 10, 9, 6, 7))
})

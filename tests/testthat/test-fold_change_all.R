test_that("multiplication works", {
  result <- fold_change_all(rna_counts)
  expect_equal(result$Gene, c("AACS", "A2M", "A1CF", "A1BG", "A2MP1",
                              "A2ML1-AS2", "A2ML1-AS1", "AA06", "A2M-AS1",
                              "A4GNT", "A2ML1", "AAAS", "A3GALT2", "A4GALT"))
})

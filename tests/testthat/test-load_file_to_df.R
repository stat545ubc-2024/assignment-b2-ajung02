test_that("load_file_to_df correctly loads a CSV file", {
  df <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.csv")
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), 6)
  expect_equal(ncol(df), 5)
})

test_that("load_file_to_df throws an error when file does not exist", {
  expect_error(load_file_to_df("path/to/nonexistent/file.csv"),
               "The file does not exist at the specified path.")
})

test_that("load_file_to_df throws an error for unsupported file type", {
  err <- tryCatch(
    load_file_to_df("~/Desktop/ubc/stat 545/data/sample.docx"),
    error = function(e) e
  )
  expect_true(inherits(err, "error"))
  expect_equal(conditionMessage(err), "Unsupported file type. Please provide a CSV, Excel (.xlsx or .xls), or TXT file.")
})

test_that("load_file_to_df correctly loads an Excel file", {
  df <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.xlsx")
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), 6)
  expect_equal(ncol(df), 5)
})

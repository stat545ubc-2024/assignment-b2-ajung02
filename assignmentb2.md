# Assignment B1 - Creating Functions

This function reads a file (CSV, Excel, or TXT) and loads it into a data
frame. The function automatically detects the file type based on the
file extension.

## Exercise 1

``` r
load_file_to_df <- function(file_path) {
  # Check that the file exists
  if (!file.exists(file_path)) {
    stop("The file does not exist at the specified path.")
  }
  
  # Get the file extension
  file_extension <- tools::file_ext(file_path)
  
  # Load the file based on the extension
  if (file_extension == "csv") {
    df <- read_csv(file_path)
  } else if (file_extension == "txt") {
    df <- read_tsv(file_path) # Assuming tab-separated for .txt
  } else if (file_extension %in% c("xlsx", "xls")) {
    df <- read_excel(file_path)
  } else {
    stop("Unsupported file type. Please provide a CSV, Excel (.xlsx or .xls), or TXT file.")
  }
  
  return(df)
}
```

## Exercise 2

``` r
#' Load a File into a Data Frame
#'
#'
#' @param file_path A string representing the path to the file. The file extension should be `.csv`, `.xlsx`, `.xls`, or `.txt`.
#'
#' @return A data frame containing the contents of the file.
#'
#' @examples
#' # Load a CSV file
#' df_csv <- load_file_to_df("Desktop/ubc/stat 545/data/sample.csv")
#'
#' # Load an Excel file
#' df_excel <- load_file_to_df("Desktop/ubc/stat 545/data/sample.xlsx")
#'
#' # Load a TXT file
#' df_txt <- load_file_to_df("Desktop/ubc/stat 545/data/sample.txt")
#'
#' @export
```

## Exercise 3

To demonstrate the usage of the load_file_to_df() function, I’ll show
how to load different types of files such as CSV, Excel, and TXT files.
I will also show an example where an error is deliberately triggered by
attempting to load an unsupported file type.

#### Example 1: Loading a CSV File

``` r
# Example 1: Load a CSV file
# Assuming the file "sample.csv" exists in the "data" folder
df_csv <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.csv")
```

    ## Rows: 6 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (2): Name, Gender
    ## dbl (3): Age, Smoker, Lung Cancer
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
print(df_csv)
```

    ## # A tibble: 6 × 5
    ##   Name       Age Gender Smoker `Lung Cancer`
    ##   <chr>    <dbl> <chr>   <dbl>         <dbl>
    ## 1 Alex        30 F           1             1
    ## 2 Bob         25 M           1             0
    ## 3 Carol       32 F           0             0
    ## 4 Dennis      20 M           1             1
    ## 5 Iain        22 M           0             0
    ## 6 Samantha    37 F           0             1

In this example, we load a CSV file using the load_file_to_df()
function. The output will be a data frame printed to the console.

#### Example 2: Loading an Excel File

``` r
# Example 2: Load an Excel file
# Assuming the file "sample.xlsx" exists in the "data" folder
df_excel <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.xlsx")
print(df_excel)
```

    ## # A tibble: 6 × 5
    ##   Name       Age Gender Smoker `Lung Cancer`
    ##   <chr>    <dbl> <chr>   <dbl>         <dbl>
    ## 1 Alex        30 F           1             1
    ## 2 Bob         25 M           1             0
    ## 3 Carol       32 F           0             0
    ## 4 Dennis      20 M           1             1
    ## 5 Iain        22 M           0             0
    ## 6 Samantha    37 F           0             1

This example demonstrates how to load an Excel file. The function
automatically detects the .xlsx extension and uses read_excel() to load
the data into a data frame.

#### Example 3: Loading a TXT File

``` r
# Example 3: Load a TXT file
# Assuming the file "sample.txt" exists in the "data" folder
df_txt <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.txt")
```

    ## Rows: 6 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (2): Name, Gender
    ## dbl (3): Age, Smoker, Lung Cancer
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
print(df_txt)
```

    ## # A tibble: 6 × 5
    ##   Name       Age Gender Smoker `Lung Cancer`
    ##   <chr>    <dbl> <chr>   <dbl>         <dbl>
    ## 1 Alex        30 F           1             1
    ## 2 Bob         25 M           1             0
    ## 3 Carol       32 F           0             0
    ## 4 Dennis      20 M           1             1
    ## 5 Iain        22 M           0             0
    ## 6 Samantha    37 f           0             1

Here, we load a .txt file, assuming it is tab-separated. The function
uses read_tsv() to read the contents of the text file into a data frame.

#### Example 4: Handling an Unsupported File Type (Intentional Error)

``` r
# Example 4: Trigger an error with unsupported file type
# Deliberately loading an unsupported file type (e.g., PDF)

load_file_to_df("~/Desktop/ubc/stat 545/data/sample.pdf")  # This will trigger an error
```

    ## Error in load_file_to_df("~/Desktop/ubc/stat 545/data/sample.pdf"): Unsupported file type. Please provide a CSV, Excel (.xlsx or .xls), or TXT file.

This example deliberately triggers an error because .pdf is not a
supported file type. The error message will inform the user that only
.csv, .txt, and Excel files are supported.

#### Example 5: Handling a Non-Existent File (Error)

``` r
# Example 5: Trigger an error for a non-existent file
# Attempt to load a file that does not exist

load_file_to_df("~/Desktop/ubc/stat 545/data/non_existent_file.csv")  # This will trigger an error
```

    ## Error in load_file_to_df("~/Desktop/ubc/stat 545/data/non_existent_file.csv"): The file does not exist at the specified path.

In this example, we attempt to load a file that does not exist. The
function will return an error stating that the file does not exist at
the specified path.

#### Conclusion

These examples cover typical use cases of the load_file_to_df()
function: 1. Loading CSV, Excel, and TXT files into data frames. 2.
Handling errors when an unsupported file type is passed or when the file
does not exist. These examples demonstrate how the function can be used
in various scenarios and how it handles errors appropriately.

## Exercise 4

To formally test the load_file_to_df() function, we will use the
testthat package and write tests that cover various scenarios. These
tests will verify the function’s behavior with different file types and
edge cases, such as handling non-existent files and unsupported file
types.

#### Test Cases for the load_file_to_df() Function:

1.  Test with a CSV file (standard case).
2.  Test with an Excel file (standard case).
3.  Test with a non-existent file (error handling).
4.  Test with an unsupported file type (error handling).
5.  Test with a TXT file (handling a tab-separated file).

### Setting up Tests with testthat

#### Test 1: Loading a CSV file

This test checks that the function reads a CSV file correctly, returns a
data frame, and that the resulting data frame has some expected column
names.

``` r
test_that("load_file_to_df reads a CSV file correctly", {
  df_csv <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.csv")
  
  # Check that it returns a data frame (or tibble)
  expect_s3_class(df_csv, "data.frame") 
  
  # Check that it has some expected columns
  # Replace "Age" and "Lung Cancer" with actual column names from your CSV file
  expect_true(all(c("Age", "Lung Cancer") %in% colnames(df_csv)))
})
```

    ## Test passed 😀

#### Test 2: Loading an Excel file

Similar to the CSV test, this checks that the function correctly reads
an Excel file, returns a data frame, and verifies expected column names.

``` r
test_that("load_file_to_df reads an Excel file correctly", {
  df_excel <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.xlsx")
  
  # Check that it returns a data frame
  expect_s3_class(df_excel, "data.frame")
  
  # Check that it contains some expected data
  expect_true("Age" %in% colnames(df_excel))
})
```

    ## Test passed 🌈

#### Test 3: Handling a non-existent file (error case)

This test ensures that the function throws an appropriate error message
when the file does not exist.

``` r
test_that("load_file_to_df throws error for non-existent file", {
  # Check that it throws an error when the file does not exist
  expect_error(load_file_to_df("~/Desktop/ubc/stat 545/data/non_existent_file.csv"), "The file does not exist")
})
```

    ## Test passed 🎉

#### Test 4: Handling unsupported file types (error case)

This checks that the function correctly handles an unsupported file type
and throws an error with the appropriate message.

``` r
test_that("load_file_to_df throws error for unsupported file type", {
  # Check that it throws an error for unsupported file types
  expect_error(load_file_to_df("~/Desktop/ubc/stat 545/data/sample.pdf"), "Unsupported file type")
})
```

    ## Test passed 😀

#### Test 5: Loading a TXT file

This verifies that the function reads a tab-separated TXT file, returns
a data frame, and checks for known column names.

``` r
test_that("load_file_to_df reads a TXT file correctly", {
  df_txt <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.txt")
  
  # Check that it returns a data frame
  expect_s3_class(df_txt, "data.frame")
  
  # Check for expected column names (assuming known structure)
  expect_true("Smoker" %in% colnames(df_txt))
})
```

    ## Test passed 🥇

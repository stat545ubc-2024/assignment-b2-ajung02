# Assignement B2 - Creating Packages

I will be using the function that I created in Assignment B1.

``` r
# Loading necessary libraries
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null
    ## 
    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition
    ## 
    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

``` r
library(readr)  # for reading CSV and TXT files
library(readxl) # for reading Excel files
```

## Exercise 1

``` r
#' Load a file into a data frame
#'
#' This function reads a CSV, Excel, or TXT file and loads it into a data frame.
#' The function automatically detects the file type based on the file extension.
#'
#' @param file_path A string representing the file path to load. The function supports .csv, .xlsx, and .txt files.
#' @return A data frame containing the contents of the file.
#' @examples
#' \dontrun{
#'   # Load a CSV file
#'   df <- load_file_to_df("Desktop/ubc/stat 545/data/sample.csv")
#' 
#'   # Load an Excel file
#'   df <- load_file_to_df("Desktop/ubc/stat 545/data/sample.xlsx")
#' 
#'   # Load a TXT file
#'   df <- load_file_to_df("Desktop/ubc/stat 545/data/sample.txt")
#' }
#' @export

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


<!-- README.md is generated from README.Rmd. Please edit that file -->

# Assignment B2 - Allison Jung

<!-- badges: start -->
<!-- badges: end -->

**assignmentb2** is an R package which contains the function
**load_file_to_df**. This function is designed to help you load CSV,
Excel, and TXT files into data frames, automatically detecting the file
type based on the file extension.

## Installation

You can install the development version of assignmentb2 from
[GitHub](https://github.com/) with:

To install the package from GitHub, run the following command:

``` r
devtools::install_github("ajung02/assignment-b2-ajung02", ref = "0.1.0")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(assignmentb2)

# Load a CSV file
df_csv <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.csv")
#> Rows: 6 Columns: 5
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (2): Name, Gender
#> dbl (3): Age, Smoker, Lung Cancer
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

# Load an Excel file
df_excel <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.xlsx")

# Load a TXT file
df_txt <- load_file_to_df("~/Desktop/ubc/stat 545/data/sample.txt")
#> Rows: 6 Columns: 5
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: "\t"
#> chr (2): Name, Gender
#> dbl (3): Age, Smoker, Lung Cancer
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

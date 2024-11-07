[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/jH1Ixftw)

---
title: "assignmentb2ajung02"
output: rmarkdown::github_document
---

# Assignment B2 - Allison Jung

**load_file_to_df** is an R package designed to help you load CSV, Excel, and TXT files into data frames, automatically detecting the file type based on the file extension.

## Examples of Usage

```r
# Load the necessary function
library(assignmentb2ajung02)

# Load a CSV file
df_csv <- load_file_to_df("path/to/your/file.csv")

# Load an Excel file
df_excel <- load_file_to_df("path/to/your/file.xlsx")

# Load a TXT file
df_txt <- load_file_to_df("path/to/your/file.txt")
```

## Installation

To install the package from GitHub, run the following command:

```r
devtools::install_github("ajung02/assignmentb2ajung02", ref = "0.1.0")
```

## Documentation

You can access the documentation for each function:

?load_file_to_df

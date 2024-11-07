#' Load a file into a data frame
#'
#' This function reads a CSV, Excel, or TXT file and loads it into a data frame.
#' The function automatically detects the file type based on the file extension.
#'
#' @param file_path A string representing the file path to load.
#' @return A data frame containing the contents of the file.
#' @examples
#' # Load a CSV file
#' df <- load_file_to_df("data/sample.csv")
#'
#' # Load an Excel file
#' df <- load_file_to_df("data/sample.xlsx")
#'
#' # Load a TXT file
#' df <- load_file_to_df("data/sample.txt")
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
    df <- readr::read_csv(file_path)
  } else if (file_extension == "txt") {
    df <- readr::read_tsv(file_path) # Assuming tab-separated for .txt
  } else if (file_extension %in% c("xlsx", "xls")) {
    df <- readxl::read_excel(file_path)
  } else {
    stop("Unsupported file type. Please provide a CSV, Excel (.xlsx or .xls), or TXT file.")
  }

  # Return the data frame
  return(df)
}


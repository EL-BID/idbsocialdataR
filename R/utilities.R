
#' Internal function to get the urls of the API
#'
#' List with 2 entries. The first one with the base_url and the second one with the utils_url#' 
#' 
#' @return List with 2 entries. The first one with the base_url and the second one with the utils_url#' 
iadburls <- function() {
  
  base_url <- "https://scl.datamig.org/data?" 
  utils_url <- "&format=csv"
  
  url_list <- list(base_url = base_url, utils_url = utils_url)
  
  url_list
}

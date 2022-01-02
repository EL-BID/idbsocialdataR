
#' Internal function to get the urls of the API
#'
#' List with 2 entries. The first one with the base_url and the second one with the utils_url#'
#'
#' @return List with 2 entries. The first one with the base_url and the second one with the utils_url#'
iadburls <- function() {

  base_url <- "https://scl.datamig.org/"

  matedata_url <-str_c(base_url,"metadata/")
  geojson_url <-str_c(base_url,"geojson/?")

  utils_url <- "&format=csv"

  url_list <- list(base_url = base_url,
                   utils_url = utils_url,
                   matedata_url = matedata_url,
                   geojson_url=geojson_url)

  return(url_list)
}

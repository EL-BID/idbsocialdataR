#' Get available data about selected indicator.
#' @param indicator Selected indicator
#' @param categories Optional categories (sex, age, area)
#' @param countries Optional. countries (alpha-3 country code)
#' @param year Optional.
#' @return A data frame with selected indicators
#' @import dplyr
#' @import stringr
#' @import readr
#' @importFrom tidyr gather
#' @export
#' @examples
#' query_indicator(indicator="pobreza,pindi_ci")
#' query_indicator(indicator="pobreza",categories='sex,age')
#' query_indicator(indicator="pobreza",categories='sex',countries='mex,arg')

query_indicator <- function(indicator,categories='All', countries='All', yearstart='All', yearend='All', year='All'){
  #argument "indicator" is missing, with no default
  if(is.na(indicator))   stop('argument "indicator" is missing, with no default')

  urls <- iadburls()
  url <- str_c(urls$base_url,"data?indicators=",indicator)

  if(countries!='All')   url <- str_c(url,"&countries=",countries)
  if(categories!='All')   url <- str_c(url,"&categories=",categories)
  if(yearstart!='All')   url <- str_c(url,"&yearstart=",toString(yearstart))
  if(yearend!='All')   url <- str_c(url,"&yearend=",toString(yearend))
  if(year!='All')   url <- str_c(url,"&year=",toString(year))

  url <- str_c(url,urls$utils_url)
  data <- read_csv(url)

}


#' Get dictionary
#' @param indicator Selected indicator
#' @param collection Optional categories ()
#' @param resource Optional.
#' @param theme_en Optional.
#' @param theme_es Optional.
#' @return A data frame with dictionary
#' @import dplyr
#' @import stringr
#' @import readr
#' @import jsonlite
#' @importFrom tidyr gather
#' @export
#' @examples
#' query_dictionary()
#' query_dictionary(indicator="pobreza")
#' query_dictionary(collection="Household Socio-Economic Surveys")

query_dictionary <- function(indicator='All',collection='All',resource='All'){

  urls <- iadburls()
  url <- urls$matedata_url
  url <- str_c(url, 'dictionary?')

  if(indicator!='All')   url <- str_c(url,"&indicator=",indicator)
  if(collection!='All')   url <- str_c(url,"&collection=",collection)
  if(resource!='All')   url <- str_c(url,"&resource=",resource)
  # ToDo(rsanchezavalos): Add theme
  # if(theme_en!='All')   url <- str_c(url,"&theme_en=",theme_en)
  # if(theme_es!='All')   url <- str_c(url,"&theme_es=",theme_es)

  dictionary <- jsonlite::fromJSON(url) %>%
    as_tibble()
}

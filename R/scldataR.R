#' Search for indicator using words and filters.
#' @param search search
#' @param countries Optional. countries (alpha-3 country code)
#' @param yearstart Optional. yearstart
#' @param yearend Optional. yearend
#' @return A data frame with found results
#' @import dplyr
#' @import stringr
#' @import readr
#' @importFrom tidyr gather
#' @export
#' @examples
#' search_indicator(search="pobreza")

search_indicator <- function(search,categories='All',countries='All',
                             yearstart='All',yearend='All',year='All'){

  #argument "search" is missing, with no default
  if(is.na(search))   stop('argument "search" is missing, with no default')

  urls <- iadburls()
  url <- str_c(urls$base_url,"data/search?words=",search)

  if(countries!='All')   url <- str_c(url,"&countries=",countries)
  if(yearstart!='All')   url <- str_c(url,"&yearstart=",toString(yearstart))
  if(yearend!='All')   url <- str_c(url,"&yearend=",toString(yearend))

  url <- str_c(url,urls$utils_url)
  data <- read_csv(url)
  return(data)
}

#' Get available data about selected indicator.
#' @param indicator Selected indicator
#' @param categories Optional categories (sex, age, area)
#' @param countries Optional. countries (alpha-3 country code)
#' @param year Optional.
#' @param latest Optional. latest data point available
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

query_indicator <- function(indicator,categories='All', countries='All',
                            yearstart='All', yearend='All', year='All',
                            latest=FALSE){
  #argument "indicator" is missing, with no default
  if(is.na(indicator))   stop('argument "indicator" is missing, with no default')

  urls <- iadburls()
  url <- str_c(urls$base_url,"data?indicators=",indicator)

  if(countries!='All')   url <- str_c(url,"&countries=",countries)
  if(categories!='All')   url <- str_c(url,"&categories=",categories)
  if(yearstart!='All')   url <- str_c(url,"&yearstart=",toString(yearstart))
  if(yearend!='All')   url <- str_c(url,"&yearend=",toString(yearend))
  if(year!='All')   url <- str_c(url,"&year=",toString(year))
  if(latest!=FALSE)   url <- str_c(url,"&latest")

  url <- str_c(url,urls$utils_url)
  data <- read_csv(url)

  return(data)
}



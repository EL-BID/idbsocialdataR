#' Get available data about selected indicator.
#' @param indicator Selected indicator 
#' @param categories Optional categories (sex, age, area)
#' @param countries Optional. countries (alpha-3 country code)
#' @return A data frame with selected indicators 
#' @import dplyr
#' @import stringr
#' @import readr
#' @importFrom tidyr gather
#' @export
#' @examples
#' query_indicator(indicator="pobreza,pindi_ci")
#' 
#' query_indicator(indicator="pobreza",categories='sex,age')
#' 
#' query_indicator(indicator="pobreza",categories='sex',countries='mex,arg')

query_indicator <- function(indicator,categories='All', countries='All', yearstart='All', yearend='All'){
  #argument "indicator" is missing, with no default 
  if(is.na(indicator))   stop('argument "indicator" is missing, with no default')
  
  urls <- iadburls()
  
  baseurl <- str_c(urls$base_url,"indicators=",indicator)
  
  if(countries!='All')   baseurl <- str_c(baseurl,"&countries=",countries)
  if(categories!='All')   baseurl <- str_c(baseurl,"&categories=",categories)
  if(yearstart!='All')   baseurl <- str_c(baseurl,"&yearstart=",yearstart)
  if(yearend!='All')   baseurl <- str_c(baseurl,"&yearend=",yearend)
  
  baseurl <- str_c(baseurl,urls$utils_url)
  data <- read_csv(baseurl)

}

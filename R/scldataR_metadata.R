#' Get countries
#' @return A data frame with countries
#' @import dplyr
#' @import stringr
#' @import readr
#' @import jsonlite
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_countries()

get_countries <- function(){

  urls <- iadburls()
  url <- urls$matedata_url
  url <- str_c(url, 'countries')

  countries <- jsonlite::fromJSON(url) %>%
    as_tibble()
}


#' Get sources
#' @return A data frame with countries
#' @import dplyr
#' @import stringr
#' @import readr
#' @import jsonlite
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_sources()

get_sources <- function(){

  urls <- iadburls()
  url <- urls$matedata_url
  url <- str_c(url, 'sources')

  sources <- jsonlite::fromJSON(url) %>%
    as_tibble()
}


#' Get themes
#' @return A data frame with countries
#' @import dplyr
#' @import stringr
#' @import readr
#' @import jsonlite
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_themes()

get_themes <- function(){

  urls <- iadburls()
  url <- urls$matedata_url
  url <- str_c(url, 'themes')

  themes <- jsonlite::fromJSON(url) %>%
    as_tibble()
}



#' Query dictionary
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


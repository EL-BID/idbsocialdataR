#' Get geojson map.
#' @param level Optional.  (1, 2)
#' @param isoalpha3 Optional. countries (alpha-3 country code)
#' @return A data frame with selected indicators
#' @import dplyr
#' @import stringr
#' @import readr
#' @import sf
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_map(level='1',isoalpha3="ARG")

get_map <- function(level='All', isoalpha3='All'){
  #argument "indicator" is missing, with no default
  urls <- iadburls()
  url <- urls$geojson_url

  if(level!='1')   url <- str_c(url,"&level=",level)
  if(isoalpha3!='All')   url <- str_c(url,"&isoalpha3=",isoalpha3)

  map <- read_sf(url)
}



#' Choropleth map.
#' @param year ISO 8601 string
#' @param level Optional.  (1, 2)
#' @param isoalpha3 Optional. countries (alpha-3 country code)
#' @return A data frame with selected indicators
#' @import dplyr
#' @import stringr
#' @import readr
#' @import sf
#' @import ggplot2
#' @importFrom scales pretty_breaks
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_map(level='1',isoalpha3="ARG")
idbsocial_choropleth <- function(indicator, year, level='All', isoalpha3='All'){

  map <- get_map(level=level, isoalpha3=isoalpha3)
  data <- query_indicator(indicator,countries=isoalpha3,year=toString(year))

  output <- map %>% left_join(data,by ='isoalpha3')

  map <- get_map(level=level, isoalpha3=isoalpha3)
  data <- query_indicator(indicator,countries=isoalpha3,year=toString(year))

  output <- map %>% left_join(data,by ='isoalpha3')

  yy <- ggplot(data = output, aes(fill = value)) +
    geom_sf(size = 0.25) +
    scale_fill_distiller(name=indicator, palette = "Blues", breaks = pretty_breaks(), direction=1)+
    labs(title = unique(output$label_es[!is.na(output$label_es)]),
         caption = unique(output$label_es[!is.na(output$description_es)])) +
    theme(axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          panel.background = element_rect(fill = "white", color = NA))

  return(yy)
}





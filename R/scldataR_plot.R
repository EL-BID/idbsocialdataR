#' Choropleth map.
#' @param year ISO 8601 string
#' @param level Optional.  (1, 2)
#' @param isoalpha3 Optional. countries (alpha-3 country code)
#' @return A data frame with selected indicators
#' @import dplyr
#' @import stringr
#' @import readr
#' @import sf
#' @importFrom tidyr gather ggplot2
#' @export
#' @examples
#' get_map(level='1',isoalpha3="ARG")
scldata_line <- function(indicator,categories='All', countries='All', yearstart='All', yearend='All', year='All'){

  output <- query_indicator(indicator,categories=categories, countries=countries, yearstart=yearstart, yearend=yearend, year=year)

  yy <- output %>% ggplot(aes(x=year, y=value,
                              color=country_name_es)) +
    geom_line(size = .5) +
    labs(title = output$label_es) + theme_minimal()

  return(yy)
}

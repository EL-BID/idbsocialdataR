#' Choropleth map.
#' @param year ISO 8601 string
#' @param level Optional.  (1, 2)
#' @param isoalpha3 Optional. countries (alpha-3 country code)
#' @return A data frame with selected indicators
#' @import dplyr
#' @import stringr
#' @import readr
#' @import ggplot2
#' @import rlang
#' @importFrom tidyr gather
#' @export
#' @examples
#' get_map(level='1',isoalpha3="ARG")
idbsocial_plot <- function(indicator,type='line',categories='All', countries='All', yearstart='All', yearend='All', year='All'){
  category_var <- sym(categories)
  #category_var <- enquo(categories)
  output <- query_indicator(indicator,categories=categories, countries=countries, yearstart=yearstart, yearend=yearend, year=year)
  if (type=='line'){
    if (categories=='All'){
      yy <- output %>% ggplot(aes(x=year, y=value,
                                  color=country_name_es)) +
        geom_line(size = .5) +
        labs(title = output$label_es) + theme_minimal()
    } else {
      if (length(str_split(categories,',')[[1]])>1){ stop("Choose only one category")}
      yy <- output %>% ggplot(aes(x=year, y=value,
                                  color=!!category_var)) +
        geom_line(size = .5) +
        facet_wrap(~ country_name_es, scales = "free_y") +
        labs(title = output$label_es) + theme_minimal()
    }
  } else if (type=='bar'){
    if (categories=='All'){
      yy <- output %>% ggplot(aes(x=year, y=value,
                                  fill=country_name_es)) +
        geom_bar(stat='identity') +
        facet_wrap(~country_name_es) +
        labs(title = output$label_es) + theme_minimal()
    } else {
      if (length(str_split(categories,',')[[1]])>1){ stop("Choose only one category")}
      yy <- output %>% ggplot(aes(x=year, y=value,
                                  fill=!!category_var)) +
        geom_bar(stat='identity') +
        facet_wrap(~ country_name_es, scales = "free_y") +
        labs(title = output$label_es) + theme_minimal()
    }

  }

  return(yy)
}

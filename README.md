
# SCLDataR


## Installation

You can install the development version of scldataR like so:

``` r
install.packages('devtools')
library(devtools)
devtools::install_github("BID-DATA/scldataR") 
```

## Example

This is a basic example

``` r

data <- scldataR:::query_indicator(indicator = 'pobreza',
                                   countries = 'COL,ECU,BRA,URY',
                                   categories = 'area')
```

# Plot
``` r
library(ggplot2)
data %>% ggplot(aes(x=year, y=value,
                  color=country_name_es)) +  
  geom_line(size = .5) + 
  facet_wrap(~area, scales = "free_y")+
  labs(title = data$label_es) + theme_minimal()
```

![e_g](inst/img/plot_eg.png)


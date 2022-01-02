
# SCLDataR


## Installation

For the moment this package is only available from github.
To install the development version:


``` r
if (!require(devtools)) {
    install.packages("devtools")
}
devtools::install_github("BID-DATA/scldataR") 
```

## Quick Example


``` r

data <- scldataR:::query_indicator(indicator = 'pobreza',
                                   countries = 'COL,ECU,BRA,URY',
                                   categories = 'area')
```



# Plot Examples
``` r
scldata_line('pobreza', yearstart = 2000, yearend = 2020 )
```

![e_g](inst/img/plot_line.png)


# Plot Map
``` r
scldata_choropleth('pobreza', year = 2020)

```

![e_g](inst/img/plot_map.png)



# Get Dictionary
```r
> scldataR:::query_dictionary() %>% 
+     select(collection, indicator, label_es)

# A tibble: 223 x 3
   collection              indicator    label_es                             
   <chr>                   <chr>        <chr>                                
 1 Household Socio-Econom… jefa_ch      % de hogares con jefatura femenina   
 2 Household Socio-Econom… jefaecon_ch  % de hogares con jefatura económica …
 3 Household Socio-Econom… union_ci     % de población en unión formal o inf…
 4 Household Socio-Econom… miembro6_ch  % de hogares con al menos un miembro…
```


# SCLDataR



## Installation
For the moment this package is only available from github.
To install the development version:

``` r
install.packages("sf")
install.packages("devtools")
devtools::install_github("BID-DATA/idbsocialdataR", force = TRUE) 

<<<<<<< HEAD
devtools::install_github("BID-DATA/idbsocialdataR") 

=======
library(idbsocialdataR)
>>>>>>> f9d9c20f5244a64ee816ac5c8383f7cecdb03aad
```

Quick Example
=======

``` r

data <- idbsocialdataR:::query_indicator(indicator = 'pobreza',
                                   countries = 'COL,ECU,BRA,URY',
                                   categories = 'area')
```

# Metadata
## Get Dictionary

```r
> idbsocialdataR:::query_dictionary() %>% 
+     select(collection, indicator, label_es)

# A tibble: 223 x 3
   collection              indicator    label_es                             
   <chr>                   <chr>        <chr>                                
 1 Household Socio-Econom… jefa_ch      % de hogares con jefatura femenina   
 2 Household Socio-Econom… jefaecon_ch  % de hogares con jefatura económica …
 3 Household Socio-Econom… union_ci     % de población en unión formal o inf…
 4 Household Socio-Econom… miembro6_ch  % de hogares con al menos un miembro…
```


## Get BaseMaps

```r
idbsocialdataR:::get_map(level = '1', isoalpha3 = 'COL') %>% 
  ggplot(aes(fill = isoalpha3)) +
  geom_sf(size = 0.25)
```

<img src="inst/img/query_map.png" width=45% >




### Plot Examples

``` r
idbsocial_plot('pobreza',type='line', countries='All' ,yearstart = 2000, yearend = 2020, categories='All')

```

![e_g](inst/img/plot_line.png)

``` r
idbsocial_plot('pobreza',type='bar', countries='MEX,ARG' ,yearstart = 2000, yearend = 2020, categories='sex')

```

![e_g](inst/img/plot_bar.png)


### Maps
``` r
idbsocialdataR:::idbsocial_choropleth('pobreza', year = 2020)

```

![e_g](inst/img/plot_map.png)


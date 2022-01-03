
# SCLDataR



## Installation
For the moment this package is only available from github.
To install the development version:

``` r
install.packages("devtools")
install.packages("sf")

devtools::install_github("BID-DATA/idbsocialdataR") 

```

# Data

## Indicators
``` r
data <- idbsocialdataR:::query_indicator(indicator = 'pobreza',
                                   countries = 'COL,ECU,BRA,URY',
                                   categories = 'area')
```
``` r
# A tibble: 5 x 23
  iddate  year month idgeo  isoalpha3 source  indicator area  value     se    cv sample theme_es theme_en
  <chr>  <dbl> <lgl> <chr>  <chr>     <chr>   <chr>     <chr> <dbl>  <dbl> <dbl>  <dbl> <chr>    <chr>   
1 year    2006 NA    count… BRA       BRA-PN… pobreza   rural  62.0 0.206  0.333  64606 ingreso  income  
2 year    2006 NA    count… BRA       BRA-PN… pobreza   urban  30.9 0.0875 0.283 332088 ingreso  income  
3 year    2012 NA    count… BRA       BRA-PN… pobreza   rural  46.1 0      0      51214 ingreso  income  
4 year    2012 NA    count… BRA       BRA-PN… pobreza   urban  17.9 0      0     297772 ingreso  income  
5 year    2015 NA    count… BRA       BRA-PN… pobreza   rural  43.0 0      0      51544 ingreso  income  
# … with 9 more variables: source_en <chr>, source_es <chr>, country_name_en <chr>,
#   country_name_es <chr>, valuetype <chr>, label_en <chr>, label_es <chr>, description_en <chr>,
#   description_es <chr>
```


# Metadata

## Dictionary

```r
dictionary <- idbsocialdataR:::query_dictionary() %>% select(collection, indicator, label_es)

```

```r
# A tibble: 757 x 3
   collection                      indicator        label_es                                             
   <chr>                           <chr>            <chr>                                                
 1 Household Socio-Economic Surve… urbano_ci        "Porcentaje dela población que reside en zonas urban…
 2 Household Socio-Economic Surve… unip_ch          "Porcentaje de hogares unipersonales "               
 3 Household Socio-Economic Surve… union_ci         "Porcentaje de personas en unión formal o informal"  
 4 Household Socio-Economic Surve… tamh_ch          "Tamaño promedio del hogar"                          
 5 Household Socio-Economic Surve… rural_ci         "Porcentaje de la población que reside en zonas rura…
```


## BaseMaps

```r
idbsocialdataR:::get_map(level = '1', isoalpha3 = 'COL') %>% 
  ggplot(aes(fill = isoalpha3)) +
  geom_sf(size = 0.25)
```

<img src="inst/img/query_map.png" width=35% >



# Quick-Plots

You can always build your own graphs but sometimes it is useful to have some quick-plots.


### Line Chart

``` r
idbsocial_plot('pobreza',type='line', countries='All' ,yearstart = 2000, yearend = 2020, categories='All')

```

<img src="inst/img/plot_line.png" width=45% >



### Bar Chart

``` r
idbsocial_plot('pobreza',type='bar', countries='MEX,ARG' ,yearstart = 2000, yearend = 2020)

```

<img src="inst/img/plot_bar.png" width=45% >


### Maps

``` r
idbsocialdataR:::idbsocial_choropleth('pobreza', year = 2020)

```

<img src="inst/img/plot_map.png" width=45% >


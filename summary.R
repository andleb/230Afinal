library(readstata13)
library(dplyr)
library(sf)
library(ggplot2)

## Figure 1
cells = read_sf(dsn = 'data_raw/Virtual_country', layer = 'virtual_cntrygrid')

fig1 = ggplot(cells) + geom_sf(aes(fill = suit_new), colour = NA) +
  scale_fill_viridis_c(direction = -1)
# ggsave("test.png", fig1, height = 5, width = 7, dpi = 1000)


## Figure 2
countries = read_sf(dsn = 'countries', layer = 'countries')

greeceCells = countries %>% filter(COUNTRY == 'Greece') %>%
  st_intersection(y = cells)

nepalCells = countries %>% filter(COUNTRY == 'Nepal') %>%
  st_intersection(y = cells)

plot(density(greeceCells$suit_new, kernel = "epanechnikov"))
lines(density(nepalCells$suit_new, kernel = "epanechnikov"), col = 'red')




## Load Data
data = read.dta13("data_raw/Tables1-3a.dta")

colnames(data) = c('countryCode', 'entryYear', 'countryName', 'avgTemp', 
                   'avgPrecip', 'seaDist', 'avgElev', 'sdElev', 'absLat', 
                   'erange_geconclip', 'numLang', 'suitableCells', 'suitRange', 
                   'climate', 'soil', 'sdClimate', 'sdSoil', 'sdSuitable', 
                   'avgSuitable', 'pop95', 'area', 'lnLang', 'africa', 
                   'europe', 'americas', 'lnPop95', 'migrationDist', 
                   'lnArea', 'pctIndigenous', 'lnPopDens1500', 
                   'agriTran', 'reg_eap')


data %>% select(
  c('numLang', 'sdElev', 'sdSuitable', 'avgElev', 'avgSuitable', 'absLat', 
    'avgPrecip', 'avgTemp', 'lnArea', 'seaDist', 'migrationDist', 'lnPop95')
  ) %>%
  cor()

data %>% select(
  c('numLang', 'sdElev', 'sdSuitable', 'avgElev', 'avgSuitable', 'absLat', 
    'avgPrecip', 'avgTemp', 'lnArea', 'seaDist', 'migrationDist', 'lnPop95')
) %>%
  summary()














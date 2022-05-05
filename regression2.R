library(readstata13)
library(sf)
library(tidyverse)

data2 = read.dta13('data_raw/Tables4-7b.dta')
greg = read.csv('greg.csv')
colnames(greg) = c('uniq_cnt25', 'nmbrlang')

data2 = data2 %>% select(-c('nmbrlang')) %>% merge(greg, by = 'uniq_cnt25')

hist(data2$nmbrlang)

data2 = data2[data2$nmbrlang > 0,]
data2$lnnmbrlang = log(data2$nmbrlang)

colnames(data2) = c('virtCode', 'countryCode', 'climate', 'soil',
                   'sdClimate', 'sdSoil', 'seaDist', 'avgElev', 'avgPrecip',
                   'avgTemp', 'sdElev', 'waterArea', 'suitableCells',
                   'avgSuit', 'sdSuit', 'popDens95', 'range', 'area',
                   'withinCountry', 'numCountry', 'migrationDist', 'lnLang',
                   'totalPop95', 'absLat', 'tropics', 'erange_gecon',
                   'lnArea', 'lnAvgPop95', 'pctIndigenous', 'diffAvgElev',
                   'diffAvgPrecip', 'diffAvgTemp', 'diffAvgSuit',
                   'overlap', 'numLang')

data2 %>% filter(totalPop95 >= 3000) %>%
  select(c('lnLang', 'sdElev', 'sdSuit', 'avgSuit', 'avgElev', 'absLat',
            'avgPrecip', 'avgTemp', 'area', 'seaDist', 'waterArea',
            'migrationDist', 'withinCountry', 'numCountry', 'popDens95')) %>% cor()

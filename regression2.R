library(readstata13)
library(sf)
library(tidyverse)

library(sandwich)
library(lmtest)

data2 = read.dta13('data_raw/Tables4-7b.dta')
greg = read.csv('greg.csv')
colnames(greg) = c('uniq_cnt25', 'number_suit_valid25', 'nmbrlang')

data2 = data2 %>% select(-c('nmbrlang', 'number_suit_valid25')) %>% merge(greg, by = 'uniq_cnt25')
ogCols = colnames(data2)

hist(data2$nmbrlang)

data2$lnnmbrlang = log(data2$nmbrlang)

colnames(data2) = c('virtCode', 'countryCode', 'climate', 'soil',
                   'sdClimate', 'sdSoil', 'seaDist', 'avgElev', 'avgPrecip',
                   'avgTemp', 'sdElev', 'waterArea', 'avgSuitable',
                   'sdSuitable', 'popDens95', 'range', 'area', 'withinCountry', 
                   'numCountry', 'migrationDist', 'lnLang', 'totalPop95',
                   'absLat', 'tropics', 'erange_gecon', 'lnArea', 
                   'lnPopDens95', 'pctIndigenous', 'diffAvgElev',
                   'diffAvgPrecip', 'diffAvgTemp', 'diffAvgSuit',
                   'overlap', 'suitableCells', 'numLang')

data2 %>% filter(totalPop95 >= 3000) %>%
  select(c('lnLang', 'sdElev', 'sdSuitable', 'avgSuitable', 'avgElev', 'absLat',
            'avgPrecip', 'avgTemp', 'area', 'seaDist', 'waterArea',
            'migrationDist', 'withinCountry', 'numCountry', 'popDens95')) %>% cor()

standardize = function(vec) {return ((vec - mean(vec, na.rm = TRUE)) / sd(vec, na.rm = TRUE))}

modelCols = c('lnLang', 'sdElev', 'sdSuitable', 'avgElev', 'avgSuitable',
              'absLat', 'avgPrecip', 'avgTemp', 'lnArea', 'seaDist', 'waterArea',
              'withinCountry', 'numCountry', 'migrationDist', 'lnPopDens95')

condition = (data2$totalPop95 >= 3000) & (data2$suitableCells >= 10)
for (col in modelCols) {
  data2[condition, paste0(col, '1')] = standardize(data2[condition, col])
}
model1 = lm(lnLang1 ~ absLat1, data2 %>% filter(condition))
coeftest(model1, vcov = vcovCL, cluster = ~countryCode)

model2 = lm(lnLang1 ~ sdElev1 + sdSuitable1 + avgElev1 + avgSuitable1 + absLat1,
            data2 %>% filter(condition))
coeftest(model2, vcov = vcovCL, cluster = ~countryCode)

model3 = lm(lnLang1 ~ sdElev1 + sdSuitable1 + avgElev1 + avgSuitable1 + absLat1
            + avgPrecip1 + avgTemp1 + lnArea1 + seaDist1 + waterArea1
            + withinCountry1 + numCountry1 + migrationDist1,
            data2 %>% filter(condition))
coeftest(model3, vcov = vcovCL, cluster = ~countryCode)

model4 = lm(lnLang1 ~ sdElev1 + sdSuitable1 + avgElev1 + avgSuitable1 + absLat1
            + avgPrecip1 + avgTemp1 + lnArea1 + seaDist1 + waterArea1
            + withinCountry1 + numCountry1 + migrationDist1 + lnPopDens951,
            data2 %>% filter(condition))
coeftest(model4, vcov = vcovCL, cluster = ~countryCode)

condition = (data2$totalPop95 >= 3000) & (data2$suitableCells >= 10) & (data2$tropics == 1)
for (col in modelCols) {
  data2[condition, paste0(col, '5')] = standardize(data2[condition, col])
}
model5 = lm(lnLang5 ~ sdElev5 + sdSuitable5 + avgElev5 + avgSuitable5 + absLat5
            + avgPrecip5 + avgTemp5 + lnArea5 + seaDist5 + waterArea5
            + withinCountry5 + numCountry5 + migrationDist5 + lnPopDens955,
            data2 %>% filter(condition))
coeftest(model5, vcov = vcovCL, cluster = ~countryCode)

condition = (data2$totalPop95 >= 3000) & (data2$suitableCells >= 10) & (data2$tropics == 0)
for (col in modelCols) {
  data2[condition, paste0(col, '6')] = standardize(data2[condition, col])
}
model6 = lm(lnLang6 ~ sdElev6 + sdSuitable6 + avgElev6 + avgSuitable6 + absLat6
            + avgPrecip6 + avgTemp6 + lnArea6 + seaDist6 + waterArea6
            + withinCountry6 + numCountry6 + migrationDist6 + lnPopDens956,
            data2 %>% filter(condition))
coeftest(model6, vcov = vcovCL, cluster = ~countryCode)

condition = (data2$totalPop95 >= 3000) & (data2$suitableCells >= 10) & (data2$withinCountry == 1)
for (col in modelCols) {
  data2[condition, paste0(col, '7')] = standardize(data2[condition, col])
}
model7 = lm(lnLang7 ~ sdElev7 + sdSuitable7 + avgElev7 + avgSuitable7 + absLat7
            + avgPrecip7 + avgTemp7 + lnArea7 + seaDist7 + waterArea7
            + migrationDist7 + lnPopDens957,
            data2 %>% filter(condition))
coeftest(model7, vcov = vcovCL, cluster = ~countryCode)




library(readstata13)
library(sf)
library(tidyverse)

cells = read_sf(dsn = 'data_raw/Virtual_country', layer = 'virtual_cntrygrid')
countries = read_sf(dsn = 'countries', layer = 'countries')
data = read.dta13("data_raw/Tables1-3a.dta")

colnames(data) = c('countryCode', 'entryYear', 'countryName', 'avgTemp', 
                   'avgPrecip', 'seaDist', 'avgElev', 'sdElev', 'absLat', 
                   'erange_geconclip', 'numLang', 'suitableCells', 'suitRange',
                   'climate', 'soil', 'sdClimate', 'sdSoil', 'sdSuitable', 
                   'avgSuitable', 'pop95', 'area', 'lnLang', 'africa', 
                   'europe', 'americas', 'lnPop95', 'migrationDist', 
                   'lnArea', 'pctIndigenous', 'lnPopDens1500', 
                   'agriTran', 'reg_eap')


standardize = function(vec) {return ((vec - mean(vec, na.rm = TRUE)) / sd(vec, na.rm = TRUE))}

modelCols = c('entryYear', 'avgTemp', 'avgPrecip', 'seaDist', 'avgElev', 
              'sdElev', 'absLat', 'numLang', 'suitRange', 'climate', 
              'soil', 'sdClimate', 'sdSoil', 'sdSuitable', 'avgSuitable', 
              'pop95', 'area', 'lnLang', 'lnPop95', 'migrationDist', 
              'lnArea', 'pctIndigenous', 'lnPopDens1500', 'agriTran',
              'americas', 'europe', 'africa', 'reg_eap')

for (col in modelCols) {
  data[,col] = standardize(data[,col])
}


model1 = lm(lnLang ~ absLat, data)
summary(model1)

model2 = lm(lnLang ~ sdElev + sdSuitable + avgElev + avgSuitable + absLat, data)
summary(model2)

model3 = lm(lnLang ~ sdElev + sdSuitable + avgElev + avgSuitable + absLat
            + avgPrecip + avgTemp + lnArea + seaDist + migrationDist, data)
summary(model3)

model4 = lm(lnLang ~ sdElev + sdSuitable + avgElev + avgSuitable + absLat
            + avgPrecip + avgTemp + lnArea + seaDist + migrationDist + lnPop95
            + africa + europe + americas + reg_eap, data)
summary(model4)

missingData = is.na(data$agriTran) | is.na(data$entryYear) | is.na(data$lnPopDens1500)
for (col in modelCols) {
  data[!missingData,col] = standardize(data[!missingData,col])
}

model5 = lm(lnLang ~ sdElev + sdSuitable + avgElev + avgSuitable + absLat
            + avgPrecip + avgTemp + lnArea + seaDist + migrationDist + lnPop95
            + lnPopDens1500 + entryYear + agriTran
            + africa + europe + americas + reg_eap, data, na.action = na.exclude)
summary(model5)
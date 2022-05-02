library(readstata13)
library(sf)
library(tidyverse)

cells = read_sf(dsn = 'data_raw/Virtual_country', layer = 'virtual_cntrygrid')

data2 = read.dta13('data_raw/Tables4-7b.dta')
greg = read.csv('greg.csv')
colnames(greg) = c('uniq_cnt25', 'nmbrlang')

data2 = data2 %>% select(-c('nmbrlang')) %>% merge(greg, by = 'uniq_cnt25')

hist(data2$nmbrlang)
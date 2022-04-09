
use "**\Tables4-7b.dta", clear

*** The dataset includes all all geographic variables for each virtual country ***

*** See README file on how to construct the data on languages per virtual country****

*** Summary stats for virtual country regressions. Table 4 ***
sum sd_emean sd_suit avg emean abs_lat precav tempav areakm2 sea_dist water_area migdist in_country numb_cntry mean_pop95 if  totalpoplang25_1995>=3000, det

*** THE REGRESSIONS BELOW REPLICATE OF TABLE 5 *****

reg diffavg if totalpoplang25_1995>=3000, cluster(wbcode)
reg diffemean if totalpoplang25_1995>=3000, cluster(wbcode)
reg difftempav if totalpoplang25_1995>=3000, cluster(wbcode)
reg diffprecav if totalpoplang25_1995>=3000, cluster(wbcode)

*** Generate and export correlation stats
cor lnnmbrlang sd_emean sd_suit avg emean abs_lat precav tempav lnareakm2 sea_dist water_area migdist in_country numb_cntry lnmean_pop95 if  totalpoplang25_1995>=3000,

*** Standardize Variables for Columns 1-4 of Table 6 ***

sum lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & totalpoplang25_1995>=3000 & sd_emean!=. & lnnmbrlang!=.
g lang1=(lnnmbrlang - 1.207266)/.9604181
g abs1=(abs_lat - 34.34903)/18.72217
g sdmean1=(sd_emean - .1875808)/.2181726
g sdsuit1=(sd_suit - .1053391)/.0921916 
g emean1= (emean -.6957898)/.7853831
g avg1 = (avg - .351152)/.3031086
g prec1 = (precav - .0667558)/.0575981
g temp1 = (tempav - 12.76258)/11.3287 
g km1 = (lnareakm2 - 3.769097)/.4948785 
g sea1 = (sea_dist - .6333831)/.5852097
g wat1= (water_area - .8686325)/1.304739
g in1= (in_country - .597715)/.4905063
g nmbr1 = (numb_cntry - 1.562838)/.8117605
g mig1 = (migdist - 9.413477)/6.153812
g pop1 = (lnmean_pop95 - (-4.607048))/2.117203


*** Standardize Variables for Column 5 of Table 6 ***

sum lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & totalpoplang25_1995>=3000 & tropics==1

g lang2=(lnnmbrlang - 1.920231)/1.033355
g abs2=(abs_lat - 12.11787)/6.993064
g sdmean2=(sd_emean - .1853139)/.2116263
g sdsuit2=(sd_suit - .1093215)/.0815756 
g emean2= (emean - .6125739)/.551927
g avg2 = (avg - .3856844)/.2617081

g prec2 = (precav - .1061716)/.0748408
g temp2 = (tempav - 24.66978)/3.244211 
g km2 = (lnareakm2 - 3.911657)/.5197606 
g sea2 = (sea_dist - .4665792)/.4246244
g wat2= (water_area - .8397194)/1.565387
g in2= (in_country - .4608209)/.4989283
g nmbr2 = (numb_cntry - 1.738806)/.8081742
g mig2 = (migdist - 8.689274)/7.853274
g pop2 = (lnmean_pop95 - (-4.384136))/1.967601


*** Standardize Variables for Column 6 of Table 6 ***

sum lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & totalpoplang25_1995>=3000 & tropics==0

g lang3=(lnnmbrlang - .8681802)/.7050363
g abs3=(abs_lat - 44.92215)/12.12384
g sdmean3=(sd_emean - .1886588)/.2213024
g sdsuit3=(sd_suit - .103445)/.0968101 
g emean3= (emean - .7353671)/.8722662
g avg3 = (avg - .3347284)/.319733
g prec3 = (precav - .0480096)/.0338258
g temp3 = (tempav - 7.099536)/9.210954

g km3 = (lnareakm2 - 3.701295)/.4678154 
g sea3 = (sea_dist - .7127149)/.6326773
g wat3= (water_area - .8823835)/1.160959
g in3= (in_country - .6628217)/.4729562
g nmbr3 = (numb_cntry - 1.479148)/.8003441
g mig3 = (migdist - 9.757908)/5.120969
g pop3 = (lnmean_pop95 - (-4.713065))/2.177609


*** Standardize Variables for Column 7 of Table 6 ***

sum lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & totalpoplang25_1995>=3000 & in_country==1

g lang4=(lnnmbrlang - .9198333)/.8827072
g abs4=(abs_lat - 37.67313)/18.54109
g sdmean4=(sd_emean - .1702679)/.1912212
g sdsuit4=(sd_suit - .094639)/.0870681 
g emean4= (emean - .691116)/.8108318
g avg4 = (avg - .3373358)/.3121131

g prec4 = (precav - .0634058)/.0549877
g temp4 = (tempav - 10.59204)/11.6279 
g km4 = (lnareakm2 - 3.706645)/.5098575 
g sea4 = (sea_dist - .6776101)/.6146519
g wat4= (water_area - .8213399)/1.13521
g mig4 = (migdist - 10.15479)/5.81558
g pop4 = (lnmean_pop95 - (-4.824858))/2.24119

*** Regressions of Table 6 ***
reg  lang1 abs1 if number_suit_valid25>9 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid)
reg  lang1 abs1 sdmean1 sdsuit1 emean1 avg1 if number_suit_valid25>9 & totalpoplang25_1995>=3000, robust cluster(wbcode_centroid)
reg  lang1 abs1 sdmean1 sdsuit1 emean1 avg1 prec1 temp1 km1 sea1 wat1 in1 nmbr1 mig1 if number_suit_valid25>9 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid)
areg lang1 abs1 sdmean1 sdsuit1 emean1 avg1 prec1 temp1 km1 sea1 wat1 in1 nmbr1 mig1 pop1 if number_suit_valid25>9 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid) absorb(wbcode)
**Column 5
areg lang2 abs2 sdmean2 sdsuit2 emean2 avg2 prec2 temp2 km2 sea2 wat2 in2 nmbr2 mig2 pop2  if number_suit_valid25>9 & totalpoplang25_1995>=3000 & tropics==1, robust  cluster(wbcode_centroid) absorb(wbcode)
**Column 6
areg lang3 abs3 sdmean3 sdsuit3 emean3 avg3 prec3 temp3 km3 sea3 wat3 in3 nmbr3 mig3 pop3  if number_suit_valid25>9 & totalpoplang25_1995>=3000 & tropics==0, robust  cluster(wbcode_centroid) absorb(wbcode)
**Column 7
areg lang4 abs4 sdmean4 sdsuit4 emean4 avg4 prec4 temp4 km4 sea4 wat4 mig4 pop4  if number_suit_valid25>9 & totalpoplang25_1995>=3000 & in_country==1, robust  cluster(wbcode_centroid) absorb(wbcode)



***************************
******** TABLE 7A ********

** Column 1
* Negative Binomial Estimation*
xi: nbreg nmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 i.wbcode if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid)

** Column 2
* Including All Virtual Countries
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 3
* Including ONLY Virtual Countries with a population of at least 50000 people
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=50000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 4
* Including All Languages Irrespective of the number of recorded speakers
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=50000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 5
* Including Linguistic Groups with at Least 3000 recorded speakers
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=50000, robust  cluster(wbcode_centroid) absorb(wbcode)



***************************
******** TABLE 7B ********

** Column 1
*** Including ONLY Virtual Countries with Complete Linguistic Coverage Across All 25 Cells **
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25==25 & lnareakm2>-10 & totalpoplang25_1995>=3000 & overlap==1, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 2
***Adding 100 fixed effects for area.
xtile km2_100tiles = areakm2 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000 & lnnmbrlang!=., nq(100)
xi: areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 i.km2_100tiles if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 3
*** Using dispersion as measure for variability
areg lnnmbrlang abs_lat erange_gecon range emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 4
***Using Climatic Variation as a measure of Geographic variation****
areg lnnmbrlang abs_lat sd_emean sdclim emean clim_suit precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid) absorb(wbcode)

** Column 5
***Using Soil Variation as a measure of Geographic variation****
areg lnnmbrlang abs_lat sd_emean sdsoil emean soil_suit precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000, robust  cluster(wbcode_centroid) absorb(wbcode)


*** THE REGRESSIONS BELOW REPLICATE THE RESULTS PRESENTED IN COLUMNS 1, 2 OF TABLE 10 *****
**Column 1
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000 & indigenous>=0.40, robust  cluster(wbcode_centroid) absorb(wbcode)
**Column 2
areg lnnmbrlang abs_lat sd_emean sd_suit emean avg precav tempav lnareakm2 sea_dist water_area in_country numb_cntry migdist lnmean_pop95 if number_suit_valid25>9 & lnareakm2>-10 & totalpoplang25_1995>=3000 & indigenous<0.40, robust  cluster(wbcode_centroid) absorb(wbcode)



use "**\Tables1-3a.dta", clear

*** NOTE THAT ALL GEOGRAPHIC STATISTICS ARE DERIVED ALONG THE TERRITORIES WHICH ARE LINGUISTICALLY MAPPPED******

sum lpd1500 yrentry agritran  nmbrlang_percntry lnnmbrlang_percntry abs_latclip sd_suitclip sd_emeanclip emeanclip avgclip sdclimclip climclip erange_geconclip rangeclip sdsoilclip soilclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe

**** Kdensity plots for figures 2a AND 2b *****

kdensity nmbrlang_percntry
kdensity lnnmbrlang_percntry

* Summary statistics 
sum nmbrlang_percntry sd_emeanclip sd_suitclip emeanclip avgclip abs_latclip precavclip tempavclip km2cntry_lang sea_distclip  migdistclip pop95clip, det
* Correlation matrix
cor lnnmbrlang_percntry sd_emeanclip sd_suitclip emeanclip avgclip abs_latclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip


*** Standardize Variables for Table 2; Columns 1-4 Regressions ***

sum lnnmbrlang_percntry abs_latclip sd_suitclip sd_emeanclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=. 
g lang1=(lnnmbrlang_percntry-2.415574)/1.518003 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g abs1=(abs_latclip-27.14365)/17.67763 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g sdsuit1=(sd_suitclip-.1849065)/.0984465 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g sdemean1=(sd_emeanclip-.3594983)/.3642036 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g emean1=(emeanclip-.5744248)/.4918074 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g avg1=(avgclip-.4361675)/.2522488 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g prec1=(precavclip-91.22873)/63.83723 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g temp1=(tempavclip-17.85546)/8.489405 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g km21=(lnkm2cntry_lang -.5168361)/1.550639 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g sea1=(sea_distclip -.3350276)/.3752991 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g mig1=(migdistclip  -8.691868)/6.890586 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g pop951=(lnpop95clip -(-3.272036))/1.459365 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g ame1=(americas -.1666667)/.3738783 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g eap1=(reg_eap -.1217949)/.328102 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g afri1=(africa -.3076923)/.4630249 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.
g eur1=(europe -.2307692)/.422682 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=.


*** Standardize Variables for Column 5 of Table 2 ***

sum lpd1500 yrentry agritran lnnmbrlang_percntry abs_latclip sd_suitclip sd_emeanclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if agritran!=. & yrentry!=. & lpd1500!=.
g lp2=(lpd1500 -.9158306)/1.50903 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=. & agritran!=. & yrentry!=. & lpd1500!=.
g yr2=(yrentry -1927.289)/56.77123 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=. & agritran!=. & yrentry!=. & lpd1500!=.
g ag2=(agritran -4.846127)/2.381698 if suit_nmbrclip>9 & lnkm2cntry_lang>-10 & sd_suitclip!=. & agritran!=. & yrentry!=. & lpd1500!=.

g lang2=(lnnmbrlang_percntry-2.484048)/1.540156 if agritran!=. & yrentry!=. & lpd1500!=.
g abs2=(abs_latclip-27.39426)/17.34598 if agritran!=. & yrentry!=. & lpd1500!=.
g sdsuit2=(sd_suitclip-.1914842)/.094695 if agritran!=. & yrentry!=. & lpd1500!=.
g sdemean2=(sd_emeanclip-.3620145)/.3529842 if agritran!=. & yrentry!=. & lpd1500!=.
g emean2=(emeanclip-.5842611)/.486532 if agritran!=. & yrentry!=. & lpd1500!=.
g avg2=(avgclip-.447632)/.2439969 if agritran!=. & yrentry!=. & lpd1500!=.
g prec2=(precavclip-87.99062)/61.30376 if agritran!=. & yrentry!=. & lpd1500!=.
g temp2=(tempavclip-17.78317)/8.302721 if agritran!=. & yrentry!=. & lpd1500!=.
g km22=(lnkm2cntry_lang -.7172816)/1.44662 if agritran!=. & yrentry!=. & lpd1500!=.
g sea2=(sea_distclip - .3575891)/.3846968 if agritran!=. & yrentry!=. & lpd1500!=.
g mig2=(migdistclip  - 8.397052)/6.694917 if agritran!=. & yrentry!=. & lpd1500!=.
g pop952=(lnpop95clip -(-3.16789))/1.286945 if agritran!=. & yrentry!=. & lpd1500!=.
g ame2=(americas - .1549296)/.3631184 if agritran!=. & yrentry!=. & lpd1500!=.
g eap2=(reg_eap - .1126761)/.3173157 if agritran!=. & yrentry!=. & lpd1500!=.
g afri2=(africa - .3169014)/.4669156 if agritran!=. & yrentry!=. & lpd1500!=.
g eur2=(europe - .2394366)/.4282502 if sd_suitclip!=. & agritran!=. & yrentry!=. & lpd1500!=.

** TABlE 1 REGRESSIONS***

**Column 1
reg lang1 abs1 if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust 
**Column 2
reg lang1 abs1 sdemean1 sdsuit1 emean1 avg1 if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
**Column 3
reg lang1 abs1 sdemean1 sdsuit1 emean1 avg1 prec1 temp1 km21 sea1 mig1 if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
**Column 4
reg lang1 abs1 sdsuit1 sdemean1 emean1 avg1 prec1 temp1 km21 sea1  mig1 pop951 ame1 eap1 afri1 eur1 if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust

**Column 5
reg lang2 abs2 sdemean2 sdsuit2 emean2 avg2 prec2 temp2 km22 sea2 mig2 pop952 ame2 eap2 afri2 eur2 lp2 yr2 ag2 if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust


*** THE REGRESSIONS BELOW REPLICATE THE RESULTS PRESENTED IN COUMNS 5, 6 OF TABLE 10 *****

reg lnnmbrlang_percntry abs_latclip sd_emeanclip sd_suitclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe  lpd1500 yrentry agritran if indigenous>=0.4, robust
reg lnnmbrlang_percntry abs_latclip sd_emeanclip sd_suitclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe  lpd1500 yrentry agritran if indigenous<0.4, robust


*** THESE REGRESSIONS ARE USED TO GENERATE THE PARTIAL SCATTERPLOTS PRESENTED IN FIGURES 4 and 5*****

reg lnnmbrlang_percntry abs_latclip sd_emeanclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
predict w if suit_nmbrclip>9 & lnkm2cntry_lang>-10, res
reg sd_suitclip abs_latclip sd_emeanclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
predict ww if suit_nmbrclip>9 & lnkm2cntry_lang>-10, res
twoway (scatter w ww,  mlabel(wbcode) msize(small) mlabpos(12) mlabsize(2)) || (lfit w ww, clwidth(medthick)), ytitle("Log(Number of Languages)", size(small)) xlabel(,labsize(small)) xtitle("Variation in Land Quality", size(small)) title("Ethnolinguistic Diversity and Variation in Land Quality", size(medlarge)) subtitle("Conditional on Geography, Population Density, Migratory Distance from East Africa and Continental FE", size(vsmall)) legend(off) graphregion(color(white)) plotregion(color(white))
drop w ww

*Make the scatter plot for # languages and elevation variation
reg lnnmbrlang_percntry abs_latclip sd_suitclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
predict w if suit_nmbrclip>9 & lnkm2cntry_lang>-10, res
reg sd_emeanclip sd_suitclip abs_latclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust
predict ww if suit_nmbrclip>9 & lnkm2cntry_lang>-10, res
twoway (scatter w ww,  mlabel(wbcode) msize(small) mlabpos(12) mlabsize(2)) || (lfit w ww, clwidth(medthick)), ytitle("Log(Number of Languages)", size(small)) xlabel(,labsize(small)) xtitle("Variation in Elevation", size(small)) title("Ethnolinguistic Diversity and Variation in Elevation", size(medlarge)) subtitle("Conditional on Geography, Population Density, Migratory Distance from East Africa and Continental FE", size(vsmall)) legend(off) graphregion(color(white)) plotregion(color(white))
drop w ww


** TABLE 3A ****

** Negative Binomial Estimation
nbreg nmbrlang_percntry abs_latclip sd_suitclip sd_emeanclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe lpd1500 yrentry agritran, robust

* Using dispersion as a measure for variability
reg lnnmbrlang_percntry abs_latclip erange_geconclip rangeclip emeanclip avgclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe lpd1500 yrentry agritran, robust 

* Using Climatic Suitability as a measure for Land Quality
reg lnnmbrlang_percntry abs_latclip sd_emeanclip sdclimclip emeanclip climclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe lpd1500 yrentry agritran, robust 

* Using Soil Suitability as a measure for Land Quality
reg lnnmbrlang_percntry abs_latclip sd_emeanclip sdsoilclip emeanclip soilclip precavclip tempavclip lnkm2cntry_lang sea_distclip  migdistclip lnpop95clip americas reg_eap africa europe lpd1500 yrentry agritran if suit_nmbrclip>9 & lnkm2cntry_lang>-10, robust 

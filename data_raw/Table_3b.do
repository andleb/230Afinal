
use "**\Table_3b.dta", clear

*** NOTE THAT ALL GEOGRAPHIC STATISTICS ARE DERIVED ALONG ALL CELLS WITHIN A COUNTRY******

*** Standardize Variables for Table 3b ***

sum lpd1500 yrentry agritran elf elf3 elf5 elf7 elf9 abs_lat sd_clim sd_emean emean mean_clim precav tempav lnareakm2 distc migdist lnpop95 americas reg_eap africa europe nmbr_climsuit

g lp3=(lpd1500 -.9125643)/1.504215
g yr3=(yrentry - 1926.923)/56.73972
g ag3=(agritran - 4.833217)/2.378313

g elf_30=(elf-.4113305)/.2817543

g elf_33=(elf3 - .2578713)/.2181161
g elf_35=(elf5 - .3247126)/.2591037
g elf_37=(elf7 - .392435)/.2872409
g elf_39=(elf9 - .4298993)/.2900741

g abs3=(abs_lat - 27.53877)/17.48499
g sdclim3=(sd_clim - .1534572)/.144872
g sdemean3=(sd_emean - .359623)/.3392752
g emean3=(emean - .5616296)/.4800371

g clim3=(mean_clim - .6987815)/.3323016
g prec3=(precav - 86.41295)/58.90395
g temp3=(tempav - 17.7995)/8.471267

g km23=(lnareakm2 - 5.583046)/1.534881
g sea3=(distc - 433.9718)/467.0216
g mig3=(migdist  - 8.486839)/6.770727
g pop953=(lnpop95 - 3.757472)/1.233741
g ame3=(americas - .1608392)/.3686739
g eap3=(reg_eap - .1118881)/.3163368
g afri3=(africa - .3146853)/.4660227
g eur3=(europe - .2377622)/.4272091

** TABlE 3b REGRESSIONS***

**Column 1
reg elf_30 abs3, robust
**Column 2
reg elf_30 abs3 sdemean3 sdclim3 emean3 clim3, robust
**Column 3
reg elf_30 abs3 sdemean3 sdclim3 emean3 clim3 prec3 temp3 km23 sea3 mig3 pop953 lp3 yr3 ag3 ame3 eap3 afri3 eur3, robust
**Column 4
reg elf_33 abs3 sdemean3 sdclim3 emean3 clim3 prec3 temp3 km23 sea3 mig3 pop953 lp3 yr3 ag3 ame3 eap3 afri3 eur3, robust
**Column 5
reg elf_35 abs3 sdemean3 sdclim3 emean3 clim3 prec3 temp3 km23 sea3 mig3 pop953 lp3 yr3 ag3 ame3 eap3 afri3 eur3, robust
**Column 6
reg elf_37 abs3 sdemean3 sdclim3 emean3 clim3 prec3 temp3 km23 sea3 mig3 pop953 lp3 yr3 ag3 ame3 eap3 afri3 eur3, robust
**Column 7
reg elf_39 abs3 sdemean3 sdclim3 emean3 clim3 prec3 temp3 km23 sea3 mig3 pop953 lp3 yr3 ag3 ame3 eap3 afri3 eur3, robust


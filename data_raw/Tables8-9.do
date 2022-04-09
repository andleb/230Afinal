
use "**\Tables8_9.dta", clear

*** The dataset includes all all geographic variables for each virtual country ***

*** See README file on how to construct the Peecentage of Common languages Within Regional Pair****


*** Summary stats for virtual country regressions. Table 8 ***
sum pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens pair_areakm2 pair_dummy if pair_areakm2>=1, det

* Column 1
reg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1 & indigenous!=., cluster(pair_cntry)

** Column 2 
** Adding Region FE
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1 & indigenous!=., cluster(pair_cntry) absorb(point5_id)

** Column 3 
** Focusing on African regional pairs
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1 & indigenous!=. & Africa>=0.5, cluster(pair_cntry) absorb(point5_id)

** Column 4 
** Focusing on European regional pairs
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1 & indigenous!=. & Europe>=0.5, cluster(pair_cntry) absorb(point5_id)

** Column 5 
** Focusing on Asian regional pairs
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1 & indigenous!=. & Asia>=0.5, cluster(pair_cntry) absorb(point5_id)


*** THE REGRESSIONS BELOW REPLICATE THE RESULTS PRESENTED IN COLUMNS 3, 4 OF TABLE 10 *****
**Column 3
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1  & indigenous>=0.4 & indigenous!=., cluster(pair_cntry) absorb(point5_id)
**Column 4
areg pct_comlang lqdiff eldiff dist_neigh migdist abs_lat elev land_quality prec_pair_1961_90 temp_pair_1961_90 sea_dist waterarea_pair lnpair_popdens lnpair_areakm2 pair_dummy if pair_areakm2>=1  & indigenous<0.4 & indigenous!=., cluster(pair_cntry) absorb(point5_id)


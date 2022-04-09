
use "**\Table11.dta", clear

** TABlE 1 REGRESSIONS***

**Column 1
dprobit pastorwithin pastorbuffer lqwithin10 if pastornot!=., cluster(group)
**Column 2
dprobit pastorwithin pastornot pastorbuffer lqwithin10, cluster(group)
**Column 3
dprobit dommaizewithin             dommaizebuffer lqwithin10 if dommaizenot!=., cluster(group)
**Column 4
dprobit dommaizewithin dommaizenot dommaizebuffer lqwithin10, cluster(group)
**Column 5
dprobit domsorghumwithin               domsorghumbuffer lqwithin10 if domsorghumnot!=., cluster(group)
**Column 6
dprobit domsorghumwithin domsorghumnot domsorghumbuffer lqwithin10, cluster(group)



***************************MAIN TEXT TABLES & FIGURES***************************

****TABLE 1****
use "MAS_Main Data_CS.dta"
count   if pg==1 & terrcontrol==1
count   if pg==0 & terrcontrol==1
count   if sec2==1 & terrcontrol==1
count   if sec2==0 & terrcontrol==1
count   if sec2==1 & pg==1 & terrcontrol==1
count   if sec2==0 & pg==1 & terrcontrol==1
count   if sec2==1 & pg==0 & terrcontrol==1
count   if sec2==0 & pg==0 & terrcontrol==1

***TABLE 2: Stratified Sample***
reg pg i.sec2 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur if terrcontrol==1, cluster(location)
reg pg i.sec2 imrmin gdppcmin democracymin totalpopmin lmt if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin   locnum1-locnum95 if terrcontrol==1, cluster(location)
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin   lmt groups2 changemin if terrcontrol==1, cluster(location)


***FIGURE 1a***

reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
margins, at((mean) dur imrmin gdppcmin democracymin totalpopmin lmt dur ethnonsec communist rebord sec2=0) ///
at((mean)  imrmin gdppcmin democracymin totalpopmin lmt dur ethnonsec communist rebord sec2=1 ) post

marginsplot, plotopts(c(none) mcolor(black)) legend(off) graphregion(color(white))   ///
ciopts(lcolor(black)) ylabel(, angle(horizontal) nogrid notick labsize(medlarge)) ///
 xscale(range(.5 2.5)  titlegap(4)) xlabel(1 `"Non-Secessionist"' 2 `" Secessionist "', labsize(medlarge) nogrid notick) /// 
 ysca(titlegap(4)) ytitle("Probability of Inclusive Provision", size(large)) ///
 xtitle("", size(large))  /// 
 title("") graphregion(color(white))  ylabel(, angle(horizontal) nogrid notick) ///
 yscale(range(0[.2]1)) ylabel(0(.2)1, nogrid notick)  ///
 text(.50 2.02 ".50***", place(e) size(medsmall) color(black)) ///
 text(.12 1.02  ".12*", place(e) size(medsmall) color(black)) ///
 level(90) 
 graph display, ysize(7) xsize(5)	
 
 
***FIGURE 1b***

reg pg sec2 if terrcontrol==1, cluster(location)
estimates store basict
reg pg sec2 communist ethnonsec rebord dur if terrcontrol==1, cluster(location)
estimates store insl
reg pg sec2 imrmin gdppcmin democracymin totalpopmin lmt if terrcontrol==1, cluster(location)
estimates store state
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
estimates store basem
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 if terrcontrol==1, cluster(location)
estimates store re
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)
estimates store te
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt locnum1-locnum95 if terrcontrol==1, cluster(location)
estimates store ce
reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin   lmt groups2 changemin if terrcontrol==1, cluster(location)
estimates store mech


coefplot (basict \ insl \ state \ basem  \ re \ te \ce \ mech) ///
, keep(sec2) aseq swapnames ///
    coeflabels( ///
			   basict = "Model 1" ///
			   insl = "Model 2: Insurgency-Level Controls" ///
			   state = "Model 3: State-Level Controls" ///
			   basem = "Model 4" ///
			   re = "Model 5: Region FE" ///
			   te = "Model 6: Region and Decade FE" ///
			   ce = "Model 7: Country FE" ///
			   mech = "Model 8" ///
			   , labgap(-80) notick) ///
			   noeqlabels ///
	headings (basict = "{bf:Bivariate Regression}"  insl = "{bf:Including Controls}" basem= "{bf:Base Model}"  re= "{bf:Fixed Effects}"   ///
			 mech= "{bf:Evaluating Mechanisms}" ///
		 , labcolor(black) labgap(-90)) ///
			   xline(0, lcolor(black))  mcolor(black) lcolor(black) ///
			   levels(90) ciopts(lcolor(black)) graphregion(margin(l=65) color(white))  ///
			    ylabel(, nogrid notick) yscale(alt noline) ///
				xscale(range(0(.2)1)) ///
				xlabel (0(.2)1, nogrid notick) ///
				msize(tiny) 
				
graph display, ysize(7)	





**************************APPENDIX TABLES AND FIGURES***************************

***TABLE A.1: Summary Statistics, Cross-Sectional Analysis***
estpost summarize sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin lmt changemin groups if terrcontrol==1, d
estpost summarize  communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin lmt changemin groups if sec2==1 & terrcontrol==1, d
estpost summarize  communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin lmt changemin groups if sec2==0 & terrcontrol==1, d


***TABLE A.V: Full Sample with Interaction Term***
reg pg i.sec2##i.terrcontrol, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur, cluster(location)
reg pg i.sec2##i.terrcontrol imrmin gdppcmin democracymin totalpopmin lmt, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 dec40-dec90, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt locnum1-locnum95, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin  groups2 changemin, cluster(location)


***TABLE A.VI: Additional Controls Table***
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin changemin  lmt  if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt nonmilex if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt logrs if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt bd_best_low_log if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt groups2 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt preconflict_edu if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur imrmin gdppcmin democracymin totalpopmin  lmt rs1-rs4 if terrcontrol==1, cluster(location)


***TABLE A.VI, Cont.: Additional Controls Table***
reg pg i.sec2 communist ethnonsec  dur imrmin gdppcmin democracymin totalpopmin  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur imrmin gdppcmin democracymin changemin  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur imrmin gdppcmin democracymin totalpopmin  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health regionnum1-regionnum4 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur imrmin gdppcmin democracymin totalpopmin  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)


***TABLE A.VII: Excluding Outliers***
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1
gen s=e(sample)
predict cooks if s==1, cooks 
gen outlier=0
replace outlier=1 if cooks>4/(56) & s==1
reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1 & outlier==0, cluster(location)
drop s outlier cooks

***TABLE A.VIII: Jackknife***
jackknife: reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1


***TABLE A.IX: Original Dataset***
clear
use "MAS_Original Data_CS.dta"
reg pgcheck i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
clear

***TABLE A.X: Stratify by Size and Time***
use "MAS_Main Data_CS.dta"
reg pg i.sec2  rebord  communist ethnonsec dur imrmin gdppcmin totalpopmin democracymin lmt if logrs>   8.92201 & terrcontrol==1, cluster(location)
gen s=e(sample)
sum logrs if s==1
drop s
reg pg i.sec2  rebord  communist ethnonsec dur imrmin gdppcmin totalpopmin democracymin lmt if logrs>   8.92201 & terrcontrol==1, cluster(location)
reg pg i.sec2  rebord  communist ethnonsec dur imrmin gdppcmin totalpopmin democracymin lmt if yearmin>= 1970 & terrcontrol==1, cluster(location)
reg pg_zero i.sec2  rebord  communist ethnonsec dur imrmin gdppcmin totalpopmin democracymin lmt if terrcontrol==1, cluster(location)
reg pg_one i.sec2  rebord  communist ethnonsec dur imrmin gdppcmin totalpopmin democracymin lmt if terrcontrol==1, cluster(location)

***TABLE A.XI: Alternative IV***
eststo:reg pg i.seccol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
eststo:reg pg i.secbroad3 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
eststo:reg pg i.secbroad4 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)

***TABLE A.XII: Alternative DV Specification***
eststo:reg pgb i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
eststo:reg pg_alt i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)
eststo:reg pg_ord i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)

***TABLE A.XIII: Alternative Estimator***
eststo:logit pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt  if terrcontrol==1, cluster(location)
eststo:ologit pg_ord i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt  if terrcontrol==1, cluster(location)

****TABLE A.XIV Multiple Imputation****
mi set mlong
mi tsset, clear
mi stset, clear
mi set mlong
mi register imputed imrmin gdppcmin democracymin totalpopmin
mi register regular sec2 communist ethnonsec rebord dur terrcontrol
mi impute chained  (regress) imrmin gdppcmin totalpopmin (logit) democracymin , add(20) rseed(123)
mi estimate, post: reg pg sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)

***FIGURE A.1b
gen sec2terr=sec2*terrcontrol

reg pg sec2terr , cluster(location)
estimates store basict
reg pg sec2terr communist ethnonsec rebord dur , cluster(location)
estimates store insl
reg pg sec2terr imrmin gdppcmin democracymin totalpopmin lmt , cluster(location)
estimates store state
reg pg sec2terr communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt , cluster(location)
estimates store basem
reg pg sec2terr communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 , cluster(location)
estimates store re
reg pg sec2terr communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt regionnum1-regionnum4 dec40-dec90 , cluster(location)
estimates store te
reg pg sec2terr communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt locnum1-locnum95 , cluster(location)
estimates store ce
reg pg sec2terr communist ethnonsec rebord dur imrmin gdppcmin democracymin   lmt groups2 changemin , cluster(location)
estimates store mech


coefplot (basict \ insl \ state \ basem  \ re \ te \ce \ mech) ///
, keep(sec2terr) aseq swapnames ///
    coeflabels( basict = "Model 1" ///
			   insl = "Model 2: Insurgency-Level Controls" ///
			   state = "Model 3: State-Level Controls" ///
			   basem = "Model 4" ///
			   re = "Model 5: Region FE" ///
			   te = "Model 6: Region and Decade FE" ///
			   ce = "Model 7: Country FE" ///
			   mech = "Model 8" ///
			   , labgap(-80) notick) ///
			   noeqlabels ///
	headings (basict = "{bf:Basic Regression}"  insl = "{bf:Including Controls}" basem= "{bf:Base Model}"  re= "{bf:Fixed Effects}"   ///
			 mech= "{bf:Evaluating Mechanisms}" ///
		 , labcolor(black) labgap(-90)) ///
			   xline(0, lcolor(black))  mcolor(black) lcolor(black) ///
			   levels(90) ciopts(lcolor(black)) graphregion(margin(l=65) color(white))  ///
			    ylabel(, nogrid notick) yscale(alt noline) ///
				xscale(range(0(.2)1)) ///
				xlabel (0(.2)1, nogrid notick) ///
				msize(tiny) 
				
graph display, ysize(7)	

***FIGURE A.2b
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt , cluster(location)
margins, at((mean)_all  sec2=0 terrcontrol=0) ///
at((mean)_all  sec2=1 terrcontrol=0) ///
at((mean)_all  sec2=0 terrcontrol=1) ///
at((mean)_all  sec2=1 terrcontrol=1) post

marginsplot, plotopts(c(none) mcolor(black)) legend(off) graphregion(color(white))   ///
ciopts(lcolor(black)) ylabel(, angle(horizontal) nogrid notick labsize(medlarge)) ///
 xscale(range(.7(.5)4.3) titlegap(4)) xlabel(1 `" "Non-Secessionist"  "No Territory" "' 2 `" "Secessionist"  "No Territory" "' 3 `" "Non-Secessionist" "Territory" "' 4 `" "Secessionist" "Territory" "', labsize(medlarge) nogrid notick) /// 
 ysca(titlegap(4)) ytitle("Probability of Inclusive Provision", size(large)) ///
 xtitle("", size(large))  /// 
 title("") graphregion(color(white))  ylabel(, angle(horizontal) nogrid notick) ///
 yscale(range(0[.2]1)) ylabel(0(.2) 1, nogrid notick) text(.54 4.02  ".54***", place(e) size(medsmall) color(black)) ///
 text(.09 3.02  ".09", place(e) size(medsmall) color(black))  text(.02 2.02 ".02", place(e) size(medsmall) color(black)) ///
 text(.04 1.02  ".04", place(e) size(medsmall) color(black)) ///
 level(90) 
  


********************************APPENDIX 4********************************
clear
use "MAS_Main Data_CS.dta"

***TABLE A.3: Predictive Accuracy***
logit pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt  if terrcontrol==1, cluster(location)
lroc, mcolor(black) msize(small)  graphregion(color(white)) ytitle("Sensitivity", size(medium) color(black))  yscale(titlegap(4)) xscale(titlegap(4)) title("", color(black)) xtitle("Specificity", size(medium) color(black)) graphregion(color(white)) ylabel(, nogrid notick)  xlabel(,nogrid notick)  note("Area Under Curve=0.89") rlopts(lcolor(black))


logit pg i.sec2##i.terrcontrol communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt , cluster(location)
lroc, mcolor(black) msize(small)  graphregion(color(white)) ytitle("Sensitivity", size(medium) color(black))  yscale(titlegap(4)) xscale(titlegap(4)) title("", color(black)) xtitle("Specificity", size(medium) color(black)) graphregion(color(white)) ylabel(, nogrid notick)  xlabel(,nogrid notick)  note("Area Under Curve=0.90") rlopts(lcolor(black))


***TABLE A.XV: Boostrapping***
eststo:bootstrap, reps(500) size(30): reg pg i.sec2 communist ethnonsec rebord dur imrmin gdppcmin democracymin totalpopmin  lmt if terrcontrol==1, cluster(location)


********************************APPENDIX 5********************************
clear
use "MAS_Main Data_Panel.dta"

****FIGURES A.4 and A.5: Education or Health Care Provision by Goals, Overtime (Panel)***
label var yearpubhealthcountnonsec "Inclusive Services, Non-Secessionist"
label var yearpubhealthcountsec "Inclusive Services, Secessionist"
label var countnonsec "Non-Secessionist"
label var yearpubeducountnonsec "Inclusive Services, Non-Secessionist"
label var countsec "Secessionist"
label var yearpubeducountsec "Inclusive Services, Secessionist"

graph twoway line yearpubeducountsec yearpubeducountnonsec countnonsec countsec year, ///
title("", size(medlarge) color(black)) lcolor(gray yellow blue black) ///
lpattern(solid dash dash solid) ylabel(, angle(horizontal) nogrid notick) ///
xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ///
 ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) ///
 xtitle("Years", size(medsmall)) graphregion(color(white))  lw(medium) ///
 legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("", ///
 color(black) size(medsmall))) legend(order(4 1 3 2) region(lstyle(none)))
 
 graph twoway line yearpubhealthcountsec yearpubhealthcountnonsec countnonsec countsec year, ///
title("", size(medlarge) color(black)) lcolor(gray yellow blue black) ///
lpattern(solid dash dash solid) ylabel(, angle(horizontal) nogrid notick) ///
xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ///
 ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) ///
 xtitle("Years", size(medsmall)) graphregion(color(white))  lw(medium) ///
 legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("", ///
 color(black) size(medsmall))) legend(order(4 1 3 2) region(lstyle(none)))
 
***TABLE A.XVI: Summary Statistics for Panel Data***
summarize sec2 terrcontrol communist ethnonsec rebord dur  l1imr l1gdppc_log l1totalpop_log l1democracy lmt groups2 totalpop_change_log if terrcontrol==1, d
summarize  communist ethnonsec rebord dur  l1imr l1gdppc_log l1totalpop_log l1democracy lmt groups2 totalpop_change_log if sec2==1 & terrcontrol==1, d
summarize   communist ethnonsec rebord dur  l1imr l1gdppc_log l1totalpop_log l1democracy lmt groups2 totalpop_change_log if sec2==0 & terrcontrol==1, d


***TABLE A.XVII: Panel Results, Table 2 Replication***
reg pg i.sec2 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur if terrcontrol==1, cluster(location)
reg pg i.sec2 l1imr l1gdppc_log l1democracy l1totalpop_log lmt if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt regionnum1-regionnum4 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log   locnum1-locnum95 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy   lmt totalpop_change_log groups2 if terrcontrol==1, cluster(location)


***TABLE A.XVIII: Panel Results, Full Sample***
reg pg i.sec2##i.terrcontrol, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur, cluster(location)
reg pg i.sec2##i.terrcontrol l1imr l1gdppc_log l1democracy l1totalpop_log lmt, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt regionnum1-regionnum4, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt regionnum1-regionnum4 dec40-dec90, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log   locnum1-locnum95, cluster(location)
reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy   lmt totalpop_change_log groups2, cluster(location)


***FIGURE A.6: Predicted Panel Results***
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
margins, at((mean) dur l1imr l1gdppc_l l1democracy l1totalpop_log lmt dur ethnonsec communist rebord sec2=0) ///
at((mean)  l1imr l1gdppc_l l1democracy l1totalpop_log lmt dur ethnonsec communist rebord sec2=1 ) post

marginsplot, plotopts(c(none) mcolor(black)) legend(off) graphregion(color(white))   ///
ciopts(lcolor(black)) ylabel(, angle(horizontal) nogrid notick labsize(medlarge)) ///
 xscale(range(.5 2.5)  titlegap(4)) xlabel(1 `"Non-Secessionist"' 2 `" Secessionist "', labsize(medlarge) nogrid notick) /// 
 ysca(titlegap(4)) ytitle("Probability of Inclusive Provision", size(large)) ///
 xtitle("", size(large))  /// 
 title("") graphregion(color(white))  ylabel(, angle(horizontal) nogrid notick) ///
 yscale(range(0[.2]1)) ylabel(0(.2)1, nogrid notick)  ///
 text(.40 2.02 ".40***", place(e) size(medsmall) color(black)) ///
 text(.14 1.02  ".12*", place(e) size(medsmall) color(black)) ///
 level(90) 


reg pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt , cluster(location)
margins, at((mean)_all  sec2=0 terrcontrol=0) ///
at((mean)_all  sec2=1 terrcontrol=0) ///
at((mean)_all  sec2=0 terrcontrol=1) ///
at((mean)_all  sec2=1 terrcontrol=1) 

marginsplot, plotopts(c(none) mcolor(black)) legend(off) graphregion(color(white))   ///
ciopts(lcolor(black)) ylabel(, angle(horizontal) nogrid notick labsize(medlarge)) ///
 xscale(range(.7(.5)4.3) titlegap(4)) xlabel(1 `" "Non-Secessionist"  "No Territory" "' 2 `" "Secessionist"  "No Territory" "' 3 `" "Non-Secessionist" "Territory" "' 4 `" "Secessionist" "Territory" "', labsize(medlarge) nogrid notick) /// 
 ysca(titlegap(4)) ytitle("Probability of Inclusive Provision", size(large)) ///
 xtitle("", size(large))  /// 
 title("") graphregion(color(white))  ylabel(, angle(horizontal) nogrid notick) ///
 yscale(range(0[.2]1)) ylabel(0(.2) 1, nogrid notick) text(.45 4.02  ".45***", place(e) size(medsmall) color(black)) ///
 text(.14 3.02  ".14**", place(e) size(medsmall) color(black))  text(.00 2.02 ".00", place(e) size(medsmall) color(black)) ///
 text(.07 1.02  ".07", place(e) size(medsmall) color(black)) ///
 level(90) 

***TABLE A.XVIII: Panel Results, Additional Controls***
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy   lmt totalpop_change_log if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt nonmilex if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt logrs if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt bd_best_low_log if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt groups2 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt preconflict_edu if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt rs1-rs4 if terrcontrol==1, cluster(location)

***TABLE A.XVIII: Panel Results, Additional Controls, Cont.***
reg pg i.sec2 communist ethnonsec  dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur l1imr l1gdppc_log l1democracy totalpop_change_log  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health regionnum1-regionnum4 if terrcontrol==1, cluster(location)
reg pg i.sec2 communist ethnonsec  dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt rs1-rs4 nonmilex logrs groups2 bd_best_low_log preconflict_edu preconflict_health regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)


***TABLE A.XIX: Panel Results, Excluding Outliers***
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1
gen s=e(sample)
predict cooks if s==1, cooks 
gen outlier=0
replace outlier=1 if cooks>4/(543) & s==1
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1 & outlier==0, cluster(location)
drop s
drop cooks
drop outlier

***TABLE A.XX: Panel Results, Jackknife***
jackknife:  reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1


***TABLE A.XXI: Panel Results, Original Dataset***
clear
use "MAS_Original Data_Panel.dta"
reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
clear
use "MAS_Main Data_Panel.dta"

***TABLE A.XXII: Panel Results, Stratify by Size and Time***

reg pg i.sec2  rebord  communist ethnonsec dur l1imr l1gdppc_log l1totalpop_log l1democracy lmt if logrs>   9.033623 & terrcontrol==1, cluster(location)
gen s=e(sample)
sum logrs if s==1
reg pg i.sec2  rebord  communist ethnonsec dur l1imr l1gdppc_log l1totalpop_log l1democracy lmt if logrs>   9.033623 & terrcontrol==1, cluster(location)
reg pg i.sec2  rebord  communist ethnonsec dur l1imr l1gdppc_log l1totalpop_log l1democracy lmt if yearmin>= 1970 & terrcontrol==1, cluster(location)
reg pg_zero i.sec2  rebord  communist ethnonsec dur l1imr l1gdppc_log l1totalpop_log l1democracy lmt if terrcontrol==1, cluster(location)
reg pg_one i.sec2  rebord  communist ethnonsec dur l1imr l1gdppc_log l1totalpop_log l1democracy lmt if terrcontrol==1, cluster(location)


***TABLE A.XXIII: Panel Results, Alternative IV***
reg pg i.seccol communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
reg pg i.secbroad3 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
reg pg i.secbroad4 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)

***TABLE A.XXIV: Panel Results, Alternative DV Specification***
reg pgb i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
reg pg_alt i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
reg pg_ord i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)

***TABLE A.XXV: Panel Results: Alternative Estimator***
logit pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt  if terrcontrol==1, cluster(location)
ologit pg_ord i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt  if terrcontrol==1, cluster(location)

****TABLE A.XXVI: Panel Results, Multiple Imputation**** 
mi set mlong
mi tsset, clear
mi stset, clear
mi set mlong
mi register imputed l1imr l1gdppc_log l1democracy l1totalpop_log
mi register regular sec2 communist ethnonsec rebord dur
mi impute chained  (regress) l1imr l1gdppc_log  l1totalpop_log (logit) l1democracy , add(20) rseed(123)
mi estimate, post: reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
eststo: mi estimate, post: reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
esttab using "/Users/meganstewart/Documents/Dissertation Paper/miceP.tex", keep(sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmtnest) replace label nogap r2 b(2) se star(+ 0.15 * 0.10 ** 0.05 *** 0.01) ti(\textbf{Multiple Imputation (Panel)})
eststo drop  est1 est2 est3 est4 est5 est6 est7 est8 est9

clear
use "MAS_Main Data_Panel.dta"
****FIGURE A.7: Panel Results, LROC
logit pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt  if terrcontrol==1, cluster(location)
lroc, mcolor(black) msize(small)  graphregion(color(white)) ytitle("Sensitivity", size(medium) color(black))  yscale(titlegap(4)) xscale(titlegap(4)) title("", color(black)) xtitle("Specificity", size(medium) color(black)) graphregion(color(white)) ylabel(, nogrid notick)  xlabel(,nogrid notick)  note("Area Under Curve=0.82") rlopts(lcolor(black))

logit pg i.sec2##i.terrcontrol communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy  l1totalpop_log  lmt , cluster(location)
lroc, mcolor(black) msize(small)  graphregion(color(white)) ytitle("Sensitivity", size(medium) color(black))  yscale(titlegap(4)) xscale(titlegap(4)) title("", color(black)) xtitle("Specificity", size(medium) color(black)) graphregion(color(white)) ylabel(, nogrid notick)  xlabel(,nogrid notick)  note("Area Under Curve=0.88") rlopts(lcolor(black))

***TABLE A.XXVII: Panel Results, Boostrapping***
 bootstrap, reps(500) size(236):reg pg i.sec2 communist ethnonsec rebord dur l1imr l1gdppc_log l1democracy l1totalpop_log  lmt if terrcontrol==1
 
***Figure A.8b
reg pg sec2 if terrcontrol==1, cluster(location)
estimates store basict
reg pg sec2 communist ethnonsec rebord dur if terrcontrol==1, cluster(location)
estimates store insl
reg pg sec2 l1imr l1gdppc_l l1democracy l1totalpop_log lmt if terrcontrol==1, cluster(location)
estimates store state
reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt if terrcontrol==1, cluster(location)
estimates store basem
reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt regionnum1-regionnum4 if terrcontrol==1, cluster(location)
estimates store re
reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt regionnum1-regionnum4 dec40-dec90 if terrcontrol==1, cluster(location)
estimates store te
reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt locnum1-locnum95 if terrcontrol==1, cluster(location)
estimates store ce
reg pg sec2 communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy   lmt groups2 totalpop_change_log if terrcontrol==1, cluster(location)
estimates store mech


coefplot (basict \ insl \ state \ basem  \ re \ te \ce \ mech) ///
, keep(sec2) aseq swapnames ///
    coeflabels( ///
			   basict = "Model 1" ///
			   insl = "Model 2: Insurgency-Level Controls" ///
			   state = "Model 3: State-Level Controls" ///
			   basem = "Model 4" ///
			   re = "Model 5: Region FE" ///
			   te = "Model 6: Region and Decade FE" ///
			   ce = "Model 7: Country FE" ///
			   mech = "Model 8" ///
			   , labgap(-80) notick) ///
			   noeqlabels ///
	headings (basict = "{bf:Bivariate Regression}"  insl = "{bf:Including Controls}" basem= "{bf:Base Model}"  re= "{bf:Fixed Effects}"   ///
			 mech= "{bf:Evaluating Mechanisms}" ///
		 , labcolor(black) labgap(-90)) ///
			   xline(0, lcolor(black))  mcolor(black) lcolor(black) ///
			   levels(90) ciopts(lcolor(black)) graphregion(margin(l=65) color(white))  ///
			    ylabel(, nogrid notick) yscale(alt noline) ///
				xscale(range(0(.2)1)) ///
				xlabel (0(.2)1, nogrid notick) ///
				msize(tiny) 
				
graph display, ysize(7)				
 
 
***Figure A.9b

gen sec2terr=sec2*terrcontrol

reg pg sec2terr , cluster(location)
estimates store basict
reg pg sec2terr communist ethnonsec rebord dur , cluster(location)
estimates store insl
reg pg sec2terr l1imr l1gdppc_l l1democracy l1totalpop_log lmt , cluster(location)
estimates store state
reg pg sec2terr communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt , cluster(location)
estimates store basem
reg pg sec2terr communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt regionnum1-regionnum4 , cluster(location)
estimates store re
reg pg sec2terr communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt regionnum1-regionnum4 dec40-dec90 , cluster(location)
estimates store te
reg pg sec2terr communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy l1totalpop_log  lmt locnum1-locnum95 , cluster(location)
estimates store ce
reg pg sec2terr communist ethnonsec rebord dur l1imr l1gdppc_l l1democracy   lmt groups2 totalpop_change_log , cluster(location)
estimates store mech


coefplot (basict \ insl \ state \ basem  \ re \ te \ce \ mech) ///
, keep(sec2terr) aseq swapnames ///
    coeflabels( basict = "Model 1" ///
			   insl = "Model 2: Insurgency-Level Controls" ///
			   state = "Model 3: State-Level Controls" ///
			   basem = "Model 4" ///
			   re = "Model 5: Region FE" ///
			   te = "Model 6: Region and Decade FE" ///
			   ce = "Model 7: Country FE" ///
			   mech = "Model 8" ///
			   , labgap(-80) notick) ///
			   noeqlabels ///
	headings (basict = "{bf:Basic Regression}"  insl = "{bf:Including Controls}" basem= "{bf:Base Model}"  re= "{bf:Fixed Effects}"   ///
			 mech= "{bf:Evaluating Mechanisms}" ///
		 , labcolor(black) labgap(-90)) ///
			   xline(0, lcolor(black))  mcolor(black) lcolor(black) ///
			   levels(90) ciopts(lcolor(black)) graphregion(margin(l=65) color(white))  ///
			    ylabel(, nogrid notick) yscale(alt noline) ///
				xscale(range(0(.2)1)) ///
				xlabel (0(.2)1, nogrid notick) ///
				msize(tiny) 
				
graph display, ysize(7)


****APPENDIX 6: Figures***

***FIGURE A.13***
sort year
graph twoway line eduannual yearcount year if exclude!=1, title("Total Annual Insurgent Education Provision", size(medlarge) color(black)) sub("Globally, 1945-2003", size(med)) lcolor(black gray) lpattern(solid solid) ylabel(, angle(horizontal) nogrid notick) xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) xtitle("Years", size(medsmall)) graphregion(color(white)) lp(solid) lw(medium) legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("Education Provision", color(black) size(medsmall))) legend(region(lwidth(none)))

***FIGURE A.14***
label var yearpubeducount "Inclusive Services"
label var yearexclusiveeducount "Exclusive Services"
label var yearnoeducount "No Services"
label var yearcount "Total Insurgencies"
sort year
graph twoway line yearpubeducount yearexclusiveeducount yearnoeducount yearcount year if exclude!=1, title("", size(medlarge) color(black)) lcolor(gray yellow blue red black) lpattern(solid solid solid solid solid) ylabel(, angle(horizontal) nogrid notick) xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) xtitle("Years", size(medsmall)) graphregion(color(white)) lp(solid) lw(medium) legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("Level of Provision", color(black) size(medsmall))) legend(order(1 3 2 4) region(lstyle(none)))

***FIGURE A.15***
sort year
graph twoway line healthannual yearcount year if exclude!=1, title("Total Annual Insurgent Health Care Provision", size(medlarge) color(black)) sub("Globally, 1945-2003", size(med)) lcolor(black gray) lpattern(solid solid) ylabel(, angle(horizontal) nogrid notick) xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) xtitle("Years", size(medsmall)) graphregion(color(white)) lp(solid) lw(medium) legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("Health Care Provision", color(black) size(medsmall))) legend(region(lwidth(none)))

***FIGURE A.16***
label var yearpubhealthcount "Inclusive Services"
label var yearexclusivehealthcount "Exclusive Services"
label var yearnohealthcount "No Services"
label var yearcount "Total Insurgencies"
sort year
graph twoway line yearpubhealthcount yearexclusivehealthcount yearnohealthcount yearcount year if exclude!=1, title("", size(medlarge) color(black)) lcolor(gray yellow blue red black) lpattern(solid solid solid solid solid) ylabel(, angle(horizontal) nogrid notick) xscale(range(1945(10)2003) titlegap(4)) xlabel(1945 1950 1960 1970 1980 1990 2000) ysca(titlegap(4)) ytitle("Number of Insurgencies", size(medsmall)) xtitle("Years", size(medsmall)) graphregion(color(white)) lp(solid) lw(medium) legend(col(2)) legend(region(lcolor(black) lw(thin))) legend(title("Level of Provision", color(black) size(medsmall))) legend(order(1 3 2 4) region(lstyle(none)))



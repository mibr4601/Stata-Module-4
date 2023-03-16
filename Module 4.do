/*
Stata Module 4
*/

 
clear all
capture log close
use /data/star.dta
generate totalscore = math + listen + wordskill + read
label variable totalscore "Combined SAT score"
regress totalscore freelunch
count if freelunch == 1
twoway (histogram totalscore if freelunch==1, start(1400) width(5) color(red%30)) ///        
       (histogram totalscore if freelunch==0, start(1400) width(5) color(green%30)), ///   
       legend(order(1 "Free Lunch" 2 "No Free Lunch" ))
regress math freelunch
regress read freelunch
regress listen freelunch
regress wordskill freelunch

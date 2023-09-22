use $wdDb\Census2016_final.dta, clear

//*------------------------------------*//
//*  Table of descriptives statistics  *//
//*------------------------------------*//

estpost tab minority 
esttab using "${wdOut}table_statistics.rtf", cells("b(label(freq)) pct(fmt(2)) ") varlabels(`e(labels)') varwidth(30) nonumber nomtitle noobs title({\b Table minority}) replace

foreach y of varlist high_income educ sex agegrp marsth region {
estpost tab `y'
esttab using "${wdOut}table_statistics.rtf", cells("b(label(freq)) pct(fmt(2)) ") varlabels(`e(labels)') varwidth(30) nonumber nomtitle noobs append  title({\b Table `y'})	
}

//*------------------------------------*//
//*   Table of multivariate analyses   *//
//*------------------------------------*//

reg minority i.high_income i.educ i.sex i.agegrp i.marsth i.region , r 
estimates store model1

probit minority i.high_income i.educ i.sex i.agegrp i.marsth i.region ,r
estimates store model2
	margins, dydx(*) post
	estimates store model3
	
esttab model1 model2 model3 using "${wdOut}Table_analyses.rtf", cells(b(star fmt(3)) se(par fmt(2))) stats(r2_a ll N, fmt(%9.3f %9.0g) labels(R-squared Likelihood)) legend label  nonumbers eqlabels(none) collabels(none) mtitle("OLS""PROBIT" "AME-Probit") varlabels(_cons Constant) drop(0.high_income 1.educ 1.sex 6.agegrp 1.marsth 1.region) replace addnote("Standard errors in parentheses")

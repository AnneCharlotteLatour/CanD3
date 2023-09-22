//*-----------------------------*//
//*       Importation Census    *//
//*-----------------------------*//
import delimited "$brutes\pumf-98M0001-E-2016-individuals_F1.csv", clear

save $wdDb\Census2016.dta, replace


//*-----------------------------*//
//*         Data Cleaning       *//
//*-----------------------------*//

recode dpgrsum (1 =0 ) (88=.) (2/15=1), gen(minority)
label var minority "Do you have minority"

label define dicho 1 "YES" 0 "NO" 
label values minority dicho

label define sex 1 "Female" 2 "Male" 
label values sex sex

label define age 1 "0 to 4 years" 2 "5 to 6 years" 3 "7 to 9 years" 4 "10 to 11 years" 5 "12 to 14 years" 6 "15 to 17 years" 7 "18 to 19 years" 8 "20 to 24 years" 9 "25 to 29 years" 10 "30 to 34 years" 11 "35 to 39 years" 12 "40 to 44 years" 13 "45 to 49 years" 14 "50 to 54 years" 15 "55 to 59 years" 16 "60 to 64 years" 17 "65 to 69 years" 18 "70 to 74 years" 19 "75 to 79 years" 20 "80 to 84 years" 21 "85 years and over" 88 "Missing" 
label values agegrp age 

label define marital 1 "Never legally married" 2 "Legally maried" 3 "Living common law" 4 "Separated" 5 "Divorced" 6 "Widowed"
label values marsth marital

label define immig 1 "Canadian citizen by birth" 2 "Canadian citizen by naturalization" 3 "Not a Canadian citizen"
label values citizen immig

label define educ 1 "No certificate, diploma or degree" 2 "Secondary (high) school diploma or equivalency certificate" 3 "Trades certificate or diploma other than Certificate of Appr" 4 "Certificate of Apprenticeship or Certificate of Qualification" 5 "Program of 3 months to less than 1 year" 6 "Program of 1 to 2 years" 7 "Program of more than 2 years" 8 "University certificate or diploma below bachelor level" 9 "Bachelor's degree" 10 "University certificate or diploma above bachelor level" 11 "Degree in medicine, dentistry, veterinary medicine or optome" 12 "Master's degree" 13 "Earned doctorate" 88 "Missing" 99 "Not applicable"
label values hdgree educ 

recode hdgree (1=1 "No certificate, diploma or degree") (2/8 =2 "less than Bachelor's degree") (9=3 "Bachelor's degree") (10 12 =4 "Second cycle diploma") (11=5 "Degree in medicine dentistry, veterinary medicine or optome") (13=6 "Earned doctorate") , gen(educ)

label define revenu 1 "Under $2,000" 2 "$2,000 to $4,999" 3 "$5,000 to $6,999" 4 "$7,000 to $9,999" 5 "$10,000 to $11,999" 6 "$12,000 to $14,999" 7 "$15,000 to $16,999" 8 "$17,000 to $19,999" 9 "$20,000 to $24,999" 10 "$25,000 to $29,999" 11 "$30,000 to $34,999" 12 "$35,000 to $39,999" 13 "$40,000 to $44,999" 14 "$45,000 to $49,999" 15 "$50,000 to $54,999" 16 "$55,000 to $59,999" 17 "$60,000 to $64,999" 18 "$65,000 to $69,999" 19 "$70,000 to $74,999" 20 "$75,000 to $79,999" 21 "$80,000 to $84,999" 22 "$85,000 to $89,999" 23 "$90,000 to $94,999" 24 "$95,000 to $99,999" 25 "$100,000 to $109,999" 26 "$110,000 to $119,999" 27 "$120,000 to $129,999" 28 "$130,000 to $139,999" 29 "$140,000 to $149,999" 30 "$150,000 to $174,999" 31 "$175,000 to $199,999" 32 "$200,000 to $249,999" 33 "$250,000 and over" 88 "Missing" 
label values cfinc revenu 

label define province 10 "Newfoundland and Labrador" 11 "Prince Edward Island" 12 "Nova Scotia" 13 "New Brunswick" 24 "Quebec" 35 "Ontario" 46 "Manitoba" 47 "Saskatchewan" 48 "Alberta" 59 "British Columbia" 70 "Northern Canada" 
label values pr province 

recode pr (10 11 12 13= 1 "Atlantic Provinces") (24 35= 2 "Central Canada") (46 47 48= 3 "Prairie Provinces") (59= 4 "West Coast" ) (70=5 "Northern Territories"), gen(region)

xtile q5_Income=cfinc if cfinc!=88, nq(5)
label variable q5_Income "Weighted Income quintile"

gen high_income=(q5_Income==5) if cfinc!=88
label define high 0 "Q1 to Q4 distribution Income" 1 "Q5 distribution Income"
label values high_income high

//*-----------------------------*//
//*        analytic sample      *//
//*-----------------------------*//

drop if agegrp<6 | agegrp>16 // keep 15-64 years old

* drop missing 
drop if minority==. 
drop if cfinc==88
drop if educ==88

drop if region==5 //keep province only


save $wdDb\Census2016_final.dta, replace

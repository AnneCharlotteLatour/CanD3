# CanD3
## Readme Section


* To get the data :

Statistics Canada. (2016). 2016 Census of Population [Canada] Public Use Microdata File (PUMF) Récupéré à partir de https://search2.odesi.ca/#/details?uri=%2Fodesi%2Fcen-98402-E-2016-pdc.xml, le 22 septembre 2023.

* Dropbox from my work
  
https://www.dropbox.com/scl/fo/t3hqkzwnzsdznh1o87s49/h?rlkey=te6a0lpotbg3drdoezzlrqkfl&dl=0

* The "Do" folder contains the "Built" do-file which cleans the data and selects the sample and the "Tables" do-file which allows you to obtain the tables present in the "Output" folder
* The "Output" folder contains the descriptive statistics and regression tables in tex or word format
* The "Codebook" folder contains the codebook of the database used
* The "Master" file is the do-file which allows you to put the desired set-up for stata
  
## Data Activity

1. Data cleaning "Build.do"

   * Label the following variables *dpgrsum sex agegrp marsth citizen hdgree cfinc pr*
   * Create a dichotomous variable __minority__ from *dprsum* which takes the value of 1 if the individual is anything but white
   * Create an __educ__ variable which uses the *hdgree* variable but which groups categories 2 to 8 together and categories 10 and 12 together.
   * Create a dichotomous variable __high_income__ which takes the value of 1 when individuals are part of the 20% of the richest distribution
2. Definition of analytic sample "Build.do"

   * Drop all missing values for each variable
   * Keep 15-64 year olds
   * keep province only
3. Table of descriptive statistics "Tables.do" & "table_statistics.tex"
 
   * Makes a frequency table of one of the following variables *minority sex agegrp marsth citizen educ high_income pr*
  (Save as table_statistics)
4. Table of multivariable analyses "Tables.do" & "Table_analyses.tex"

   * Regresses an OLS model, a logit model and an AME with the dependent variable minority on the variables *high_income educ sex agegrp marsth citizen pr*
(Save as Table_analyses)

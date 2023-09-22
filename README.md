# CanD3
## Readme Section


* To get the data :


https://www.dropbox.com/scl/fo/t3hqkzwnzsdznh1o87s49/h?rlkey=te6a0lpotbg3drdoezzlrqkfl&dl=0


* The "Do" folder contains the "Built" do-file which cleans the data and selects the sample and the "Tables" do-file which allows you to obtain the tables present in the "Output" folder
* The "Output" folder contains the descriptive statistics and regression tables in tex or word format
* The "Codebook" folder contains the codebook of the database used
* The "Master" file is the do-file which allows you to put the desired set-up for stata
  
## Data Activity

1. Data cleaning "Build.do"

   * Label the following variables *dpgrsum sex agegrp marsth citizen hdgree cfinc pr*
   * Create a dichotomous variable "minority" from *dprsum* which takes the value of 1 if the individual is anything but white
   * Create an "educ" variable which uses the *hdgree* variable but which groups categories 2 to 8 together and categories 10 and 12 together.
   * Create a dichotomous variable high_income which takes the value of 1 when individuals are part of the 20% of the richest distribution
2. Definition of analytic sample "Build.do"
   * 
4. Table of descriptive statistics "Tables.do" & "table_statistics.tex"
5. Table of multivariable analyses "Tables.do" & "Table_analyses.tex"

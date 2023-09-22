/*--------------------------------------------------*/
/*        Date: 22 septembre 2023	                */
/*        Logiciel: Stata17 MP                      */
/*        Auteur: Anne-Charlotte Latour             */
/*        Courriel: annecharlotte.latour@gmail.com  */
/*        Titre: Master                             */
/*--------------------------------------------------*/

/* liens permettant de vous aider pour stata
https://www.stata.com/bookstore/statacheatsheets.pdf 
https://www.parisschoolofeconomics.com/bozio-antoine/fr/documents/stata.pdf
https://www.stata.com/support/faqs/graphics/gph/stata-graphs/
https://fr.slideshare.net/elieouattara/stata-pour-les-nuls
https://wlm.userweb.mwn.de/Stata/index.htm
https://stats.idre.ucla.edu/stata/ */

//*--------------*//
//*    Set up    *//
//*--------------*//
clear all 
*set dp comma // french version table
set more off 

pwd 

if "`c(username)'"=="annec"{
global chemin "C:\Users\annec\Dropbox\Doctorat\CanD3\Reproductibility"
}

if "`c(username)'"=="ec191021"{
global chemin "C:\Users\ec191021\Dropbox\Doctorat\CanD3\Reproductibility"

}

global brutes "${chemin}\DTA_Brutes"
cd $chemin

****Création des sous-dossiers****
cap mkdir 01.Do
cap mkdir 02.Dta
cap mkdir 03.Output

****Création des chemins *****
glo wd "${chemin}"
glo wdDo "${wd}\01.Do\"
glo wdDb "${wd}\02.Dta\"
glo wdOut "${wd}\03.Output\"

**** Création du log ****
local c_date = c(current_date)
local cdate = subinstr("`c_date'", " ", "_", .)
local c_time = c(current_time)
local ctime = subinstr("`c_time'", ":", "_", .)

log using "${wdOut}\logfile_`cdate'-`ctime'-`c(username)'", replace

***** Informations système *****
di "=== SYSTEM DIAGNOSTICS ==="
di "Stata version: `c(stata_version)'"
di "Updated as of: `c(born_date)'"
di "Processors:    `c(processors)'"
di "OS:            `c(os)' `c(osdtl)'"
di "Machine type:  `c(machine_type)'"
di "=========================="

***** Installation des packages *****
***** Ajouter les packages requis de SSC à cette liste *****
    local ssc_packages "estout"
    
    if !missing("`ssc_packages'") {
        foreach pkg in `ssc_packages' {
            dis "Installing `pkg'"
            ssc install `pkg', replace
        }
    }

//*--------------*//
//*   Exécution  *//
//*--------------*//

do $wdDo\Build
do $wdDo\Tables


log close _all
clear
exit

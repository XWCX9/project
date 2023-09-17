clear all
set more off

capture log close

cd "C:\Users\poppa\Desktop\height_08.09"
use "pheno_height.dta", clear
gen regression = "phenotypic"
save all_height_results.dta, replace

use mr_height_unrel.dta, clear
gen regression = "mr_unrel"
save mr_height_unrel.dta, replace

use mr_height_unrel_PCs.dta, clear
gen regression = "mr_unrel_PCs"
save mr_height_unrel_PCs.dta, replace

use mr_height_wf.dta, clear
gen regression = "mr_wf"
save mr_height_wf.dta, replace

use mr_height_wf_PCs.dta, clear
gen regression = "mr_wf_PCs"
save mr_height_wf_PCs.dta, replace

use all_height_results.dta, clear
append using "mr_height_unrel.dta" "mr_height_unrel_PCs.dta" "mr_height_wf.dta" "mr_height_wf_PCs"

keep var coef stderr pval N regression cmdline


drop cmdline

// Computing standard confidence intervals:
gen lower_ci = coef - 1.96*stderr
gen upper_ci = coef + 1.96*stderr

browse

save all_height_results.dta, replace


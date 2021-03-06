SHELF v1.4.0.9000 (2018-08-18) 
==============================

* Significant update to elicit() shiny app: can now swtich between multiple methods within the same app

* New shiny app elicitMultiple() for fitting individual distributions to multiple experts' judgements

* Bug fixed: plinearpool() now chooses the best fitting distribution for each expert if argument d = "best" is specified.  

SHELF v1.4.0 (2018-08-18) 
==============================

* New function: generateReport(): renders an Rmarkdown document to give formulae and parameter values for all the fitted distributions

* New function: condDirichlet(), for viewing conditional distributions from elicited Dirichlet distributions

* New functions: plotQuartiles() and plotTertiles(), for displaying individuals quartiles/tertiles elicited from a group of experts

* New functions: elicitQuartiles() and elicitTertiles(): shiny apps for eliciting with the quartile and tertile methods

* elicit() and roulette() functions now both return the elicited values and results as objects of class "elicitation"


SHELF v1.3.0 (2017-10-31) 
==============================

* Bug fixed: ensure solid line used for linear pool when plotting. Option in plotfit added to plot all individual densities with same colour, to simplify legend.

* New function: linearPoolDensity, for extracting density values from the linear pool.

* Bug fixed: can now accept more than 26 experts.

* Bug fixed: qlinearpool/plinearpool now works with log t distributions.

* New function: elicitHeterogen, for eliciting prior for variance of random effects in meta-analysis

SHELF v1.2.3 (2017-02-10) 
==============================

* Bug fixed: can fit (and plot) distributions bounded below when lower limit is negative

* Bug fixed: roulette method shiny interface works with non-integer bin boundaries

SHELF v1.2.2 (2016-11-14) 
==============================

* Accept non-decreasing probabilities in elicited judgements, rather than only strictly increasing probabilities

* Can specify own axes labels in the plotfit command with arguments xlab and ylab

* Update to Multivariate-normal-copula.Rmd vignette, to match update to GGally


SHELF v1.2.1 (2016-09-06) 
==============================

* Bug fixed: interactive plots now work for plotting individual distributions for multiple experts

* Bug fixed: plotting best fitting individual distributions for multiple experts

SHELF v1.2.0 (2016-08-16) 
==============================

* Roulette elicitation method now implemented using shiny

* New functions fitDirchlet and feedbackDirichlet for eliciting Dirichlet distributions

* New functions copulaSample and elicitConcProb for eliciting dependent distributions using multivariate normal copulas

* New function compareIntervals for comparing fitted intervals for individual distributions from multiple experts

* Change to expert.names from numbers to letters in fitdist

* Vignettes added: overview of SHELF, eliciting a Dirichlet distribution, eliciting a bivariate distribution with a bivariate normal copula 


SHELF v1.1.0 (2016-01-29) 
=========================

* Change in fitdist to starting values in optimisation: will now check for exact fits if only two probabilities elicited 

* New functions added for eliciting beliefs about uncertain population distributions:  cdffeedback, cdfplot, fitprecision, pdfplots
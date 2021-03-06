% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elicitMultipleExperts.R
\name{elicitMultiple}
\alias{elicitMultiple}
\title{Elicit individual judgements and fit distributions for multiple experts}
\usage{
elicitMultiple()
}
\value{
An object of class \code{elicitation}, which is returned once the 
Finish button has been clicked. See \code{\link{fitdist}} for details.
}
\description{
Opens up a web browser (using the shiny package), from which you can specify
judgements, fit distributions and plot the fitted density functions and a 
(weighted) linear pool with additional feedback.
}
\details{
Click the "Quit" button to exit the app and return
the results from the \code{fitdist} command. Click "Download report" to generate a report
of all the fitted distributions.
}
\examples{

\dontrun{

elicitMultiple()

}
}
\author{
Jeremy Oakley <j.oakley@sheffield.ac.uk>
}

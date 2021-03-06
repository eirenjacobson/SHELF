% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitprecision.R
\name{fitprecision}
\alias{fitprecision}
\title{Fit a distribution to judgements about a population precision}
\usage{
fitprecision(interval, propvals, propprobs = c(0.05, 0.95),
  med = interval[1], trans = "identity", pplot = TRUE, tdf = 3,
  fontsize = 12)
}
\arguments{
\item{interval}{A vector specifying the endpoints of an interval \eqn{[k_1, k_2]}.}

\item{propvals}{A vector specifying two values \eqn{\theta_1, \theta_2} for the proportion.}

\item{propprobs}{A vector specifying two probabilities \eqn{p_1, p_2}.}

\item{med}{The hypothetical value of the population median.}

\item{trans}{A string variable taking the value \code{"identity"}, \code{"log"} or
\code{"logit"} corresponding to whether the population distribution is normal, lognormal
or logit-normal respectively.}

\item{pplot}{Plot the population distributions with median set at \eqn{k_1}
and precision fixed at the two elicited quantiles implied by \code{propvals} 
and \code{propprobs}.}

\item{tdf}{Degrees of freedom in the fitted log Student-t distribution.}

\item{fontsize}{Font size used in the plots.}
}
\value{
\item{Gamma}{Parameters of the fitted gamma distribution. Note that E(precision) =
shape / rate.} 
\item{Log.normal}{Parameters of the fitted log normal
distribution: the mean and standard deviation of log precision.}
\item{Log.Student.t}{Parameters of the fitted log student t distributions.
Note that (log(X- \code{lower}) - location) / scale has a standard t distribution. The
degrees of freedom is not fitted: it is specified as an input argument.} 
\item{vals}{The elicited values \eqn{\theta_1, \theta_2}}
\item{probs}{The elicited probabilities \eqn{p_1, p_2}}
\item{limits}{The lower and upper limits specified by each expert (+/- Inf
if not specified).}
\item{transform}{Transformation used for a normal population distribution.}
}
\description{
Takes elicited probabilities about proportion of a population
lying in a specfied interval as inputs, converts the judgements into probability
judgements about the population precision, and fits gamma and lognormal distributions
to these judgements using the \link{fitdist} function.
}
\details{
The expert provides a pair of probability judgements
 \deqn{P(\theta < \theta_1 ) = p_1,} and \deqn{P(\theta < \theta_2) = p_2,}
 where \eqn{\theta} is the proportion of the population that lies in the interval
 \eqn{[k_1, k_2]}, conditional on the population median taking some hypothetical value (\eqn{k_1}
 by default). \eqn{k_1} can be set to \code{-Inf}, or \eqn{k_2} can be set to \code{Inf};
 in either case, the hypothetical median value must be specified. If both \eqn{k_1}
 and \eqn{k_2} are finite, the hypothetical median must be one of the interval endpoints.
 Note that, unlike the \link{fitdist} command, a 'best fitting'
 distribution is not reported, as the distributions are fitted to two elicited
 probabilities only.
}
\examples{
\dontrun{
fitprecision(interval=c(60, 70), propvals=c(0.2, 0.4), trans = "log")
  }
}

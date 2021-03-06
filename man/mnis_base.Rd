% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mnis_base.R
\name{mnis_base}
\alias{mnis_base}
\title{A generic function for the MNIS API}
\usage{
mnis_base(request)
}
\arguments{
\item{request}{The request query being made to the MNIS URL.}
}
\description{
The function requests data in JSON format, but the type of object,
and all URLs, paths and parameters are user-defined. \code{mnis_base}
does not include the option to tidy variable names and data types.
}
\details{
See the API documentation at
\url{http://data.parliament.uk/membersdataplatform/memberquery.aspx} for
details and limits on requests made to MNIS.
}
\examples{
\dontrun{

x <- mnis_base("House=Commons|IsEligible=true/")
}

}

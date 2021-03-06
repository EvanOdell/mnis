% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mnis_general_election_results.R
\name{mnis_general_election_results}
\alias{mnis_general_election_results}
\title{Election results}
\usage{
mnis_general_election_results(
  location_type = "Country",
  location_name = "Great Britain",
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  tidy = TRUE,
  tidy_style = "snake_case"
)
}
\arguments{
\item{location_type}{The type of area to return information for. Accepts
\code{'Country'}, \code{'Region'}, \code{'County'}, and
\code{'Constituency'}. Defaults to \code{'Country'}.}

\item{location_name}{The location to return data for. It can be the name
of any Country, Region, County or Constituency. Defaults to 'Great Britain'.}

\item{start_date}{Start date of search. Accepts character values in
\code{'YYYY-MM-DD'} format, and objects of class \code{Date},
\code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can be
coerced to a date with \code{as.Date()}. Defaults to \code{'1900-01-01'}.}

\item{end_date}{End date of search. Accepts character values in
\code{'YYYY-MM-DD'} format, and objects of class \code{Date},
\code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can
be coerced to a date with \code{as.Date()}. Defaults to current system date.}

\item{tidy}{If \code{TRUE}, fixes the variable names in the tibble to
remove non-alphanumeric characters and superfluous text, and convert to
a consistent style. Defaults to \code{TRUE}.}

\item{tidy_style}{The style to convert variable names to, if
\code{tidy=TRUE}. Accepts one of \code{"snake_case"}, \code{"camelCase"} and
\code{"period.case"}. Defaults to \code{"snake_case"}.}
}
\value{
Returns a list with details of the search parameter and
a tibble with election results.
}
\description{
Returns an object containing list with details of the search parameter and
a tibble with election results. Accepts queries on location type and name,
and the start and end date to return general elections between. The API does
not contain data for Norther Ireland.
}
\examples{
\dontrun{
x <- mnis_general_election_results(
  location_type = "Country", location_name = "England",
  start_date = "2010-01-01", end_date = "2016-01-01"
)
}

}

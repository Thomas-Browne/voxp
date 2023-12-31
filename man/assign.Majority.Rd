% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assign.Majority.R
\name{assign.Majority}
\alias{assign.Majority}
\title{Return the most frequent value in a nominated column for each unique identifier.}
\usage{
assign.Majority(data, identifier, column, proportion_threshold = 0.8)
}
\arguments{
\item{data}{Define the dataset to apply the code to}

\item{identifier}{A column containing a unique identifier}

\item{column}{The column to evaluate}

\item{proportion_threshold}{The threshold required to return the most frequent value; defaults to 0.8}
}
\value{
The most frequent value for each unique identifier is assigned, provided the proportion of the value is equal to or exceeds the proportion threshold.

If value proportion >= threshold is TRUE, most frequent value for each unique identifier is returned.

If value proportion >= threshold is FALSE, returns "Did not meet threshold (x\%)".
}
\description{
Return the most frequent value if proportion is equal to, or exceeds defined threshold, or 80\% of all observables.
}
\examples{
assign.Majority(Employee_data, 'Employee_ID', 'Start_time')
assign.Majority(Patient_data,'Patient_number', 'Country_of_birth', 0.7)
assign.Majority(data = Patient_data, identifier = 'Patient_number', column = 'Country_of_birth', proportion_threshold = 0.4)

Country <- assign.Majority(Patient_data, 'Patient_number', 'Country_of_birth', 0.7)
Patient_data \%>\% left_join(Country, by = 'Patient_number')
}

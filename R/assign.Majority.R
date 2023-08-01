#' Return the most frequent value in a nominated column for each unique identifier.
#'
#' @param data Define the dataset to apply the code to
#' @param identifier A column containing a unique identifier
#' @param column The column to evaluate
#' @param proportion_threshold The threshold required to return the most frequent value; defaults to 0.8
#' @return The most frequent value for each unique identifier is assigned, provided the proportion of the value is equal to or exceeds the proportion threshold.
#'
#' If value proportion >= threshold is TRUE, most frequent value for each unique identifier is returned.
#'
#' If value proportion >= threshold is FALSE, returns "Did not meet threshold (x%)".
#' @export
#'
#' @examples assign.Majority(Employee_data, Employee_data$Employee_ID, Employee_data$Start_time)
#' @examples assign.Majority(Patient_data, Patient_data$Patient_number, Patient_data$Country_of_birth, 0.7)
#' @examples assign.Majority(data = Patient_data, identifier = Patient_data$Patient_number, column = Patient_data$Country_of_birth, proportion_threshold = 0.5)

assign.Majority <- function(data, identifier, column, proportion_threshold = 0.8) {
  setDT(data)

  # Count the sum of all entries in variable column by unique identifier in a new variable: "N"
  variable_counts <- data[, .N, by = .(identifier,
                                       column)]
  # Define a new variable: "prop", that calculated the proportion of variable entry data
  variable_proportions <- variable_counts[, .(prop = N/sum(N),
                                              column),
                                          by = identifier]

  # Test if the maximum proportion surpasses the proportional threshold. If true, returns the variable, else returns "Did not meet threshold".
  Assigned_value <- variable_proportions[, .(Assigned_value = ifelse(max(prop) > proportion_threshold,
                                                                     column[which.max(prop)],
                                                                     paste0("Did not meet threshold (", round(max(prop)*100, 2),"%)"))),
                                         by = identifier]
  # Return assigned country
  return(Assigned_value)
}

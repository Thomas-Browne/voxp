#' Return the most frequent value in a nominated column for each unique identifier.
#'
#' @description Return the most frequent value if proportion is equal to, or exceeds defined threshold, or 80% of all observables.
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
#'
#' @examples Country <- assign.Majority(Patient_data, Patient_data$Patient_number, Patient_data$Country_of_birth, 0.7)
#' Patient_data %>% left_join(Country, by = Patient_data$Patient_number)

assign.Majority <- function(data, identifier, column, proportion_threshold = 0.8) {

  variable_counts <- data %>%
    dplyr::group_by(dplyr::across(dplyr::all_of(c(identifier, column)))) %>%
    dplyr::summarise(N = n(), .groups = 'drop')


  variable_proportions <- variable_counts %>%
    dplyr::group_by(dplyr::across(dplyr::all_of(c(identifier)))) %>%
    dplyr::mutate(prop = N/sum(N)) %>%
    dplyr::ungroup()

  Assigned_value <- variable_proportions %>%
    dplyr::group_by(dplyr::across(dplyr::all_of(c(identifier)))) %>%
    mutate(Assigned_value = ifelse(max(prop) >= proportion_threshold,
                                   get(column)[which.max(prop)],
                                   paste0("Did not meet threshold (",
                                          round(max(prop)*100, 2),"%)"))) %>%
    dplyr::ungroup() %>%
    dplyr::select(identifier, column, Assigned_value)


  # Return assigned country
  return(Assigned_value)
}

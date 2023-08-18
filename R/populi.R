#' Sample public hospital patient data
#'
#' A data frame containing randomly generated demographics of patients born between 01/01/2000 and 05/01/2023. The variables are as follows:
#'
#'
#' \itemize{
#'   \item Patient_number. Unique identifier of a patient
#'   \item Date_of_birth. Date of birth of the patient
#'   \item Country_of_birth. The country the patient was born in
#'   \item Needs_interpreter. Binary indicator of the patient's need for an interpreter (0, 1)
#' }
#'
#' @docType data
#' @keywords datasets
#' @name Patient_data
#' @usage data(Patient_data)
#' @format A data frame with 1000 rows and 4 variables
'Patient_data'

#' Sample employee data
#'
#' A data frame containing a randomly generated log of start and finish times for employees. The variables are as follows:
#'
#'
#' \itemize{
#'   \item Employee_ID. Unique identifier of a employee
#'   \item Start_time. The hour that the employee started work in 24 hour format
#'   \item Finish_time. The hour that the employee finished work in 24 hour format
#'   \item Hours_worked. The sum of hours that the employee worked that day
#' }
#'
#' @docType data
#' @keywords datasets
#' @name Employee_data
#' @usage data(Employee_data)
#' @format A data frame with 50 rows and 4 variables
'Employee_data'

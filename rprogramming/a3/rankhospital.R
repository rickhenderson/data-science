# Functions for A3
# RProgramming
# Hospital Outcomes

# The rankhospital function reads hospital data from the computer
# and returns a character vector with name of the hospital in the specified position
# of ranking for the particular outcome
# Note: Refer to Tables 11 and 19 in Hospital_Revised_Flatfiles.pdf

rankhospital <- function(state, outcome, num = "best") {
     ## Read outcome data
     ## Check that state and outcome are valid
     ## Return hospital name in that state with the given rank
     ## 30-day death rate
     
     ## Read outcome data
     hospital_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     # Create a vector of valid outcomes
     valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
     
     # Create a list of factors for valid rankings
     num_factor <- factor(c("best", "worst"))
     
     # Using "Risk Adjusted Rates"
     # Heart Attack - hospital_data[,11]
     # Heart Failure - hospital_data[,17]
     # Pneumonia - hospital_data[,23]
     
     ## Check that the state and outcome are valid
     # Get the a unique list of states in the dataset
     state_list <- unique(hospital_data[,7])
     
     # Check to see if given state name is valid
     if (!(state %in% state_list)) {
          stop("invalid state")
     }
     
     # Check to see if outcome is valid
     if (!(outcome %in% valid_outcomes)) {
          stop("invalid outcome")
     }
     
     # Check to see if num is valid
     if (!(is.numeric(num))) {
          if (!(num %in% num_factor)) {
               stop("Could not find ranking value")
          }
     }
     
     # Set a column number for each of the outcomes
     if (outcome == "heart attack") {
          reqrd_col = 11
     } else if (outcome == "heart failure") {
          reqrd_col = 17
     } else if (outcome == "pneumonia") {
          reqrd_col = 23
     }
     
     # Subset the list to the required state and outcome AND valid measurement
     df <- hospital_data[hospital_data$State == state, ]
     
     # Break the names out as a separate df
     df_names <- df[, 2]
     
     # Change "Not Available" to NA
     df[df == "Not Available"] <- NA
     
     # Convert the readings as numeric
     df_outcomes <- as.numeric(df[,reqrd_col])
     
     # Combine them together
     df <- data.frame(df_names, df_outcomes)

     # Order by the outcome column then by name to control ties
     df <- sort_by_columns(df, 2, 1)
     
     # Determine the number of hospitals in the state
     num_hospitals = nrow(df)
     
     # Return NA if the provided num argument is > the number of hospitals
     if (is.numeric(num) && (num > num_hospitals)) {
          return(NA)
     }
     
     if (is.numeric(num)) {
          # Return just the hospital name for the required row since the data is sorted.
          results <- df[num,1]
     }
     if (num == "best") {
          # Return the name of the hospital with the best/lowest mortality rate
          results <- df[1,1]
     }
     if (num == "worst") {
          # Return the name of the hospital with the worst/highest mortality rate
          results <- df[num_hospitals,1]
     }
     
     # Output the results
     return(as.character(results))
}

sort_by_columns <- function (data, col1, col2) {
     # From https://github.com/DanieleP/PA3-tutorial/blob/master/sortcolumns.md
     # With changes
     #usage: sorted_data <- sort_by_colmns(df, colnum1, colnum2)
     orderdata <- data[order(data[, col1], data[, col2], decreasing = FALSE, na.last = NA),]
     return(orderdata)
}
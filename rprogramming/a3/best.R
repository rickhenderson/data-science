# Functions for A3
# RProgramming
# Hospital Outcomes

# The best function reads hospital data from the computer
# and determines the hospital with the best outcome.
# Note: Refer to Tables 11 and 19 in Hospital_Revised_Flatfiles.pdf

best <- function(state, outcome) {
     ## Read outcome data
     hospital_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     # Create a vector of valid outcomes
     valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
     # Position of outcome in vector now matches outcome columns for using match()
     
     # Using "Risk Adjusted Rates"
     # Heart Attack - hospital_data[,11]
     # Heart Failure - hospital_data[,17]
     # Pneumonia - hospital_data[,23]
     
     ## Check that the state and outcome are valid
     ## Future update: could also use stopifnot(outcome %in% valid_outcomes, state %in% states_list)

     # Get the a unique list of states in the dataset
     state_list <- unique(hospital_data[,7])
     
     # Check to see if given state name is valid
     if (!(state %in% state_list)) {
          stop("invalid state")
     }
     
     # Chec to see if outcome is valid
     if (!(outcome %in% valid_outcomes)) {
          stop("invalid outcome")
     }
     
     # Subset the list to the required state and outcome AND valid measurement
     df <- hospital_data[hospital_data$State == state, ] 

     # Set a column number for each of the outcomes
     
     
     if (outcome == "heart attack") {
          reqrd_col = 11
     } else if (outcome == "heart failure") {
          reqrd_col = 17
     } else if (outcome == "pneumonia") {
          reqrd_col = 23
     }
     
     # If I ever need it again.
     #min_value = min(as.numeric(df[, reqrd_col]), na.rm=TRUE)       
     
     # Sort so the data frame is sorted by outcome, then by hospital name
     # in the case of ties
     sorted_data <- sort_by_colmns(df, reqrd_col, 1)
     
     ## Return hospital name in that state with the lowest
     ## 30-day death rate fpr the specified outcome
    result <- head(sorted_data, 1)
    
    return(as.character(result[2]))
     
}

sort_by_colmns <- function (data, col1, col2) {
     # From https://github.com/DanieleP/PA3-tutorial/blob/master/sortcolumns.md
     # With changes
     #usage: sorted_data <- sort_by_colmns(df, colnum1, colnum2)
          orderdata <- data[order(data[, col1], data[, col2], decreasing = FALSE, na.last = NA),]
     return(orderdata)
}
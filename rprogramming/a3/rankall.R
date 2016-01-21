# Functions for A3
# RProgramming
# Hospital Outcomes

# The rankall function reads hospital data from the computer
# and returns a 2-column data frame
# containing the hospital in each state that has the ranking specied in num.
# Note: Refer to Tables 11 and 19 in Hospital_Revised_Flatfiles.pdf


rankall <- function(outcome, num = "best") {
     ## Read outcome data
     ## Check that state and outcome are valid
     ## For each state, find the hospital of the given rank
     ## Return a data frame with the hospital names and the
     ## (abbreviated) state name
     
     ## Read outcome data
     hospital_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     # Create a vector of valid outcomes
     valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
     
     # Create a list of factors for valid rankings
     num_factor <- factor(c("best", "worst"))
     
     # Get the a unique list of states in the dataset
     states <- unique(hospital_data[,7])
     
     # Using "Risk Adjusted Rates"
     # Heart Attack - hospital_data[,11]
     # Heart Failure - hospital_data[,17]
     # Pneumonia - hospital_data[,23]
     
     # Set a column number for each of the outcomes
     if (outcome == "heart attack") {
          reqrd_col = 11
     } else if (outcome == "heart failure") {
          reqrd_col = 17
     } else if (outcome == "pneumonia") {
          reqrd_col = 23
     }
     
     if (num == "best") {
          num <- 1
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
      # Determine the number of hospitals in the state
     num_hospitals = nrow(hospital_data)
     
     # Return NA if the provided num argument is > the number of hospitals
     if (is.numeric(num) && (num > num_hospitals)) {
          return(NA)
     }
     
     # Reduce the data frame to just important columns
     # Converting to numeric will also convert the "Not Available" to NA.
     df <- data.frame(hospital = hospital_data$Hospital.Name, state = hospital_data$State, outcome = hospital_data[, reqrd_col])

     # Sort the data
     df <- sort_by_column_NA(df, 3) # This function takes care of NAs.
     splitdf <- split(df, df$state)
     
     myordered<-lapply(splitdf,function(x) {x[order(x$outcome),]})
     
     for (i in 1:54){ 
               
          }
     
     results = 77
     return(results)
     
}

sort_by_columns <- function (data, col1, col2) {
     # From https://github.com/DanieleP/PA3-tutorial/blob/master/sortcolumns.md
     # With changes
     #usage: sorted_data <- sort_by_colmns(df, colnum1, colnum2)
     orderdata <- data[order(data[, col1], data[, col2], decreasing = FALSE, na.last = NA),]
     return(orderdata)
}

sort_by_column_NA <- function(data,column){
     for (i in 3){
          data[,i] <- suppressWarnings(as.numeric(levels(data[,i])[data[,i]]))
     }
     orderdata <- data[order(data[,column]),]
     orderdata <- orderdata[complete.cases(orderdata),] 
     return(orderdata)
}
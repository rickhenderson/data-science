# Functions for A3
# RProgramming
# Hospital Outcomes

# The rankall function reads hospital data from the computer
# and returns a 2-column data frame
# containing the hospital in each state that has the ranking specied in num.
# Note: Refer to Tables 11 and 19 in Hospital_Revised_Flatfiles.pdf

# Modified using the A3 Tutorial Method Aug 2, 2015
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
     df <- sort_by_column_NA(df, 3)
     # Sort by outcome then by Hospital Name
     df <- sort_by_columns(df, 3, 1)
     
     results <- rank_by_state(df, 3, num)
     
     # Output the results
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

sort_state <- function (data, state, column){
     statedata <- data [grep(state,data$state),]
     orderdata <- statedata[order(statedata[,column]),]
     return (orderdata)
}

rank_by_state <- function(data,column,rank){
     ## We save the levels of column 2, the states' names, in the states vector
     states <- levels(data[,2])
     ## We generate an empty vector that we will fill later, row by row, to generate our final output
     output <- vector()
     ## For loop to get the right data on each hospital. length(states) 
     ## is the number of different states in our
     ## database. In our case we have 54 states and regions.
     
     for (i in 1:length(states)) {
          ## statedata subsets data by the considered state
          statedata <- data [grep(states[1],data$state),]
          orderdata <- statedata[order(decreasing = TRUE, statedata[,column]),]
          ## append() adds elements at the end of a vector. We want to add the name of the city [rank,1],
          ## the areakm2 [rank,2] and the populationk [rank,3]. We don't add the name of the countries, because it
          ## will be the label of the rows.
          output <- append (output, as.character(orderdata[rank,1]))
          for (l in 2:2){
               output <- append (output, as.character(orderdata[rank,l]))
          }

     }
     ## Just because it's simpler to generate a matrix rather than a data frame, I generate it first and convert it
     ## to data frame immediatly after. 
     output <- as.data.frame(matrix(output,length(states),2, byrow = TRUE))
     ## Name of the columns will be "hospital" and "state". Name of the rows are the states.
     colnames(output) <- c("hospital","state")
     rownames(output) <- states
     return(output)
}

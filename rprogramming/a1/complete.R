# R Programming Assignment 1
# Part 2
# Created by: Rick Henderson
# - using provided template / prototype

complete <- function(directory, id = 1:332) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     # Create a list of all the files
     files_list <- list.files(directory, full.names = TRUE)
     
     # Create an empty vector
     good_obs <- numeric()
     good_ids <- numeric()
     dat <- data.frame()
     num_good <- 0
     
     ## 'id' is an integer vector indicating the monitor ID numbers
     ## to be used
     for (i in id) {
          
          #loops through the files, counting valid observations
          dat <- read.csv(files_list[i])
          num_good <- sum(complete.cases(dat))
          
          # This is easier than it seems.
          # Good way to add to a vector.
          good_obs <- c(good_obs, num_good)
          
          
     }
     # Return the results
     data.frame(id=id, nobs=good_obs)
     
     
     
}

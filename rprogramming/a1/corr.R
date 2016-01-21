corr <- function(directory, threshold = 0) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     ## 'threshold' is a numeric vector of length 1 indicating the
     ## number of completely observed observations (on all
     ## variables) required to compute the correlation between
     ## nitrate and sulfate; the default is 0
     
     ## Return a numeric vector of correlations
     ## NOTE: Do not round the result!
     
     # Create a list of all the files
     files_list <- list.files(directory, full.names = TRUE)
     
     # Create an empty data frame
     dat <- data.frame()
     
     # Create a result vector to store all the results
     correlations <- numeric()
     
     for (i in 1:332) {
          #loops through the files, rbinding them together
          #dat <- rbind(dat, read.csv(files_list[i]))
          dat <- read.csv(files_list[i])
          ngood <- sum(complete.cases(dat))
          
          # Store only the correlations for cases > threshold
          if (ngood > threshold) {
               correlations[i] <- cor(dat$nitrate, dat$sulfate, use="complete")
          }
     }
     
     # Calculate the correlation between nitrate and sulfate for all
     # valid cases.
     return(correlations)
}
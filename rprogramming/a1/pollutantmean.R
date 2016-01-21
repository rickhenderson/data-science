 pollutantmean <- function(directory, pollutant, id = 1:332) {
		## 'directory' is a character vector of length 1 indicating
		## the location of the CSV files
		
		## 'pollutant' is a character vector of length 1 indicating
		## the name of the pollutant for which we will calculate the
		## mean; either "sulfate" or "nitrate".
		
		## 'id' is an integer vector indicating the monitor ID numbers
		## to be used
		
		## Return the mean of the pollutant across all monitors list
		## in the 'id' vector (ignoring NA values)
		## NOTE: Do not round the result!
      
      # Create a list of all the files
      files_list <- list.files(directory, full.names = TRUE)
      
      # Create an empty data frame
      dat <- data.frame()
      
      for (i in id) {
           #loops through the files, rbinding them together
           dat <- rbind(dat, read.csv(files_list[i]))
      }
      
      # Subset the rows that match the specified Pollutant
     
      if (pollutant == "nitrate") {
           dat_subset <- dat$nitrate
      } else {
           dat_subset <- dat$sulfate
      }
      
      # try dat[, pollutant]
      # Calculate the median and strips out the NAs
      mean(dat_subset, na.rm=TRUE)
      
 }

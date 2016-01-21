# Weight Median function
# From https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd

weightmedian <- function(directory, day) {
     # User specifies the directory where the data is stored
     # and the day required.
     
     # Create a list of all the files
     files_list <- list.files(directory, full.names = TRUE)
     
     # Create an empty data frame
     dat <- data.frame()
     
     for (i in 1:6) {
          #loops through the files, rbinding them together
               dat <- rbind(dat, read.csv(files_list[i]))
     }
     # Subset the rows that match the specified Day
     dat_subset <- dat[which(dat[, "Day"] == day),]
     
     # Calculate the median and strips out the NAs
     median(dat_subset[, "Weight"], na.rm=TRUE)
}
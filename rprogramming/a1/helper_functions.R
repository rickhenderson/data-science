read_all_data <- function(directory){
     # Function to read all the CSV files in a director 
     # and store the data as a single data set.
     # Create a list of all the files
     files_list <- list.files(directory, full.names = TRUE)
     
     # Create an empty data frame
     dat <- data.frame()
     
     for (i in 1:20) {
          #loops through the files, rbinding them together
          dat <- rbind(dat, read.csv(files_list[i]))
     }
     return(dat)
}
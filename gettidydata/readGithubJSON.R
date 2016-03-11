# Read JSON
# Coursera Getting and Cleaning Data
# Week 2

# Code entered and modified by Rick Henderson.
# Created: March 10, 2016

# Required libraries
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

# Which repo do you want the created_at date for?
quarry_repo <- "datasharing"

# Since datasharing is the 8th repo in the list at the time of 
# this writing, the answer can be retrieved by.

result <- jsonData$created_at[8]

# But how to programmatically determine the 8? Maybe read the 
# JSON vignette when you have time.

message(paste0("The ", quarry_repo, " was created_at ", result))




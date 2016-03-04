# Week 1 Quiz
# Get Clean Data

# Modified: 20160303 - added check for data dir, added code for Windows vs. *NIX as well as 
#                      improved text output using message() and paste0()

# Download the Dataset for the Week 1 Quiz, Q1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

if (!file.exists("data")) {
     dir.create("data")
}
#download.file(fileURL, "./data/q1.csv") # For *Nix
#download.file(fileURL, ".\\data\\q1.csv") # For Windows

# Just code to make a beep when code is completed.
#install.packages("beepr")
#library(beepr)
#beep()

# Set the date the file was downloaded
#dateDownloaded <- date()
originalDate <-"Wed Mar 02 22:22:12 2016"

# Read in the file as a data frame
df <- read.csv("data/q1.csv")

# Narrow the data down to one column / variable (the VAL column for house values)
houseValues <- df$VAL

# Eliminate NA Values to store only the good data
goodHouseValues <- houseValues[!is.na(houseValues)]

# Convert the vector of integers into a data frame for subsetting
# Required to find the # of houses with VAL == 24
ans <- data.frame(goodHouseValues)

# Subset the data properly to filter just the houses with VAL == 24
allExpensiveHouses <- ans[ans$goodHouseValues == 24, ]

# Get the number of rows, but its now a vector of integers and not a frame
q1Answer <- length(allExpensiveHouses)

# Display the results
message(paste0("The file was downloaded ", originalDate, "."))
message(paste0("The number of houses in category 24 is ", q1Answer, "."))


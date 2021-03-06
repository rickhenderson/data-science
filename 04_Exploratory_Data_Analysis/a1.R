# a1.R
# Household Power Consumption (large dataset - 126MB)
# Data Source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# I have this work somewhere I just have to find it.
source = "household_power_consumption.txt"

#install.packages("data.table")
#install.packages("lubridate")
#install.packages("dplyr")

library(lubridate)   # For working with dates but might not be necessary
library(data.table)  # For using fread
library(dplyr)       # For subsetting dates

# Read the data quickly using fread
df = fread(source, na.strings = "?", verbose = FALSE)

# Subset using the specified dates
start_date = as.Date("2007-02-01")
end_date = as.Date("2007-02-02")

# Wrap the data frame as a table data frame to improve printing
df <- tbl_df(df)

# Converting date / times
# 1. Paste the date/time together
# d1 = paste(df$Date[1], df$Time[1])
# 2. Convert it using strptime
# d1 = strptime(d1, "%d/%m/%Y %H:%M:%S")

# Getting just the first date
#df$Date[1]

# Or simply converting all the dates, then do filtering
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

# R subsetting on the proper dates. Using OR, not AND.
jan2007 <- df[df$Date == as.Date("2007-01-01") | df$Date == as.Date("2007-01-02")]

# Remove the large dataset from memory
remove(df)


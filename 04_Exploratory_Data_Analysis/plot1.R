# plot1.R
# Solution to Assignment 1, Week 1 for Exploratory Data Analysis
# Author: Rick Henderson
# Household Power Consumption (large dataset - 126MB)
# Data Source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#install.packages("data.table")
library(data.table)  # For using fread

source = "household_power_consumption.txt"

# Read the data quickly using fread
df = fread(source, na.strings = "?", verbose = FALSE)

# Wrap the data frame as a table data frame to improve printing
df <- tbl_df(df)

# Or simply converting all the dates, then do filtering
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

# R subsetting on the proper dates. Using OR, not AND.
jan2007 <- df[df$Date == as.Date("2007-01-01") | df$Date == as.Date("2007-01-02")]

# Remove the large dataset from memory
remove(df)

# Possible charts
hist(jan2007$Global_active_power)


# usingDataTable.R
# Example from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

# Data table is often more efficient than data frames (written in C)
#library(data.table)  # Seems data.table is not available for R v3.2.1

df <- data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(df,3)

# See all tables are in memory
# tables()

# Once data.tables become available, just replace df with dt
dt <- df # Except this one

# Subsetting
# Show the third row of the data.table (base 0 index)
dt[2, ]

# Subsetting as a filter
# Show only the y values equal to a
dt[dt$y=="a"] # !!! SUPER IMPORTANT

# Subsetting rows is the same as for data frames
df[c(2,3), ]
# Note: df[c(2,3)] will show all the rows for columns 2 and 3
# Just as df[2] will show only column 2, df[,2] shows the column as a vector and lists levels
#dt[c(2,3), ]

# Subsetting columns is NOT the same as for data frames
# In R an expression is enclosed in curly braces.

#..

# Add columns very quickly
#dt[, w:=z^2]

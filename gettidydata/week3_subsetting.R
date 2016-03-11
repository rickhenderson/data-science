# Examples of Subsetting
# Subsetting can also include filtering.
# Mainly from Getting And Cleaning Data - Week 3
#
# Created by: Rick Henderson
# Created on: March 10, 2016

# Set a random seed for using the sample() function
set.seed(13435)

# Set up a basic data frame with random numbers
# ie. sample(1:5) is a vector of random numbers from 1:5 without replacement
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))

# Mix things up and add some NA values
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA

# Display individual columns
X[, 1]
X[,"var1"]

# Subset both row and column
# Show me rows from 1 to 2 of the var2 column
X[1:2, "var2"]

# Filtering for values to show specific cases that match a criteria
# Using AND (&)
X[(X$var1 <= 3 & X$var3 > 11),]

# Using OR (|)
X[(X$var1 <=3 | X$var3 > 15),]

# Dealing with Missing Values
# There are some NAs in rows
# USing which() will return row indicies. It does not return NAs.
X[which(X$var2 >= 8),]

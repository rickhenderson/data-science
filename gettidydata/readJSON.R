# readJSON.R
# Read JSON Data into R
# Example from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Created: 20160303
# Date Modified: 

library(jsonlite)
# fromJSON returns a Data Frame
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

# Access information about a specific array in the data frame.
names(jsonData$owner)

jsonData$owner$login

# Example of writing a data frame out as JSON data
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

# Convert JSON back to a Data frame
iris2 <- fromJSON(myjson)
head(iris2)

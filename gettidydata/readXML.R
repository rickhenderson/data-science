# Read XML Data into R
# Example from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

library(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)


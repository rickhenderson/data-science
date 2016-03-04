# Read XML Data into R
# Quiz Question from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# Check to see if the data folder exists, otherwise create it.
if (!file.exists("data")) {
     dir.create("data")
}

#download.file(fileURL, ".\\data\\baltimore_menu.xml") # For Windows
dateDownloaded <- date()
message(paste0("The file was downloaded on ", dateDownloaded, "."))

doc <- xmlTreeParse(".\\data\\baltimore_menu.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

# Get the zipcodes
allZipCodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
quarry <- allZipCodes[allZipCodes=="21213"]

# How many restaurants have zipcode 21213?
message(paste0("There were ", length(quarry), " restaurants found with zipcode = 21213."))

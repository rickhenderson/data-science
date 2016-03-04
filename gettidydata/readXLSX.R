# Read Excel Data into R
# Example from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

library(xlsx)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

# Check to see if the data folder exists, otherwise create it.
if (!file.exists("data")) {
     dir.create("data")
}

#download.file(fileURL, destfile='./data/sample.xlsx', mode='wb')
dateDownloaded <- date()
message(paste0("The file was downloaded on ", dateDownloaded, "."))

colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("data\\sample.xlsx", sheetIndex=1,
                        colIndex=colIndex, rowIndex = rowIndex)
dat

sum(dat$Zip*dat$Ext,na.rm=T)

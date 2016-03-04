# q5_dataTable.R
# Quiz question from Week 1 Slides on XML of the Data Science Course At John Hopkins
# Entered and modified by Rick Henderson
# Date Modified: 20160303

# Data table is often more efficient than data frames (written in C)
library(data.table)  # Seems data.table is not available for R v3.2.1

DT <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

# Which returns the fastest user times?
a <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
b <- mean(DT$pwgtp15,by=DT$SEX)
c <- rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
d <- tapply(DT$pwgtp15,DT$SEX,mean)
e <- DT[,mean(pwgtp15),by=SEX]
f <- sapply(split(DT$pwgtp15,DT$SEX),mean)


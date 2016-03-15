# R Functions Learned
*From Getting and Cleaning Data*

* sort()
* order() 
* arrange()
    * desc() -> ``` arrange[myData, desc(var1)] ```
* summary()
* quantile()
* table()
   * ``` table(restData$zipCode,useNA="ifany") ```
* any()
   * ``` any(is.na(restData$CouncilDistrict)) ```
* sum()
   * ``` sum(is.na(restData$CouncilDistrict)) # Yields the count of NAs in the column. ```
* all()
   * ``` all(restData$zipCode > 0) # Checks all of the zipCode values to see if they are greater than 0 ```
* colSums()
* rowSums()
* xtabs() -> **Cross Tabs**
* ftable()
* object.size(), print(object.size(myData), units="Mb")
* melt()
* dcast()
* tapply()


## Some common usages
```R
# Check for NAs in all the columns.
colSums(is.na(restData))

# Check the entire data set and verify there are no missing values.
all(colSums(is.na(restData) ==0))

# Find all the zipcodes that are in a list of zip codes.
table(restData$zipCode %in% c("21212", "21213")

# A simple query to show all the restaurants in 2 specific zipcodes (subsetting)
restData[restData$zipCode %in% c("21212", "21213"), ]

# A crosstab in R on Gender and Admittance
xt <- xtabs(Freq ~ Gender + Admit, data=df)

# Create a flat table from your cross table
ftable(xt)

# Melt then dcast the dataset, perform mean on variable.
cylData <- dcast(carMelt, cyl ~ variable, mean)

# Apply the sum function to the count column of using the spray variable.
tapply(InsectSprays$count, InsectSprays$spray, sum)

```
## Packages Used
* plyr()
* dplyr()


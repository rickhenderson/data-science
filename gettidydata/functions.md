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
* 


## Some common usages
```R
# Check for NAs in all the columns.
colSums(is.na(restData))

# Check the entire data set and verify there are no missing values.
all(colSums(is.na(restData) ==0))

```
## Packages Used
* plyr()
* dplyr()


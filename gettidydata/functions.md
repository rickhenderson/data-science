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
   * ``` any(is.na(restData$CouncilDistrict))
* sum()
   * ``` sum(is.na(restData$CouncilDistrict)) # Yields the count of NAs in the column. ```
* 


## Packages Used
* plyr()
* dplyr()


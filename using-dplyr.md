# Using `dplyr`


```R

mydf <- read.csv(thedata, stringsAsFactors=FALSE)
dim(mydf)
head(mydf)
mydata <- tbl_df(mydf)

# Try showing some data but exclude a range of columns
select(mydata, -(var4:var2))

# Show just a subset of records - filter!
filter(mydata, var1="August")

# Use commas to filter on more than 1 criteria at a time
filter(mydata, var1=="August", var3 > 1000)

# Try ?Comparison to see the binary (relational) operators that R uses.
?Comparison

# The previous example uses AND to select all the rows where both criteria are true.

# Use | as the operator for OR
filter(juiceData, country == "US" | country == "CA")

# To see how is.na() works
is.na(c(3,5,NA,10))

# Change it to those NOT NA
!is.na(c(3,5,NA,10))

# Using that to filter out the records that are NA for a specified column...showing just good records!
filter(juiceData, !is.na(country))

# Use arrange() to sort the values based on variables
arrange(mydata, var3)

# In descending order
arrange(mydata, desc(var3))

# Get crazy with it! Sort by multiple columns!
arrange(mydata, country, desc(cost), bname )

# Use mutate() to create new variables based on the one or more variable.
 mutate(filelog, size_mb = size / 2^20)

# Also able to use the new created variable to create another within the same command
newdata <-  mutate(cran3, size_mb = size / 2^20, size_gm = size_mb / 2^10)

# Using summarize() - from SWIRL: "summarize() collapses the dataset to a single row"
summarize(juiceData, avg_cost = mean(cost))

```
## Using dplyr Part 2

*TODO add some stuff from swirl lesson 2 here....including group_by()*
```R
# Investigate the use of n() and n_distinct().
data_summary <- summarize(grpd_data, count = n(), unique = n_distinct(country_id), avg_pop = mean(population))

# Need to find the top 1% of a set of values (99% quantile)
quantile(pack_sum$count, probs = 0.99)



```

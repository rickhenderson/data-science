# Subsetting Examples in R

Other sections of the __data-science__ repository contain further examples of subsetting including basic R subsetting and using the `dplyr` package.

# Dates
In many situations, the date format in the source data may not be a valid date format. R frequently uses the POSIXct date format so it is recommended that dates be in the format "YYYY-MM-DD HH:MM:SS" as much as possible, or portions of the date and time in separate columns or variables.

Here is a typical situation where Date and Time of the sensor readings were recorded as separate variables but for proper analysis could be combined:

<pre>
    Date     Time Global_active_power Global_reactive_power Voltage
       <chr>    <chr>               <dbl>                 <dbl>   <dbl>
1 16/12/2006 17:24:00               4.216                 0.418  234.84
2 16/12/2006 17:25:00               5.360                 0.436  233.63
3 16/12/2006 17:26:00               5.374                 0.498  233.29
4 16/12/2006 17:27:00               5.388                 0.502  233.74
5 16/12/2006 17:28:00               3.666                 0.528  235.68
6 16/12/2006 17:29:00    
</pre>

Here is a brief description of how this can be handled:
```R
# Converting date / times
# 1. Paste the date/time together
# d1 = paste(df$Date[1], df$Time[1])
# 2. Convert it using strptime
# d1 = strptime(d1, "%d/%m/%Y %H:%M:%S")
```

From <a href="week1.md">:

## Subsetting
Subsetting can be used to get subsets of objects in R.
- _[_ returns an object of the same class, can be used to select more than one element
- _[[_ extracts elements of a list or dataframe
- _$_ extracts elements of a list or dataframe by name
- Subsets can be created using logical index as well as numeric indexes
  - `>x[x > "a"]`
- Show only the data rows where Species column contains "virginica" *FILTERING*
  - `iris[iris$Species == "virginica", ]`
- Apply the mean to 4 of the columns in a dataset
  - `apply(iris[,1:4],2, mean)`
- Note that column names or column numbers may be used, as well as sequences (1:4) for columns 1 - 4

### Subsetting Lists
```R
- x <- list(foo = 1:4, bar = 0.6)
- x[1]  _returns a list since foo was a list_
- x[[1]] _returns just the elements_
- x$bar
- x$[["bar"]]
- x["bar"]
- name = "bar"
- x[name]
```

* First 10 elements (a subset): `x[1:10]` ' 1:10 is called an _index vector_
* There are 4 types of index vectors: logical, positive ints, negative ints, and characters.
* First 4 rows: `x[1:4, ]`
* List of only NAs: `x[is.na(x)]`
* List of NOT NAs: `x[!is.na(x)]` __SUPER IMPORTANT__
* Non-missing AND greater than 0: `x[!is.na(x) & x > 0]`
* Get 3rd, 5th, and 7th elments: `x[c(3, 5, 7)]`
* All _EXCEPT_ 2nd and 10th elements: `x[c(-2, -10)]` or `x[-c(2, 10)]`
*  

###Practical Example
Read in a file called __data.csv__ and find the average of the Ozone column.
```R
d <- read.csv(data.csv) # Uses comma separator by default. d is now a dataframe.
# Get the names of the column headings
names(d)
# Get and save number of rows and columns (good practice for later...maybe)
r = nrow(d)
c = ncol(d)
# Tip: Create a Boolean (logical) vector containing NA
my_na = is.na(d)
# Count the number of NAs by adding up the logical vectors (T=1, F=0)
totNA = sum(my_na)
# For simple vectors of data, could just store only good values.
good_d = d[!is.na(d)]

# Show Ozone rows where Ozone value is greater than 50.
d[d$Ozone > 50, ]

# Crazy Stuff
mean(d[d$Ozone > 31 & d$Temp > 90, ]$Solar.R, na.rm = TRUE)

# Calculate the mean Temperature when Month = 6 (June)
# ie. a subset of the Temp column.
mean(d$Temp[d$Month == 6])

# Max Ozone for the Month of May 
# Method: Create a subset of non-missing values for the Ozone Column, subset THAT for the Month condition, 
#         then calc the Max.
max(d$Ozone[!is.na(d$Ozone)][d$Month == 5])
# OR 
max(d$Ozone[d$Month == 5], na.rm = TRUE)

# Other useful examples
# Check to see if outcome is valid
     if (!(outcome %in% valid_outcomes)) { #or use stopifnot
          stop("invalid outcome")
     }
     
     # Subset the list to the required state (filtering, other columns are retained)
     df <- hospital_data[hospital_data$State == state, ]

```

- Double bracket [[ operator can be used with computed element names as shown above.

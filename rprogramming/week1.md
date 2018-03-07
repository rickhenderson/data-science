# R Programming Week 1

* vectors (arrays)
* lists (dictionaries)
* print(x) and auto print 

## Declaring variables
```R
x <- 3
x <- 1:10
x <- rnorm(4)
```

* Remember: Objects and Attributes. Everything in R is an object.

## Vectors and Lists

The `c()` function is used to create vectors (concatenate, create)
```R
> x <- c(0.5, 0.6)
> x <- c("a", "b", "c")
```
###Using the `vector()` function
```R
> x <- vector("numeric", length = 10)
> class(x)
> as.numeric(x)
> as.logical(x)
> as.complex(X)
```
** None of the AS() operators changes x, just displays it.
```R
> x <- list(1, "a", TRUE, 1+4i)
```

### Matricies
* Just a vector with dimensions
```R
> m <- matrix(nrow = 2, ncol = 3)
> m
> dim(m)
> attributes(m)
```
Built column wise:
```R
* > m <- 1:10
* > dim(m) <- c(2, 5)
* Converts a vector into a matrix
```

### Column Binding and Row Binding
```R
`cbind()` and `rbind()`
>x <- 1:3
>y <- 10:12
>cbind(x, y) (see the results)
>rbind(x,y) (see different results)
```

## Factors
* Used for categorical data. Thought of as a vector of integers where each integer has a label.
* x <- factor(c("yes", "yes", "no", "yes", "no")
* table(x)
* unclass(x)
** The factors can be ordered using the `levels` argument
* x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
* x
*** This is important in linear modelling

## Missing Values
* Uses NA or NaN
* is.na() or is.nan()
* NA values have a class, but NaN does not.

## Data Frames

A Data Frame is a key __data type__ in R used to store tabular data.

Creating a Frame
* `x <- data.frame(foo = 1:4, bar = c(T, T, F, F))`
* `nrow(x)` and `ncol(x)` return number of rows and columns

Try: `x <- data.frame(Case = 1:5, Height = c(180.00, 150.2, 101.3, 53.5, 18.2))`

## Names 

Objects and elements of objects can have names.
```R
x <- 1:3
names(x) <- c("foo", "bar", "norf")
x
names(x)
```

* `x <- list(a=1, b=2, c=3)`

* `m <- matrix(1:4, nrow=2, ncol=2)`
* `dimnames(m) <- list(c("a", "b"), c("c", "d"))`
* `m`

Names can be useful for creating _self-describing_ data.

## Reading Files
There are a number of functions used to read data from files and techniques to handle very large 
files. Be sure to calculate the amount of RAM required to read in the datafile and check that your 
computer has at least DOUBLE that amount before starting.
- See other list of functions or make more notes later. -rh-

## Subsetting
Subsetting can be used to get subsets of objects in R.
* \[ returns an object of the same class, can be used to select more than one element
* \[\[ extracts elements of a list or dataframe
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

### Practical Example
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

* Double bracket \[\[ operator can be used with computed element names as shown above.

### Subsetting Matricies

### Partial Matches
Subsetting with partial matches can save a lot of typing. Works with **\[\[** and **$**.
* `x <- list(aardvark = 1:5)`
* `x$a`


### Removing Missing Values
Technique: Create a logical `vector` which tells you where the NAs are.
```R
- x <- c(1, 2, NA, 4, NA, 5)
- bad <- is.NA(x)
- x[!bad]        _' Returns only the good data!_
```

Show only the rows that have complete cases, ie. no missing values
```R
- good <- complete.cases(airquality)
- airquality[good, ][1:6, ]
```

### Vectorized Operations
Makes code more concise, efficient, and easier to read. Reduces the need for loops.

#R Programming
#Week 1

* vectors (arrays)
* lists (dictionaries)
* print(x) and auto print 

##Declaring variables
`
x <- 3
x <- 1:10
x <- rnorm(4)
`

* Remember: Objects and Attributes. Everything in R is an object.

## Vectors and Lists

The `c()` function is used to create vectors (concatenate, create)
`
> x <- c(0.5, 0.6)
> x <- c("a", "b", "c")
`
###Using the `vector()` function
`
> x <- vector("numeric", length = 10)
> class(x)
> as.numeric(x)
> as.logical(x)
> as.complex(X)
`
** None of the AS() operators changes x, just displays it.
`
> x <- list(1, "a", TRUE, 1+4i)
`
###Matricies
* Just a vector with dimensions
> m <- matrix(nrow = 2, ncol = 3)
> m
> dim(m)
> attributes(m)

Built column wise:
* > m <- 1:10

> dim(m) <- c(2, 5)
* Converts a vector into a matrix

### Column Binding and Row Binding
`cbind()` and `rbind()`
>x <- 1:3
>y <- 10:12
>cbind(x, y) (see the results)
>rbind(x,y) (see different results)

##Factors
* Used for categorical data. Thought of as a vector of integers where each integer has a label.
* x <- factor(c("yes", "yes", "no", "yes", "no")
* table(x)
* unclass(x)
** The factors can be ordered using the `levels` argument
* x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
* x
*** This is important in linear modelling

##Missing Values
* Uses NA or NaN
* is.na() or is.nan()
* NA values have a class, but NaN does not.

##Data Frames

A Data Frame is a key __data type__ in R used to store tabular data.

* Creating a Frame
* `x <- data.frame(foo = 1:4, bar = c(T, T, F, F))`
* `nrow(x)` and `ncol(x)` return number of rows and columns

Try: x <- data.frame(Case = 1:5, Height = c(180.00, 150.2, 101.3, 53.5, 18.2))

## Names 
Objects and elements of objects can have names.
* `x <- 1:3`
* `names(x) <- c("foo", "bar", "norf")`
* `x`
* `names(x)`

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
- _[_ returns an object of the same class, can be used to select more than one element
- _[[_ extracts elements of a list or dataframe
- _$_ extracts elements of a list or dataframe by name
- Subsets can be created using logical index as well as numeric indexes
- `>x[x > "a"]`

### Subsetting Lists
- x <- list(foo = 1:4, bar = 0.6)
- x[1]  _returns a list since foo was a list_
- x[[1]] _returns just the elements_
- x$bar
- x$[["bar"]]
- x["bar"]
- name = "bar"
-- x[name]

* First 10 elements (a subset): `x[1:10]`
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

# Show Ozone rows where Ozone value is greater than 50.
d[d$Ozone > 50, ]

```

- Double bracket [[ operator can be used with computed element names as shown above.

### Subsetting Matricies

### Partial Matches
Subsetting with partial matches can save a lot of typing. Works with **[[** and **$**.
- `x <- list(aardvark = 1:5)`
- `x$a`


### Removing Missing Values
Technique: Create a logical `vector` which tells you where the NAs are.
- x <- c(1, 2, NA, 4, NA, 5)
- bad <- is.NA(x)
- x[!bad]        _' Returns only the good data!_

Show only the rows that have complete cases, ie. no missing values
- good <- complete.cases(airquality)
- airquality[good, ][1:6, ]

### Vectorized Operations
Makes code more concise, efficient, and easier to read. Reduces the need for loops.

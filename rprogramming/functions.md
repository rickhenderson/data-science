#R Programming Function List

- vector()
- list()
- c()
- cbind()
- rbind()
- matrix()
- attributes()
- args()
- ?list.files
- dim()
- rnorm()
- runif(4)
  - Creates 4 random uniform variables.
- lm()
- glm()
- gl()
  - gl(3, 10)  # Creates 3 groups of 10 elements and numbers them.
- split()
- interaction(f1, f2)
- factor()
- table()
- unclass()
- is.na()
- is.nan()
- read.table(file, header, sep, [colClasses], [nrows], [comment.char], [skip], [stringsAsFactors])
  - Space separated by default.
- read.csv()  
  - Comma separated by default. Header is always true.
- data.matrix()
- data.frame()
- nrow()
- ncol()
- names()
- sqrt()
- abs()
- head(data,row)
- tail(data,row)
- colnames(my_frame)
- readLines()
- source()
- dget()
- load()
- invisible(_[return value]_)
- write.table()
- writeLines()
- dump
- dput(_dataframe_, _file="_dataframe.R_")
- sapply(file, class)
- lapply(df, function
- save
- identical()
- rep(NA, 1000)
- sd(mydata, na.rm=TRUE)
- args()
- lm()
- ls(environment(function))
- get("n", environment(cube))
- formals()
- cat()
- paste("a", "b", sep = ":")
- as.Date("1970-01-01")
- unclass()
- weekdays()
- months()
- quarterS()
- as.POSIXlt()
- as.POSIXct()
- Sys.time()
- strptime()
- length()
- tolower()
- toupper()
- strsplit()
- sub()    # Only applies one replacement.
- gsub()   # Apply character replacement to all occurrences.
- grep()
- grepl()  # Use with table(grepl(...)) for displaying vector
- dist(df) # Generate distances for clustering
```R
# Search for a value in a variable:
```
- length(grep("RickStreet", mapdata$intersection))
```R
library(stringr)
```
- nchar("RickHenderson")
- substr("Rick Henderson", 1, 4)
- paste()
- paste0()
- str_trim()

###Reading Files
```R
- file()
- url()
- gzfile()
- bzfile()
- download.file(dataset_url, "datafile.zip")
- unzip("datafile.zip", exdir="data")
- list.files("data")
- str(andy)
- summary(andy)
- names(andy)
- which(andy$Day == 30)
- subset(andy$Weight, andy$Day==30)
- unique(my_vector)
- df[, pollutant]
```

###Subsetting Lists
```R
* x <- list(foo = 1:4, bar = 0.6)
* x[1]        # returns a list since foo was a list
* x[[1]]      # returns just the elements
* x$bar
* x$[["bar"]]
* x["bar"]
* name = "bar"
* x[name]
```

Use Which: 
```R
day_25 <- df[which(df$Day == 25), ]
```

### Removing NA Values

Show only the rows that have complete cases, ie. no missing values
```R
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
```

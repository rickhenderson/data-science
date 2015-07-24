#R Programming Function List

- vector()
- list()
- c()
cbind()
rbind()
matrix()
attributes()
args()
?list.files
dim()
rnorm()
runif(4) - creates 4 random uniform variables
lm()
glm()
gl() - gl(3, 10) creates 3 groups of 10 elements and numbers them.
- interaction(f1, f2)
factor()
table()
unclass()
is.na()
is.nan()
-read.table(file, header, sep, [colClasses], [nrows], [comment.char], [skip], [stringsAsFactors])
--Space separated by default.
-read.csv()  
--Comma separated by default. Header is always true.
data.matrix()
data.frame()
nrow()
ncol()
names()
sqrt()
abs()
head(data,row)
tail(data,row)
colnames(my_frame)
readLines()
source()
dget()
load()
write.table()
writeLines()
dump
dput(_dataframe_, _file="_dataframe.R_")
sapply(file, class)
lapply(df, function
save
identical()
rep(NA, 1000)
sd(mydata, na.rm=TRUE)
args()
lm()
ls(environment(function))
get("n", environment(cube))
formals()
cat()
paste("a", "b", sep = ":")
as.Date("1970-01-01")
unclass()
weekdays()
months()
quarterS()
as.POSIXlt()
as.POSIXct()
Sys.time()
strptime()
lenght()

###Reading Files
file()
url()
gzfile()
bzfile()
download.file(dataset_url, "datafile.zip")
unzip("datafile.zip", exdir="data")
list.files("data")
str(andy)
summary(andy)
names(andy)
which(andy$Day == 30)
subset(andy$Weight, andy$Day==30)
unique(my_vector)
df[, pollutant]


###Subsetting Lists
-x <- list(foo = 1:4, bar = 0.6)
-x[1]  _returns a list since foo was a list_
-x[[1]] _returns just the elements_
-x$bar
-x$[["bar"]]
-Use Which: day_25 <- df[which(df$Day == 25), ]

-x["bar"]
-name = "bar"
--x[name]

### Removing NA Values
Show only the rows that have complete cases, ie. no missing values
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

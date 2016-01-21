add2 <- function(x,y) {
  x + y
}

# Just trying... print values that are above 10. Works!
print_above10 <- function(v) {
  for (i in seq_along(v))
    if (v[i] > 10) {
      print(v[i])
    } 
}

# Return a LOGICAL vector subset of the values above 10
above10 <- function(v) {
  use <- x > 10
  x[use] # Subsetting the vector on the condition
}

# Variable n with default value
above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

# Calculate the mean of every column in a vector or matrix
columnmean <- function(x, removeNA = TRUE) {
  numCol = ncol(x)
  means = numeric(numCol)
  for (i in 1:numCol) {
    means[i] <- mean(x[,i], na.rm = removeNA)
  }
  means
}
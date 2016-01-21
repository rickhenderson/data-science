## cachematrix.R stores functions that will solve the inverse 
## of a function, but will store the matrix in the cache
## and check to see if the matrix exists in the cache
## before time-consuming calculations are made on it.
## Code by Rick Henderson
## Created on July 21, 2015 for Coursera course in R Programming.

## Create a Matrix and store its *inverse* in the cache
# Sample matrix: 
# x <- matrix(c(4,3, 3,2), nrow = 2, ncol = 2, byrow = TRUE)

makeCacheMatrix <- function(x = matrix()) {
     # Create a blank object for the calculated inverse
     i <- NULL
     
     # Set the matrix and store it and its inverse in the cache (in a different environment)
     set <- function(y) {
          x <<- y
          i <<- NULL
     }
     
     # A function to GET the matrix created by makeCacheMatrix()
     get <- function() x
     
     # Set the mean of the matrix
     setinverse <- function(solve) i <<- solve
     
     # Get the mean of the matrix
     getinverse <- function() i
     
     # The "matrix" list of functions
     list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
     
}


## Return the inverse matrix of 'x' but check to see
## if it is in the cache first.

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     
     # Get the inverse from the cache
     i <- x$getinverse()
     
     # If i isn't NULL, then it was in the cache.
     if(!is.null(i)) {
          message("Retrieving cached data...")
          
          # Return i from the cache, since this will be faster.
          return(i)
     }
     
     # i was NULL, so must calculate the inverse
     # because it wasn't already stored in the cache.

     # Get the original matrix created by makeCacheMatrix
     data <- x$get()
     
     # Calculte the inverse
     i <- solve(data)
     
     # Set the inverse of the matrix and store it in the 'cache'.
     x$setinverse(i)

     
}


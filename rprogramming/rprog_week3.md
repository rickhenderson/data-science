# Week 3 R Programming
## Looping using *apply

###lapply()
`lapply()` takes an object and a function as arguments, and evaluates the function on every element in the object.
The `lapply()` function __always__ returns a list.

Example:
```R
  > x <- list(a = 1:5, b = rnorm(10))
  > lapply(x, mean)
```
The results of the above code will also be a list, of the mean of all the values of __a__ and all the values in __b__.
($a = 3, $b = 0.0296)

Another good example, try and determine the output:
```R
  > x <- 1:4
  > lapply(x, runif) # runif(n) returns n uniform random variables
  > lapply(x, runif, min = 0, max = 10)
```
*Note: When using apply() functions, the function you are applying should never have parentheses.*

### Anonymous Functions
Anonymous functions are functions that don't have names, and are usually written on the spot when the thing you want to do doesn't already exist in another function. The function is only available within the context of the `lapply()` function and doesn't exist afterwards.

```R
  # Return the first element of a matrix.
  # x contains two matricies, a and b.
  > lapply(x, function(elt) elt[,1])
```
### sapply()
`sapply()` is the same as `lapply()` except it tries to simplify the results. Where possible, __lists__ become __vectors__, __vectors__ where the size of each element is > 1 becomes a __matrix__ and if nothing else can be done, it will just return a __list__.
 - Good details in the __swirl__ tutorials.

### apply()
Functions `rowMeans()`, `rowSums()`, `colMeans()`, and `colSums()` are optomized versions of the `apply()` function for those special cases.
 - Look into this more and examine the quartile example.

### mapply()
`mapply()` is a multivariate version of apply that applies functions in parallel to **multiple** objects (the arguments).
Use `str(mapply)` to see how it can be used.
**Silly Examples:** `mapply(rep, 1:4, 4:1)`

### Vectorizing A Function
As an example, we'll create a function to generate random noise.
```R
  noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
  }
  
  > noise(5, 1, 2)
  ...
  > noise(1:5, 1:5, 2) # Doesn't work, need to vectorize the noise function.
```
Using `mapply()` gives us instant vectorization.
`> mapply(noise, 1:5, 1:5, 2) # gives 5 arguments for n, and 5 for mean, but always same sd.`

### tapply()
`tapply()` is used to apply a function over subsets of a vector.
Example: If all my punch data was in a vector, and Left or Right arm was a factor, then I could use `tapply()` to calculate mean etc. of each hand as a group, at once.
```R
  x <- c(24,23,30, 34,33,34)
  f <- gl(2, 3)
  # f = 1 1 1 2 2 2 
  tapply(x, f, mean) # Calculates the mean of the two groups.
  # Result:
  1             2
  25.6667   33.6667
```
```R
> tapply(x, f, range)
# Returns a list of the min and max (returns 2 numbers) for each of the factor groups in x.
```

## Other Loops
Not covered in the course but probably you'll probably try to use them:
```R
 if (outcome == "heart attack") {
          reqrd_col = 11
     } else if (outcome == "heart failure") {
          reqrd_col = 17
     } else if (outcome == "pneumonia") {
          reqrd_col = 23
     }
```
Can also use the `switch()` function.


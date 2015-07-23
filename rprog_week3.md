#Week 3 R Programming
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
  > noise(1:5, 1:5, 2)
```





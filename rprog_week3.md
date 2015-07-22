#Week 3 R Programming
## Looping using *apply

###lapply()
`lapply()` takes an object and a function as arguments, and evaluates the function on every element in the object.
The `lapply()` function __always__ returns a list.

Example:
```R
  x <- list(a = 1:5, b = rnorm(10))
  lapply(x, mean)
```
The results of the above code will also be a list, of the mean of all the values of __a__ and all the values in __b__.
($a = 3, $b = 0.0296)


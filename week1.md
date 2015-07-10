#R Programming
#Week 1

* vectors (arrays)
* lists (dictionaries)
* print(x) and auto print 

##Declaring variables

*x <- 3
*x <- 1:10
*x <- rnorm(4)

* Remember: Objects and Attributes. Everything in R is an object.

## Vectors and Lists
The `c()` function is used to create vectors (concatenate, create)
`
*> x <- c(0.5, 0.6)
*> x <- c("a", "b", "c")
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
*`cbind()` and `rbind()`
*>x <- 1:3
*>y <- 10:12
*>cbind(x, y) (see the results)
*>rbind(x,y) (see different results)

##Factors
* Used for categorical data. Thought of as a vector of integers where each integer has a label.
* x <- factor(c("yes", "yes", "no", "yes", "no"))
* table(x)
* unclass(x)
** The factors can be ordered using the `levels` argument
* x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
* x
** This is important in linear modelling

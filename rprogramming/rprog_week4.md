# Week 4

## The STR function
The `str()` function is "used to compactly display the internal structure of an R object." (Peng) An alternative to `summary()`.
ie. large nested lists, "What's in this object?", "The most useful function in all of R."

Create a factor for Male and Female gender levels:
```R
gender <- gl(2, 1, labels=c("Female", "Male"))
gender
summary(gender)
str(gender)
```

## Simulation
Use functions such as `rnorm(), dnorm(), pnorm(), or rpois()` to generate random numbers.
```R
# Random numbers based on Fall 2014 final exam marks: m=92, sd=16
finals <- rnorm(100, 92, 16)
```

Probability distributions have a group of 4 functions associated with them:
- __d__ for density
- __r__ for random number generation
- __p__ for cumulative distribution
- __q__ for quantile function

__Note: Always use the `seed()` function when performing simulations so you can reproduce your results!__

```R
set.seed(1)
```
The cumulative functions allows you to calculate the probability of values occuring.
`rpois(2, 2)` shows the probability of a random Poisson variable being >= 2, where the second argument is _lambda_ or the rate.

## Simulating a Linear Model

y = B + kx + e, B = 0.5, k = 2

```R
set.seed(20)
x <- rnorm(100) # or x <- rbinom(100, 1, 0.5) for treated vs. control, or male vs. female
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)
```

## Random Sampling
`sample()` to draw randomly from a set of objects (in a vector).
```R
set.seed(1)
sample(1:10, 4)   # without replacement
sample(letters, 5) # without replacement
sample(1:10) # a random permutation
sample(1:10, replace = TRUE) ## Sample with replacement
# Roll a 6-sided die 100 times
rolls <- sample(1:6, 100, replace=TRUE)
hist(rolls)


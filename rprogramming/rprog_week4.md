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




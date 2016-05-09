# Plotting In R

## The Base Plotting Method

```R
# Make an x,y scatterplot
x <- rnorm(10)
y <- rnorm(10)

plot(x, y)
# Then make annotations. Plot function also has other arguments.

# Use type="n" to set the plot pallette but don't plot any lines.
# Use lines(x,y) to plot lines.

plot(x, y, type="n")

# Add a series of data as lines
lines(x,y)

```


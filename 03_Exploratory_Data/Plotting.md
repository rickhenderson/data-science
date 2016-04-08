# Plotting
There are 3 different plotting systems in R:
* The Base system
  * Uses an artists blank pallete with the `plot` function and builds up from there.
  * Uses `text, lines, points`, and `axis` as annotation functions.
  * Generate, then Annotate.
* Lattice
* 
* ggplot2

# Base Plotting Examples
```R
library(datasets)
data(cars)
with(cars, plot(speed, dist, main="Stopping Distance of cars c. 1920"))
```

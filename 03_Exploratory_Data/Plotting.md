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
with(cars, plot(speed, dist, main="Stopping Distance of Cars c. 1920"))
```
[[http://i.imgur.com/GYsDSwM.png]]

# Lattice Plotting Examples
* Uses a different approach - plots are created with a single function call such as `xyplot`, `bwplot`, etc.
* Good for putting many plots on screen at once.
* Good for seeing how many variables change in relation to each other. "...conditioning plots... Looking at how y changes with x across levels of z"
* Margins and spacing taken care of automatically.
* Also called panel plots, and allows multiple variables.
* Need to specify a lot of information in each function call.
* 

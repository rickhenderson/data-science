# Plotting
There are 3 different plotting systems in R:
* The Base system
  * Uses an artist's blank pallete with the `plot` function and builds up from there.
  * Uses `text, lines, points`, and `axis` as annotation functions.
  * Generate, then Annotate.
* Lattice
  * Uses a different approach - plots are created with a single function call such as `xyplot`, `bwplot`, etc.
  * Good for putting many plots on screen at once.
  * Good for seeing how many variables change in relation to each other. "...conditioning plots... Looking at how y changes with x across levels of z"
  * Margins and spacing taken care of automatically.
  * Also called panel plots, and allows multiple variables.
  * Need to specify a lot of information in each function call.
  * Annotating is not as intuitive, and you can't add to the plot once it's completed. You need to change the function call.
* ggplot2
  * Based on the **Grammar of Graphics** - _"a well grounded, rigorous theory"_.
  * Combines best of both worlds.
  * Good defaults but easily customizable.

# Base Plotting Examples
```R
library(datasets)
data(cars)
with(cars, plot(speed, dist, main="Stopping Distance of Cars c. 1920"))
```
<img src="http://i.imgur.com/GYsDSwM.png">

[http://i.imgur.com/GYsDSwM.png]

# Lattice Plotting Examples

```R
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))
```
<img src="http://i.imgur.com/vkFaGA7.png">

[http://i.imgur.com/vkFaGA7.png]

# ggplot2 Plotting Examples

```R
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
```

<img src="http://i.imgur.com/cdayeoR.png">
[http://i.imgur.com/cdayeoR.png]

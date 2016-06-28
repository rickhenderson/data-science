# Plot Colors
Source: <a href="https://www.coursera.org/learn/exploratory-data-analysis/home/week/3">Exploratory Data Analysis Week 3</a>

* colors() - returns a list of the colour names that are available
* colorRamp() - returns a list of values in [0, 1] that __interpolate___ between a set of colors
* colorRampPalette() - returns a list of colors in Hex format
```R
> pal <- colorRamp(c("red", "blue"))
> pal(0)
     [,1] [,2] [,3]
[1,]  255    0    0
> pal(1)
     [,1] [,2] [,3]
[1,]    0    0  255
> pal(0.5)
      [,1] [,2]  [,3]
[1,] 127.5    0 127.5
> gray(1)
[1] "#FFFFFF"
> gray(0.5)
[1] "#808080"
```

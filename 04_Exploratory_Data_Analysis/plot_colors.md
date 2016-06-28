# Plot Colors

* colors() - returns a list of the colour names that are available
* colorRamp() - returns a list of values in [0, 1] that __interpolate___ between a set of colors
```R
> pal <- colorRamp(c("red", "blue"))
> pal(0)
     [,1] [,2] [,3]
[1,]  255    0    0
> pal(1)
     [,1] [,2] [,3]
[1,]    0    0  255
```

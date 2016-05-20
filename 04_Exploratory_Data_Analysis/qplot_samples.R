# ggplot2 Examples from Swirl
# Exploratory Data Analysis - ggplot2
#

library(ggplot2)

# A variety of plots based on the mpg data from ggplot2.

message("Generating scatterplots...")
# Scatterplots
qplot(displ, hwy, data=mpg)
qplot(displ, hwy, data=mpg, color=drv)
qplot(displ, hwy, data=mpg, color=drv, geom=c("point", "smooth"))
qplot(y=hwy, data=mpg, color=drv)

# Boxplots
message("Generating boxplots...")
qplot(drv, hwy, data=mpg, geom="boxplot")
qplot(drv, hwy, data=mpg, geom="boxplot", color=manufacturer)

# Histograms
message("Generating Histograms...")
qplot(hwy, data=mpg, fill=drv)
qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)

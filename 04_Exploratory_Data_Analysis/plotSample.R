# plotSample.R
# Examples of the Base Plotting System
# Created by Rick Henderson
# Created on April 11, 2016

# Generate some Random data
x <- rnorm(100)
y <- rnorm(100, mean = 5)


# Generate a simple scatterplot
plot(x, y, pch = 19, col = "SteelBlue")

# Generate regression line (linear model)
model <- lm(y ~x)

# Use abline to display the line on the chart
abline(model)

# Add annotations
legend("topleft", legend = "Data", pch = 19, col = "SteelBlue")
title("Random Scatterplot")

# This line needs to be modified if you are using random numbers
#text(-3, 2, "Simple Label")

# Another set of samples
s1 <- rnorm(100)
s2 <- s1 + rnorm(100)
g <- gl(2, 50, labels = c("Male", "Female"))

# Set up the plot area but don't plot anything
plot(s1, s2, type="n", xlab = "Weight", ylab = "Height")
points(s1[g == "Male"], s2[g == "Male"], col = "blue", pch = 21)
points(s1[g == "Female"], s2[g == "Female"], col = "red", pch = 16)
legend("topleft", legend = c("Male", "Female"), col = c("blue", "red"), pch = c(21, 16))
title("Random Scatterplot")

# Generate regression line (linear model)
model <- lm(s2 ~ s1)

# Use abline to display the line on the chart with more features
abline(model, lwd = 2, col = "green")

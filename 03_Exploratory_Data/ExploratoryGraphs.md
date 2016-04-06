# Exploratory Graphs

## Why graphs?
To find patterns, understand the data, suggest modelling properties, debug the analyses, but not really communicate results, yet.
## Characteristics of Exploratory Graphs
* Quick
* Create many
* Don't worry about axes and legends or colour, until later
* Goal is _personal_ understanding

*Main Point: You should always have a question in mind: "Are there any counties in the U.S. that exceed that national standard for fine particle pollution?"*

## Types of Exploratory Graphs

* Five Number Summary
```R
summary(pollution$ppm25)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    3.38    8.55   10.00    9.84   11.40   18.40
```
* Boxplot
```R
boxplot(pollution$ppm2, col = "blue")
```

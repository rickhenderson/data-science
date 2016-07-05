# Functions from Exploratory Data Analysis

* rdistxy <- dist(df) - Generate distances for clustering
* hc <- hclust(rdistxy) - Generate a dendrogram from a distance matrix.
  * plot(hc) - Show the dendrogram
  * abline(h=0.5, col="red") to cut the dendrogram, then count the clusters intersected by the line
* heatmap(df)


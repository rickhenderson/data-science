# Clustering

## Hierarchical Clustering
* needs a concept of distance or similarity / correlation
* distance
  * Euclidan distance
  * Manhattan distance
  * use the `dist(df)` function to create distances between points
* _cutting_ a dendrogram can be accomplished by using abline at a value you want to cut the dendrogram
* measuring the distance between _pairs of clusters_ can be done using:
 *__complete linkage__ - the greatest distance between the pairs of points in those two clusters
 *__average linkage__ - first compute the "average" point in each cluster, then calculate the interclustular distance

* it can be useful to check out both linkage calculations to see which works best for your purpose
* Tutorial on heatmaps:  http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering
* 

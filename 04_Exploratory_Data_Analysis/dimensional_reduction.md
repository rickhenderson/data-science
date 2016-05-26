# Dimensional Reduction

* SVD
* PCA - Principle Component Analysis

The use of __SVD__ for _singular value decomposition_ can find the groups in the data set automatically, a type of __un-supervised learning__.

* proportion of variance explained - slide 11
* the first singular value, captures the shift in the mean
  * almost 40% of the variation in your data can be explained by a single dimension
* SVD and PCA essentially calculating the same thing
* SVD essentially picks up patterns out of the data, the "truth" since not all the data points add to the pattern.

   "Singular value decomposition (SVD) can be looked at from three mutually compatible points
of view. On the one hand, we can see it as a method for transforming correlated variables
into a set of uncorrelated ones that better expose the various relationships among the original
data items. At the same time, SVD is a method for identifying and ordering the dimensions
along which data points exhibit the most variation. This ties in to the third way of viewing
SVD, which is that once we have identi ed where the most variation is, it's possible to  nd
the best approximation of the original data points using fewer dimensions. Hence, SVD can
be seen as a method for data reduction." - from [Single Value Decomposition Tutorial](https://www.ling.ohio-state.edu/~kbaker/pubs/Singular_Value_Decomposition_Tutorial.pdf) by **Kirk Baker**


#kmeans.R
# Source:
# https://github.com/DataScienceSpecialization/courses/blob/master/04_ExploratoryAnalysis/kmeansClustering/index.Rmd

# Sample code from K-Means Clustering Lectures

# Lecture 1
set.seed(1234)
par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))

# Starting centroids
par(mar=rep(0.2,4))
plot(x,y,col="blue",pch=19,cex=2)
cols1 <- c("red","orange","purple")
text(x+0.05,y+0.05,labels=as.character(1:12))


cx <- c(1,1.8,2.5)
cy <- c(2,1,1.5)

## Find the closest centroid
distTmp <- matrix(NA,nrow=3,ncol=12)
distTmp[1,] <- (x-cx[1])^2 + (y-cy[1])^2
distTmp[2,] <- (x-cx[2])^2 + (y-cy[2])^2
distTmp[3,] <- (x-cx[3])^2 + (y-cy[3])^2
newClust <- apply(distTmp,2,which.min)
newCx <- tapply(x,newClust,mean)
newCy <- tapply(y,newClust,mean)

## Iteration 2
distTmp <- matrix(NA,nrow=3,ncol=12)
distTmp[1,] <- (x-newCx[1])^2 + (y-newCy[1])^2
distTmp[2,] <- (x-newCx[2])^2 + (y-newCy[2])^2
distTmp[3,] <- (x-newCx[3])^2 + (y-newCy[3])^2
finalClust <- apply(distTmp,2,which.min)

## Final centroids
finalCx <- tapply(x,finalClust,mean)
finalCy <- tapply(y,finalClust,mean)
points(finalCx,finalCy,col=cols1,pch=3,cex=2,lwd=2)

points(x,y,pch=19,cex=2,col=cols1[finalClust])


dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)

# Show the objects inside the kmeans object
names(kmeansObj)

# Look at a specific one

# Show which cluster each data point belongs to
kmeansObj$cluster

# Plot the clusters
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)

# Add the centers
points(kmeansObj$centers, col=1:3, pch=3, cex = 3, lwd = 3)

# Try Heatmaps

# Keep this repeatable
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")



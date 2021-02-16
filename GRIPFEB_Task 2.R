##Loading the libraries
library(ggplot2)
library(readr)

#Loading the dataset
d <- data(iris)

head(iris)
tail(iris)
str(iris)
summary(iris)

str(iris$Species)
summary(iris$Species)

dim(iris)

##Trial and error using preferred K-Means or number of Clusters
data <- iris[,1:4]
str(data)
names(data)
summary(data)
dim(data)
data.entry(plot(data, main = "The length and width of Sepal and Petal", pch = 20, cex = 2))

##Performing K Means with 2 clusters
km1 = kmeans(data, 2, nstart=100)
plot(data, col = (km1$cluster +1), main = "K-Means result with 2 clusters", pch = 20, cex = 2)

##Performing K-Means with 3 clusters 
km2 = kmeans(data, 3, nstart=100)
plot(data, col = (km2$cluster +1), main = "K-Means result with 3 clusters", pch = 20, cex = 2)

##To identify the optimal number of clusters, Elbow method is used and it involves observing a set of possible 
##numbers of clusters relative to how they they minimise the within-cluster sum of square
tot_wss <- c()
for (i in 1:15)
{
  cl <- kmeans(data, centers=i)
  tot_wss[i] <- cl$tot.withinss
}

plot(x=1:15,
     y=tot_wss,
     type="b",
     xlab="Number of clusters",
     ylab="Within groups sum of squares")

##From this plot we can say that after 2 clusters the observed difference in the within-cluster dissimilarity is not  substantial.
##Therefore we can say that the optimal number of clusters to be used is 2.

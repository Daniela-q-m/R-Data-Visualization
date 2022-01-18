library(ISLR)

print(head(iris))

#scale data, normalize, check variance

stand.features<-scale(iris[1:4])
print(var(stand.features[,1]))

#Join label with new standarized dataframe
final.data<-cbind(stand.features, iris[5])

#Train, test, splits

set.seed
install.packages('caTools')
library(caTools)

#Pass in column that we are trying to predict
#70% of data will be 70=true 
sample<-sample.split(final.data$Species, SplitRatio=0.7)


train<-subset<- subset(final.data, sample==T)
test<-subset<- subset(final.data, sample==F)

#K nearest neighbors

library(class)

#Make a variable to call knn function and pass in training, test, label of training data and desired k value

predict.species<-knn(train[1:4],test[1:4],train$Species,k=1)

print(predict.species)

#See misclassification rate

print(mean(test$Species!= predict.species)) #Misclassification rate is 4.4%

#Choose a k value, plot out k values
#Elbow method

predict.species<-NULL
error.rate<-NULL

for (i in 1:10){
  
  set.seed(101)
  predict.species<-knn(train[1:4],test[1:4],train$Species, k=i)
  error.rate[i]<-mean(test$Species!=predict.species)
}

library(ggplot2)
k.values<-1:10
error.df<-data.frame(error.rate, k.values)

pl<-ggplot(error.df, aes(x=k.values, y=error.rate))+geom_point()
pl<-pl+geom_line(lty='dotted', color='red')
print #Range of error rate is small, optimal k value loooks to be somewhere between 2 and 6.




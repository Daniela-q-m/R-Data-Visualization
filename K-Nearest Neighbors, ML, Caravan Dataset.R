#K nearest neighbors classification algorithm
#Training algorithm, store all the data
#Prediction Algorithm 
#1. Calculate distance from x to all points in your data
#2. Sorth the points in your data by increasing distance from x
#3. Predict the majority label of the 'k' closest points

install.packages('ISLR')
library(ISLR)
str(Caravan)
#6000 observations of 86 variables
#Final purchase variables, Yes or no. 
#Customer data measured accross 85 predictors of demographic
summary(Caravan$Purchase)
any(is.na(Caravan))
#no need to clean data
#Check variance of first feature, scales are different for each variable
var(Caravan[,1])
var(Caravan[,2])

#Extract purchase data, last row
purchase<-Caravan[,86]
#Standarize dataset
standarized.Caravan<-scale(Caravan[,-86])
#Print first and second column to check same scales
print(var(standarized.Caravan[,1]))
print(var(standarized.Caravan[,2]))

#Train test split
#Get first 1000 rows to test set
test.index<-1:1000
test.data<-standarized.Caravan[test.index,]
test.purchase<-purchase[test.index]

#Train
#Grab everything that is not in test index
train.data<-standarized.Caravan[-test.index,]
train.purchase<-purchase[-test.index]

#Use KNN Algorithm
#Model to predict whether insurance policy will be predicted or not
#class library contains KNN function
#seed to 101
library(class)
set.seed(101)
#order: Train data, test data, labels for train data, knn
predicted.purchase<-knn(train.data, test.data,train.purchase, k=1)
print(head(predicted.purchase))

#Evaluate the model by looking at error rate
misclass.error<-mean(test.purchase!=predicted.purchase)
print(misclass.error)

#Elbow method, when to stop when increasing k value?
#Define empty vectors 
predicted.purchase<-NULL
error.rate<-NULL

for (i in 1:20){
  set.seed(101)
  predicted.purchase<-knn(train.data, test.data,train.purchase, k=i)
  error.rate[i]<-mean(test.purchase!=predicted.purchase)
  }
print(error.rate)

#Visualize Elow method w/ ggplo2
#Based on graph, k does not significantly improve after k=9
library(ggplot2)
k.values<-1:20
error.df<-data.frame(error.rate,k.values)
ggplot(error.df,aes(k.values,error.rate))+geom_point(color='purple')+geom_line(color='pink')


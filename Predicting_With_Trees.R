
library(caret)
inTrain<-createDataPartition(y=iris$Spec, p = 0.7,list=FALSE)
training<-iris[inTrain,]
testing<-iris[-inTrain,]


qplot(Petal.Width, Sepal.Width,colour=Species, data=training)

library(caret)
modFit<-train(Species ~ .,method="rpart",data=training)
print(modFit$finalModel)


plot(modFit$finalModel, uniform=TRUE,main="Classification Tree")
text(modFit$finalModel, use.n=TRUE,all=TRUE,cex=.8)

library("rpart.plot")
library(rattle)
fancyRpartPlot(modFit$finalModel)


predict(modFit, newdata=testing)


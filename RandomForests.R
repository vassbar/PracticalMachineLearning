
data(iris);
library(ggplot2)
library(caret)
inTrain<-createDataPartition(y=iris$Spec, p = 0.7,list=FALSE)

training<-iris[inTrain,]
testing<-iris[-inTrain,]


modFit<-train(Species~.,data=training, method="rf")
modFit

getTree(modFit$finalModel, k=2)

pred<-predict(modFit,testing);
testing$predRight<-pred==testing$Species
table(pred,testing$Species)
qplot(Petal.Width, Petal.Length,colour=predRight,data=testing, main="New data Predictions")



#den douleyei

#irisP<-classCenter(training[,c(3,4)],training$Species, modFit$finalModel)
#irisP<-as.data.frame(irisP); 
#irisP$Species<-rownames(irisP)
#p<-qplot(Petal.Width,Petal.Length,col=Species,data=training)
#p+geom_point(aes(x=Petal.Width, y=Petal.Length, col=Species), size=5,shape=4,data=irisP)






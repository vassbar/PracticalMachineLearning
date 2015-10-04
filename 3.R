
library(pgmm)
data(olive)
olive = olive[,-1]
xx<-olive
inTrain<-createDataPartition(y=xx$Area,p=0.999,list=FALSE)
train<-xx[inTrain,]


mf<-train(Area ~ .,method="rpart2",data=train)
print(mf$finalModel)


plot(mf$finalModel, uniform=TRUE,main="Classification Tree")
text(mf$finalModel, use.n=TRUE,all=TRUE,cex=.8)


fancyRpartPlot(mf$finalModel)
fancyRpartPlot(mf)

newdata = as.data.frame(t(colMeans(olive)))
predict(mf, newdata = newdata)


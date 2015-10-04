

library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
xx<-segmentationOriginal
set.seed(125)
inTrain<-createDataPartition(y=xx$Case,list=FALSE)
train <- subset(xx, Case == "Train")
test <- subset(xx, Case == "Test")

mf<-train(Class ~ .,method="rpart",data=train)
print(mf$finalModel)

library("rpart.plot")
library(rattle)

plot(mf$finalModel, uniform = TRUE, main = "C")
text(mf$finalModel, use.n = TRUE, all = TRUE, cex = .8)
fancyRpartPlot(mf$finalModel)
fancyRpartPlot(mf)



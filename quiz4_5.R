


set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]


library(e1071)

set.seed(325)

modFit<-svm(CompressiveStrength ~.,data=training)
pred<-predict(modFit,testing)


sqrt(mean((pred-testing$CompressiveStrength)^2))

accuracy(pred, testing$CompressiveStrength)







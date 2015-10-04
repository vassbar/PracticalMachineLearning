





set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)


set.seed(233)
model = train(CompressiveStrength ~ ., method = 'lasso', data = training)
plot(model$finalModel)
plot.enet(model$finalModel, xvar = "penalty", use.color = TRUE)







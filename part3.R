


library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]



IL_str <- grep("^IL", colnames(training), value = TRUE)
IL_str <- grep("^IL", colnames(training), value = TRUE)
preProc <- preProcess(training[, IL_str], method = "pca")
preProc <- preProcess(training[, IL_str], method = "pca", thresh = 0.8)
preProc$rotation


summary(prcomp(training[, IL_str]))


#nn<-adData[,c(adData$CD40,adData$CD5L)]
nn<-c(adData$CD40,adData$CD5L, adData$Cortisol)
prComp<-prcomp(nn)
plot(prComp$x[,1],prComp$x[,2])
prComp$rotation

#####################################################################################
#####################################################################################


set.seed(3433)
## grep the predictors starting with 'IL'
IL_str <- grep("^IL", colnames(training), value = TRUE)
## make a subset of these predictors
predictors_IL <- predictors[, IL_str]
df <- data.frame(diagnosis, predictors_IL)
inTrain = createDataPartition(df$diagnosis, p = 3/4)[[1]]
training = df[inTrain, ]
testing = df[-inTrain, ]

modelFit <- train(diagnosis ~ ., method = "glm", data = training)
predictions <- predict(modelFit, testing)
confusionMatrix(testing$diagnosis,predictions)

preProc <- preProcess(training[, IL_str], method = "pca", thresh = 0.8)
trainPC<-predict(preProc,training[, IL_str])
modelFit<-train(training$diagnosis ~.,method="glm",data=trainPC)
testPC<-predict(preProc,testing[, IL_str])
confusionMatrix(testing$diagnosis,predict(modelFit,testPC))










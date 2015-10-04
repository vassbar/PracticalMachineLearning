

library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]


set.seed(62433)


modFit1<-train(diagnosis~.,data=training, method="rf")
modFit2<-train(diagnosis~.,data=training, method="gbm",verbose=FALSE)
modFit3<-train(diagnosis~.,data=training, method="lda")



pred1<-predict(modFit1,training);
pred2<-predict(modFit2,training);
pred3<-predict(modFit3,training);


pp<-data.frame(pred1,pred2,pred3,diag=training$diagnosis)
ppfit<-train(diag~.,method="rf", data=pp)


pred1v<-predict(modFit1,testing);
pred2v<-predict(modFit2,testing);
pred3v<-predict(modFit3,testing);

##########################################33
confusionMatrix(pred1v,testing$diag)
#################################################
confusionMatrix(pred2v,testing$diag)
#############################################
confusionMatrix(pred3v,testing$diag)
#############################################

predvDF<-data.frame(pred1=pred1v,pred2=pred2v, pred3=pred3v)
comp_pr<-predict(ppfit,predvDF)

confusionMatrix(comp_pr,testing$diag)








library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vowel.test$y<-as.factor(vowel.test$y)
vowel.train$y<-as.factor(vowel.train$y)

set.seed( 33833)

library(caret)

set.seed( 33833)
modFit<-train(y~.,data=vowel.train, method="rf")


pred<-predict(modFit,vowel.test);
vowel.test$predRight<-pred==vowel.test$y
table(pred,vowel.test$y)
confusionMatrix(pred,vowel.test$y)

#set.seed( 33833)
modFit2<-train(y~.,data=vowel.train, method="gbm",verbose=FALSE)
pred2<-predict(modFit2,vowel.test);
vowel.test$predRight<-pred==vowel.test$y
table(pred2,vowel.test$y)
confusionMatrix(pred2,vowel.test$y)






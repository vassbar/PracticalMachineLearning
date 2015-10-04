



library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 


vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)

set.seed(33833)


a <- randomForest(y ~ ., data = vowel.train, importance = FALSE)
b <- varImp(a)
b



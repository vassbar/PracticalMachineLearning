
xx<-training[, IL_str]


preobj <- preProcess(xx, method = c("center", "scale"))
censcalILpred <- predict(preobj, xx)
summary(prcomp(censcalILpred))




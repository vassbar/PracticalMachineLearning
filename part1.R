
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Super)
library(foreign)
write.dta(mixtures, "C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I/tr5.dta") 


ggplot(data = training, aes(x = Superplasticizer)) + geom_histogram() + theme_bw()
ggplot(data = training, aes(x = log10(Superplasticizer+1.0)) + geom_histogram() + theme_bw()





bb<-c(1:774)
vv<-cbind(inTrain,bb,training)

cuta<-cut2(training$Age,g=5)
table(cuta)

cutw<-cut2(training$Water,g=4)
table(cutw)

cutfa<-cut2(training$Fly,g=4)
table(cutfa)

cutc<-cut2(training$Ceme,g=4)
table(cutc)

cuts<-cut2(training$Super,g=4)
table(cuts)

cutbl<-cut2(training$Bl,g=4)
table(cutbl)

cutco<-cut2(training$Coar,g=4)
table(cutco)

cutfi<-cut2(training$Fi,g=4)
table(cutfi)



qplot(bb,CompressiveStrength,colour=cutco,data=vv)
qplot(bb,CompressiveStrength,colour=cutfi,data=vv)


qplot(bb,CompressiveStrength,colour=cutbl,data=vv)
qplot(bb,CompressiveStrength,colour=cuts,data=vv)
qplot(bb,CompressiveStrength,colour=cutc,data=vv)
qplot(bb,CompressiveStrength,colour=cutfa,data=vv)
qplot(FlyAsh,CompressiveStrength,data=vv)


qplot(bb,CompressiveStrength,colour=cuta,data=vv)

qplot(bb,CompressiveStrength,colour=cutw,data=vv)


plot(training$CompressiveStrength,training$row.names)
plot(vvv$CompressiveStrength,vvv$row.names)

library(foreign)
write.dta(vv, "C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I/tr2.dta") 


cutw<-cut2(training$Water,g=3)
table(cutw)

qplot(CompressiveStrength,Water,data=training)
qplot(FlyAsh,CompressiveStrength,data=training)

qplot(Age,CompressiveStrength,data=training)



write.dta(mixtures, "C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I/tr3.dta") 
write.dta(inTrain, "C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I/tr4.dta") 






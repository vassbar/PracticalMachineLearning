cc

pml.training <- read.csv("~/Coursera_Mathhmata/MAchine Learning_I/pml-training.csv")

registerDoMC(3)


bdata<-pml.training
dim(bdata)


bdata2<-bdata[ , colSums(is.na(bdata)) == 0]
dim(bdata2)



bdata3<-bdata2[!sapply(bdata2, function(x) any(x == ""))]
dim(bdata3)


xc1=subset(bdata3,select=c(accel_belt_x,accel_belt_y,accel_belt_z, magnet_belt_x,                                
                          magnet_belt_y,magnet_belt_z, accel_forearm_x,
                          accel_forearm_y,accel_forearm_z, magnet_forearm_x,
                          magnet_forearm_y,magnet_forearm_z,accel_dumbbell_x,
                          accel_dumbbell_y,accel_dumbbell_z,magnet_dumbbell_x,
                          magnet_dumbbell_y,magnet_dumbbell_z, accel_arm_x,
                          accel_arm_y,accel_arm_z,classe))
xc1$classe <- factor(xc1$classe)




library(caret)
inTrain2<-createDataPartition(y=xc1$classe, p = 0.8,list=FALSE)
training2<-xc1[inTrain,]
testing2<-xc1[-inTrain,]

ptm <- proc.time()
mf<-train(classe~.,data=training2, method="rf")
proc.time() - ptm
#mf


getTree(mf$finalModel, k=2)

pred2<-predict(mf,testing2);
testing2$predRight<-pred2==testing2$classe
table(pred2,testing2$class)
confusionMatrix(pred2,testing2$classe)


pml.testing <- read.csv("~/Coursera_Mathhmata/MAchine Learning_I/pml-testing.csv")
outsample2<-pml.testing
predout2<-predict(mf,outsample2)
predict(mf,outsample2)









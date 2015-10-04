
pml.training <- read.csv("~/Coursera_Mathhmata/MAchine Learning_I/pml-training.csv")

registerDoMC(3)


bdata<-pml.training
dim(bdata)


bdata2<-bdata[ , colSums(is.na(bdata)) == 0]
dim(bdata2)



bdata3<-bdata2[!sapply(bdata2, function(x) any(x == ""))]
dim(bdata3)

bdata4<-subset(bdata3,select=-c(X,user_name,cvtd_timestamp, raw_timestamp_part_1,raw_timestamp_part_2, new_window,num_window))
dim(bdata4)



bdata4$classe <- factor(bdata$classe)


#bdata4$user_name <- factor(bdata4$user_name, labels = c(1, 2,3,4,5,6))


library(caret)
inTrain<-createDataPartition(y=bdata4$classe, p = 0.8,list=FALSE)
training<-bdata4[inTrain,]
testing<-bdata4[-inTrain,]

ptm <- proc.time()
modFit<-train(classe~.,data=training, method="rf")
proc.time() - ptm
modFit

getTree(modFit$finalModel, k=2)

pred<-predict(modFit,testing);
testing$predRight<-pred==testing$classe
table(pred,testing$class)
confusionMatrix(pred,testing$classe)

pml.testing <- read.csv("~/Coursera_Mathhmata/MAchine Learning_I/pml-testing.csv")
outsample<-pml.testing
predout<-predict(modFit,outsample)
predict(modFit,outsample)

setwd("C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I")

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(predout)




############ apo edw kai katw proxeiro




modFit<-train(classe ~ .,method="class",data=training)

library("rpart.plot")
library(rattle)
fancyRpartPlot(modFit$finalModel)


predict(modFit, newdata=testing)

pred<-predict(modFit,testing);
testing$predRight<-pred==testing$classe
table(pred,testing$classe)

confusionMatrix(pred, testing$classe)



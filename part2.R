

matv <- c(rnorm(1000))
df=data.frame(matv)

set.seed(975)
inTrain2 = createDataPartition(df$matv, p = 3/4)[[1]]
training2 = df[ inTrain2,]
testing2 = df[-inTrain2,]

bb<-c(1:752)

df2<-cbind(inTrain2,bb,training2)
df3=data.frame(df2)
write.dta(df3, "C:/Users/km/Documents/Coursera_Mathhmata/MAchine Learning_I/tr5.dta") 




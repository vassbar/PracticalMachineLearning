



dat <- read.csv("C:\\Users\\km\\AppData\\Local\\Temp\\RtmpakweAT\\data1ce4451955ab")

library(lubridate)  # For year() function below
#dat = read.csv("~/Desktop/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)



tstesting = ts(testing$visitsTumblr)


library(forecast)

model = bats(tstrain)


pred <- forecast(model, h=dim(testing)[1],level=c(95))
accuracy(pred, testing$visitsTumblr)
acc = sum(testing$visitsTumblr <= pred$upper) / nrow(testing)



result <- c()
l <- length(pred$lower)
for (i in 1:l){
  x <- testing$visitsTumblr[i]
  a <- pred$lower[i] < x & x < pred$upper[i]
  result <- c(result, a)
}
sum(result)/l * 100



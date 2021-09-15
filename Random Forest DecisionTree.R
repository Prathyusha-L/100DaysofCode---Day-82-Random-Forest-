#install.packages("randomForest")


balanceCSV <- read.csv("c:\\R\\balance-scale - Copy.csv")
str(balanceCSV)
summary(balanceCSV)


balanceDF <- balanceCSV[order(runif(nrow(balanceCSV))),]
tail(balanceDF,25)

balanceDF_train <- balanceDF[1:550,]
balanceDF_test <- balanceDF[551:625,]

nrow(balanceDF_train)
nrow(balanceDF_test)

require(randomForest)
#randomForest Train
randomForest_model<- randomForest(balanceDF_train[,-1],balanceDF_train[,1],ntree=100)
summary(randomForest_model)

plot(randomForest_model)



#RandomForest Predict

randomForest_predict<- predict(randomForest_model,balanceDF_test, type="response")
randomForest_predict



#Compare
table(balanceDF_test[,1],randomForest_predict)

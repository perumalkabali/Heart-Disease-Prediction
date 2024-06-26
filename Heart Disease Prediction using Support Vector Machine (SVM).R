install.packages('caret')
library(caTools)
library(e1071)
library(caret)
setwd("C:/Users/perum/Downloads")
heart_df <- read.csv("heart_tidy.csv", sep = ',', header = FALSE)
str(heart_df)
head(heart_df)


set.seed(3033)
intrain <- createDataPartition(y = heart_df$V14, p= 0.7, list = FALSE)
training <- heart_df[intrain,]
testing <- heart_df[-intrain,]

dim(training); dim(testing);

anyNA(heart_df)

summary(heart_df)

table(heart_df$V14)
table(training[["V14"]])

training[["V14"]] = factor(training[["V14"]])
testing [["V14"]] = factor(testing[["V14"]])

class(training[["V14"]])
 
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3233)
svm_Linear <- train(V14 ~., data = training, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)

svm_Linear

test_pred <- predict(svm_Linear, newdata = testing)
test_pred

confusionMatrix(test_pred, testing$V14)

grid <- expand.grid(C = c(0, 0.001,0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2,5))
set.seed(3233)
svm_Linear_Grid <- train(V14 ~., data = training, method = "svmLinear",
                         trControl=trctrl,
                         preProcess = c("center", "scale"),
                         tuneGrid = grid,
                         tuneLength = 10)

svm_Linear_Grid
plot(svm_Linear_Grid)

test_pred_grid <- predict(svm_Linear_Grid, newdata = testing)
test_pred_grid


confusionMatrix(test_pred_grid, testing$V14 )

#############################################################
set.seed(3233)
svm_Radial <- train(V14 ~., data = training, method = "svmRadial",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)
svm_Radial

plot(svm_Radial)

test_pred_Radial <- predict(svm_Radial, newdata = testing)
confusionMatrix(test_pred_Radial, testing$V14 )
###############################################################33
###############################################################
#############################################################

grid_radial <- expand.grid(sigma = c(0,0.01, 0.02, 0.025, 0.03, 0.04,
                                     0.05, 0.06, 0.07,0.08, 0.09, 0.1, 0.25, 0.5, 0.75,0.9),
                           C = c(0,0.01, 0.05, 0.1, 0.25, 0.5, 0.75,
                                 1, 1.5, 2,5))
set.seed(3233)
svm_Radial_Grid <- train(V14 ~., data = training, method = "svmRadial",
                         trControl=trctrl,
                         preProcess = c("center", "scale"),
                         tuneGrid = grid_radial,
                         tuneLength = 10)

svm_Radial_Grid

plot(svm_Radial_Grid)

test_pred_Radial_Grid <- predict(svm_Radial_Grid, newdata = testing)

confusionMatrix(test_pred_Radial_Grid, testing$V14 )


#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$
#SVM Classifier using Polynomial Kernel
set.seed(3233)
svm_polynomial <- train(V14 ~., data = training, method = "svmPoly",
                                      trControl=trctrl,
                                      preProcess = c("center", "scale"),
                                      tuneLength = 5,
                                      cost = c(.01, .1, .5, 1, 2.5, 5), 
                                      gamma = c(0.1,.5, 1,5, 10), 
                                      scale = FALSE,
                                      degree = 3)

svm_polynomial

test_pred_polynomial <- predict(svm_polynomial, newdata = testing)

confusionMatrix(test_pred_polynomial, testing$V14 )

#Comparison between SVM models

svm_compare <- resamples(list(svm_Linear=svm_Linear_Grid,svm_Radial=svm_Radial_Grid,svm_polynomial=svm_polynomial))
svm_compare$values
bwplot(svm_compare)
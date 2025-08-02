library(rpart)
library(rpart.plot)
library(caret)

# Read the data
testing.data <- read.csv("testing.data.csv")
validation.data <- read.csv("training.data.csv")

# Remove any unnecessary columns
train.data <- testing.data[, -c(3, 4, 6, 8, 11, 12)]
valid.data <- validation.data[, -c(3, 4, 6, 8, 11, 12)]

# Convert categorical variables to factors
train.data$workclass <- as.factor(train.data$workclass)
train.data$occupation <- as.factor(train.data$occupation)
train.data$race <- as.factor(train.data$race)
train.data$sex <- as.factor(train.data$sex)
train.data$country <- as.factor(train.data$country)
train.data$class <- as.factor(train.data$class)
summary(train.data)

# Convert categorical variables to factors
valid.data$workclass <- as.factor(valid.data$workclass)
valid.data$occupation <- as.factor(valid.data$occupation)
valid.data$race <- as.factor(valid.data$race)
valid.data$sex <- as.factor(valid.data$sex)
valid.data$country <- as.factor(valid.data$country)
valid.data$class <- as.factor(valid.data$class)
summary(valid.data)

# classification tree split using entropy
default.ct <- rpart(class ~ ., data = train.data, parms = list(split = 'information'), method = "class")
prp(default.ct, type = 1, extra = 2, under = TRUE, split.font = 2, varlen = -10)
length(default.ct$frame$var[default.ct$frame$var == "<leaf>"])

# classify records in the TRAINING data.
# set argument type = "class" in predict() to generate predicted class membership.
pred.train <- predict(default.ct, train.data,type = "class")
# generate confusion matrix for training data
confusionMatrix(pred.train, as.factor(train.data$class))

# classify records in the VALIDATION data.
# set argument type = "class" in predict() to generate predicted class membership.
preds.train <- predict(default.ct, valid.data,type = "class")

# Check and set levels to be the same
levels(preds.train) <- levels(valid.data$class)

# Now you can proceed with confusionMatrix
 confusionMatrix(valid.data$class, as.factor(preds.train))


library(pROC)
# Recode 'class' variable to binary (0 and 1)
train.data$binary_class <- ifelse(train.data$class == '>50K.', 1, 0)

# Create ROC curve for training data
roc_train <- roc(train.data$binary_class, as.numeric(pred.train == ">50K."))
auc(roc_train)

valid.data$binary_class <- ifelse(valid.data$class == '>50K.', 1, 0)
# Create ROC curve for validation data

roc_valid <- roc(valid.data$binary_class, as.numeric(preds.train == ">50K."))
 auc(roc_valid)

# Plot ROC curves for both training and validation data on the same plot
plot(roc_train, col = "blue", lwd = 2, main = "ROC Curve - Training vs Validation", cex.main = 1.2)
lines(roc_valid, col = "red", lwd = 2)

# Add legend
legend("bottomright", legend = c(paste("Training AUC =", round(auc_train, 2)),
                                 paste("Validation AUC =", round(auc_valid, 2))),
       col = c("blue", "red"), lwd = 2)



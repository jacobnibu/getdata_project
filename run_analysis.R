
## load features and clean up and align with data
features <- read.table("UCI HAR Dataset\\features.txt",header=F, colClasses="character")
features <- features[,2]
features <- gsub("()","",features, fixed=TRUE)
features <- c("subject", "activity", features)

## load training data and add features as headings and an additional column
## to indicate it's a training observation
trainSet <- read.table("UCI HAR Dataset\\train\\X_train.txt",header=F)
trainLabels <- read.table("UCI HAR Dataset\\train\\y_train.txt",header=F)
trainSubjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt",header=F)
trainSet <- cbind(trainSubjects,trainLabels,trainSet)
colnames(trainSet) <- features
trainSet$set <- "training"

## load test data and add features as headings and an additional column
## to indicate it's a test observation
testSet <- read.table("UCI HAR Dataset\\test\\X_test.txt",header=F)
testLabels <- read.table("UCI HAR Dataset\\test\\y_test.txt",header=F)
testSubjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header=F)
testSet <- cbind(testSubjects,testLabels,testSet)
colnames(testSet) <- features
testSet$set <- "test"

## combine the training and test data sets
cData <- rbind(trainSet,testSet)

## extract mean and standard deviation
columnsToReturn_1 <- grep("mean", names(cData), value=T)
columnsToReturn_2 <- grep("std", names(cData), value=T)
extractedData <- cData[,c("subject", "activity", columnsToReturn_1, columnsToReturn_2)]

## replace activity codes with the descriptive activity names
activityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt",header=F, colClasses="character")
activityCodes <- activityLabels[,1]
names(activityCodes) <- activityLabels[,2]
extractedData$activity <- names(activityCodes)[match(extractedData$activity, activityCodes)]

## create tidy data set of averages of variables for each subject and activity
extractedData$subject <- as.factor(extractedData[,1])
extractedData$activity <- as.factor(extractedData[,2])
tidyData <- aggregate(extractedData[,c(-1,-2)], by=list(subject=extractedData$subject,activity=extractedData$activity), FUN=mean)
write.table(tidyData,"tidyData.txt", row.name=FALSE)


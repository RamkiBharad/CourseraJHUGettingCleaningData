
setwd("D:\\CTSData\\DataScience\\Coursera\\JHUDataScience\\03_GettingCleaningData")

library(reshape2)
library(plyr)


# Load activity labels + features
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)

# Extract only the data on mean and standard deviation
featuresMeanStd <- grep(".*mean.*|.*std.*", features[,2])
featuresMeanStd.names <- features[featuresMeanStd,2]
featuresMeanStd.names = gsub('-mean', 'Mean', featuresMeanStd.names)
featuresMeanStd.names = gsub('-std', 'Std', featuresMeanStd.names)
featuresMeanStd.names <- gsub('[-()]', '', featuresMeanStd.names)


# Load the datasets
train <- read.table("./UCI HAR Dataset/train/X_train.txt")[featuresMeanStd]
trainActivities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./UCI HAR Dataset/test/X_test.txt")[featuresMeanStd]
testActivities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresMeanStd.names)

# turn activities into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
#allData$subject <- as.factor(allData$subject)

# Melt data to converts rest of the columns not specified here into separate row
allData.melted <- melt(allData, id = c("subject", "activity"))

# then dcast back after mean calculation
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

## Below is another approach using ddply - it generates separate record for each variable
## allData.mean = ddply(allData.melted, .(subject, activity, variable), summarize, mean(value))

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)


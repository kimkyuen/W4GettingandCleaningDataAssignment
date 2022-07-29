#install.packages("plyr")
library(plyr)

#Download dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "projectdataset.zip")

# Unzip the dataset
unzip(zipfile = "projectdataset.zip")

# 1. Merge the training and test datasets
# 1.1 Reading files

# 1.1.1 Reading training datasets
x_train <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/train/subject_train.txt")
# 1.1.2 Reading test datasets
x_test <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/test/subject_test.txt")
# 1.1.3 Reading feature vector
features <- read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/features.txt")
# 1.1.4 Reading activity labels
activityLabels = read.table("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/Getting and Cleaning Data/W4/UCI HAR Dataset/activity_labels.txt")

# 1.2 Assigning column names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activityLabels) <- c("activityID", "activityType")

# 1.3 Merging all data sets into one data set
alltrain <- cbind(subject_train,y_train,x_train)
alltest <- cbind(subject_test,y_test,x_test)
alldata <- rbind(alltrain, alltest)

# 2. Extracting only the measurements on the mean and sd for each measurement
# 2.1 Determining subject, activity, mean and sd columns of data set to keep
columnsToKeep <- grepl("subjectID|activityID|mean|std", colnames(alldata))
# 2.1 Create subset with only mean and sd columns
alldata_MeanStd <- alldata[, columnsToKeep]

# 3. Use descriptive activity names to name the activities in the data set
alldata_ActivityNames <- merge(alldata_MeanStd, activityLabels,
                               by = "activityID",all.x = TRUE)

# 4. Appropriately label the data set with descriptive variable names
# 4.1 Get column names
ColNames <- colnames(alldata_ActivityNames)
# 4.2 Remove all special characters
ColNames <- gsub("[^[:alnum:] ]","", ColNames)
# 4.3 Change to more descriptive names
ColNames <- gsub("Gyro", "Gyroscope", ColNames)
ColNames <- gsub("Acc", "Accelerometer", ColNames)
ColNames <- gsub("mean", "Mean", ColNames)
ColNames <- gsub("std", "StandardDeviation", ColNames)
ColNames <- gsub("Mag", "Magnitude", ColNames)
ColNames <- gsub("^f", "frequencyDomain", ColNames)
ColNames <- gsub("^t", "timeDomain", ColNames)
#4.4 Fix typo
ColNames <- gsub("BodyBody", "Body", ColNames)
# 4.5 Use new labels as column names
colnames(alldata_ActivityNames) <- ColNames

# 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject
# 5.1 Create second data set
library(dplyr)
tidySet <- alldata_ActivityNames %>% 
  group_by(subjectID, activityID) %>%
  summarise_each(funs(mean))
#5.2 Write data set to txt file
write.table(tidySet, "tidySet.txt", row.names = FALSE)


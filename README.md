# W4GettingandCleaningDataAssignment
Repository for "Getting and Cleaning Data" Week 4 project on Coursera. Contains R script, codebook, and tidy data set for the assignment.

Files:
README.md - gives an overview of the data set and project.
CodeBook.md - explains the variables, data and transformations done to clean the data
run_analysis.R - R script code of analysis done. Overview of 5 steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidySet.txt - output from the 5th step

Data Set/Project Overview:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. In this project, the Human Activity Recognition Using Smartphones Dataset was used where data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Training and test data were merged together, then I extracted the mean and standard deviation for each measurement, and then each measurement was averaged for each subject and activity, resulting in the final data set (tidySet.txt).
 
 

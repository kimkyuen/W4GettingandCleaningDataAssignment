**Codebook for W4 Getting and Cleaning Data Assignment**

**run_analysis.R - R Script**
R Script code with 5 assignment requirement steps. Details of each step:
1. Merge the training and test data sets
1.1. Reading files
1.1.1. Reading training data sets
1.1.2. Reading test data sets
1.1.3. Reading feature vector
1.1.4. Reading activity labels
1.2. Assigning column names
1.3. Merging all data sets into one data set

2. Extracting only the measurements on the mean and sd for each measurement (remaining variables were not included)
2.1. Determining subject, activity, mean and sd columns of data set to keep
2.2. Create subset with only mean and sd columns

3. Use descriptive activity names to name the activities in the data set

4. Appropiately label the data set with descriptive variable names (column variables renamed)
4.1. Get column names
4.2. Remove all special characters
4.3. Change column names to more descriptive names
4.4. Fix typo 
4.5. Use new labels as column names 

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
5.1. Create second data set
5.2. Write data set to txt file

**TidySet.txt - Output with Dataset**
Textfile that is the output of step 5 in the code.
The first row contains the names of the variables, see below for descriptions.

ID Variables:
subjectID - ID of each subject participant (30 in total), ranging from 1-30.
activityID - ID of each activity type each participant performed (6 in total). 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Remaining variables:
Each variable is a mean or standard deviation measure, and is the average for a given subject and activity type.
There are 2 types of measures:
timeDomain - come from the accelerometer and gyroscope 3-axial raw signals
frequencyDomain - Fast Fourier Transform (FFT) was applied to some of the timeDomain variables
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

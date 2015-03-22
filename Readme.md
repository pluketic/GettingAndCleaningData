## Getting and Cleaning Data: Course Project

#### Introduction

This repository contains exercise for the course project of "Getting and Cleaning data" course, part of the Data Science specialization.

#### About the raw data

Testing and training datasets containing the features are not labeled and can be found in the x_test.txt and x_train.txt. The activity labels are in the y_test.txt and y_train.txt files. Training and testing subjects are stored in the subject_test.txt and subject_train.txt files.

#### About the script and the tidy data set

###### Input:

1. The UCI HAR Dataset must be downloaded and extracted into “Data” folder within working directory

###### Execution path:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###### Output:

1. The script creates tidy data set containing the means of all the features per subject and per activity. This tidy dataset is exported to a tab-delimited file called tidy.txt, which can also be found in this repository.

#### About the Code Book

The CodeBook.md file explains the transformations performed by run_analysis.R script, and variables in the resulting tidy data set.

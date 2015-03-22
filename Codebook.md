# run_anlysis.R Codebook

This file describes the variables, data, and transformations performed in order to consolidate and clean the source data.

## Data Source

UCI HAR Dataset needs to be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted into Data folder under the working directory.



## Process

### Step 0

Make sure the source data are available at "./Data/" folder.

### Step 1

Read X_train.txt, y_train.txt and subject_train.txt files from "./Data/train" folder and store them all in the train data frame.

### Step 2

Read X_test.txt, y_test.txt and subject_test.txt files from "./Data/test" folder and store them all in the test data frame.

### Step 3

Read Activity labels from activity_labels.txt file.

### Step 4

Read features from features.txt file, store the data in a variable called features and then make feature names more desciptive by removing "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

### Step 5

Merge train and test datasets into allData dataset to generate a 10299x563 data frame

### Step 6

Consolidate features data frame, by subsetting it to the list of needed variables (Mean and Standard deviation variables)

### Step 7

Subset allData data frame to the list of required variables based on the variables defined in the subset of features data frame.

### Step 8

Attach tidy features list to the allData data frame headers.

### Step 9

Replace Activity IDs with Activity names

### Step 10

Define Activity and Subject variables as factors

### Step 11

Consolidate data into tidy dataset by calculating mean by activity & subject

### Step 12

Remove not needed variables

### Step 13

Export tidy data set to tab delimited text file named tidy.txt.


Concatenate testData to trainData to generate a 10299x561 data frame, joinData; concatenate testLabel to trainLabel to generate a 10299x1 data frame, joinLabel; concatenate testSubject to trainSubject to generate a 10299x1 data frame, joinSubject.
Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns.
Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.
Transform the values of joinLabel according to the activity data frame.
Combine the joinSubject, joinLabel and joinData by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
Write the cleanedData out to "merged_data.txt" file in current working directory.
Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
Write the result out to "data_with_means.txt" file in current working directory.
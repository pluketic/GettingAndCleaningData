# Codebook

This file describes the variables, data, and transformations performed in order to consolidate and clean the source data.

## Data Source

UCI HAR Dataset needs to be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted into Data folder under the working directory.



## Process

#### Step 0

Make sure the source data are available at "./Data/" folder.

#### Step 1

Read X_train.txt, y_train.txt and subject_train.txt files from "./Data/train" folder and store them all in the train data frame.

#### Step 2

Read X_test.txt, y_test.txt and subject_test.txt files from "./Data/test" folder and store them all in the test data frame.

#### Step 3

Read Activity labels from activity_labels.txt file.

#### Step 4

Read features from features.txt file and store the data in the variable called features. Consolidate features data frame, by subsetting it to the list of needed variables (Mean and Standard deviation variables) and then make feature names more desciptive by removing "()" and "-" symbols in the names as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

#### Step 5

Merge train and test datasets into allData dataset to generate a 10299x563 data frame

#### Step 6

Subset allData data frame to the list of required variables based on the variables defined in the subset of features data frame.

#### Step 7

Attach tidy features list to the allData data frame headers.

#### Step 8

Replace Activity IDs with Activity names

#### Step 9

Define Activity and Subject variables as factors. The Subject column contains integers that range from 1 to 30 inclusive; the Activity column contains 6 kinds of activity names; and the remaining 66 columns contain measurements that range from -1 to 1 exclusive.

#### Step 10

Consolidate data into tidy data frame by calculating mean by activity & subject. Resulting tidy data set is a 180x70 data frame.

#### Step 11

Remove not needed variables

#### Step 12

Export tidy 180x68 data frame to a tab delimited text file named "tidy.txt" in working directory.
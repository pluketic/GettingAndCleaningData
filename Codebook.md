# Codebook

This file describes the variables, data, and transformations performed in order to consolidate and clean the source data.

## Data Source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561*feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### The data

The dataset includes the following files:

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Process

* Make sure the source data are available at "./Data/" folder.

* Read X_train.txt, y_train.txt and subject_train.txt files from "./Data/train" folder and store them all in the train data frame.

* Read X_test.txt, y_test.txt and subject_test.txt files from "./Data/test" folder and store them all in the test data frame.

* Read Activity labels from activity_labels.txt file.

* Read features from features.txt file and store the data in the variable called features. Consolidate features data frame, by subsetting it to the list of needed variables (Mean and Standard deviation variables) and then make feature names more desciptive by removing "()" and "*" symbols in the names as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

* Merge train and test datasets into allData dataset to generate a 10299x563 data frame.

* Subset allData data frame to the list of required variables based on the variables defined in the subset of features data frame.

* Attach tidy features list to the allData data frame headers.

* Replace Activity IDs with Activity names.

* Define Activity and Subject variables as factors. The Subject column contains integers that range from 1 to 30 inclusive; the Activity column contains 6 kinds of activity names; and the remaining 66 columns contain measurements that range from *1 to 1 exclusive.

* Consolidate data into tidy data frame by calculating mean by activity & subject. Resulting tidy data set is a 180x70 data frame.

* Remove not needed variables.

* Export tidy 180x68 data frame to a tab delimited text file named "tidy.txt" in working directory.

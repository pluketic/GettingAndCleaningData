# Read train data
train = read.csv("Data/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("Data/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("Data/train/subject_train.txt", sep="", header=FALSE)

# Read test data
test = read.csv("Data/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("Data/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("Data/test/subject_test.txt", sep="", header=FALSE)

# Read Activity labels
activityLabels = read.csv("Data/activity_labels.txt", sep="", header=FALSE)

# Read features and make feature names more desciptive
features = read.csv("Data/features.txt", sep="", header=FALSE)

# Get only the data on mean and std. dev.
ColsNeeded <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# Make feature names more desciptive
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Shorten features table to the list of variables required
features <- features[ColsNeeded,]

# Merge train and test datasets into allData dataset
allData = rbind(train, test)

# Add the last two columns (subject and activity)
ColsNeeded <- c(ColsNeeded, 562, 563)

# Remove not required variables from allData
allData <- allData[,ColsNeeded]

# Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")

# Replace Activity IDs with Activity names
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
    allData$Activity <- gsub(currentActivity, currentActivityLabel, allData$Activity)
    currentActivity <- currentActivity + 1
}

# Define Activity and Subject variables as factors
allData$Activity <- as.factor(allData$Activity)
allData$Subject <- as.factor(allData$Subject)

# Consolidate data into tidy dataset by calculating mean by activity & subject
tidy = aggregate(allData, by=list(activity = allData$Activity, subject=allData$Subject), mean)

# Remove not needed variables
tidy[,70] = NULL
tidy[,69] = NULL

# Export tidy data set to tab delimited text file
write.table(tidy, "tidy.txt", sep="\t")

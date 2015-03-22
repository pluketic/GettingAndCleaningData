setwd("~/AST/Specialization in Data Science/03_Getting And Cleaning The Data/Course Project")

train = read.csv("Data/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("Data/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("Data/train/subject_train.txt", sep="", header=FALSE)

test = read.csv("Data/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("Data/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("Data/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("Data/activity_labels.txt", sep="", header=FALSE)

# Read features and make the feature names better suited for R with some substitutions
features = read.csv("Data/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
features[,2] = gsub('[,]', '', features[,2])

# Merge train and test datasets together
allData = rbind(train, test)

# Get only the data on mean and std. dev.
ColsNeeded <- grep(".*Mean.*|.*Std.*", features[,2])

# First reduce the features table to what we want
features <- features[ColsNeeded,]

# Now add the last two columns (subject and activity)
ColsNeeded <- c(ColsNeeded, 562, 563)

# And remove the unwanted columns from allData
allData <- allData[,ColsNeeded]

# Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")
#colnames(allData) <- tolower(colnames(allData))

# Replace Activity IDs with activity names
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
    allData$Activity <- gsub(currentActivity, currentActivityLabel, allData$Activity)
    currentActivity <- currentActivity + 1
}


allData$Activity <- as.factor(allData$Activity)
allData$Subject <- as.factor(allData$Subject)

# Consolidate data into tidy dataset by calculating mean by activity & subject
tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

# Remove the subject and activity column, since a mean of those has no use
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")

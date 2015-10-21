# Read and manipulate data for "Getting and Cleaning Data" course project
#
# This script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#       set with the average of each variable for each activity and each subject.
# 6. Output data set as a txt file created with write.table() using row.name=FALSE
# 
# Data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#setwd("3 Getting and Cleaning Data/CourseProject/")
library(plyr)
library(reshape2)

# dataset output file
outputfile <- "tidyData.txt"
# data summary output file
dsoutputfile <- "tidySummary.txt"

# Reguar expression to match columns desired
#   Find "mean()" or "std()" columns, but not columns for mean frequencies (meanFreq), which appear to be derived
#   ignore.case=F will ignore cols with "Mean", which are also derived; the regex will not match meanFreq
#   We also want our "activity" column
wantCols.regex <- "((mean|std)[^A-z])|activity|subject"
# data files
#   Testing data files
testObsFile <- "UCI HAR Dataset/test/X_test.txt"
testLabelsFile <- "UCI HAR Dataset/test/y_test.txt"
testSubjFile <- "UCI HAR Dataset/test/subject_test.txt"
#   Training data files
trainObsFile <- "UCI HAR Dataset/train/X_train.txt"
trainLabelsFile <- "UCI HAR Dataset/train/y_train.txt"
trainSubjFile <- "UCI HAR Dataset/train/subject_train.txt"

#   Features and activities
featuresFile <- "UCI HAR Dataset/features.txt"
activitiesFile <- "UCI HAR Dataset/activity_labels.txt"

# Get features from features.txt file
features <- as.vector(read.table(featuresFile)[,2])

#   Get activity labels
actLabels <- read.table(activitiesFile, col.names=c("actClass", "activity"))

#
# 1. Merges the training and the test sets to create one data set.
#
#   Read data into two dataframes, which will be merged later
#   We will put the subject id in the first column, and actity in the last
testdf  <- read.table(testObsFile, col.names=features)
testdf  <- cbind(read.table(testSubjFile, col.names=c("subject")), testdf,
                 read.table(testLabelsFile, col.names=c("actClass")) )

traindf  <- read.table(trainObsFile, col.names=features)
traindf  <- cbind(read.table(trainSubjFile, col.names=c("subject")), traindf,
                  read.table(trainLabelsFile, col.names=c("actClass")) )
                  

# 3. Uses descriptive activity names to name the activities in the data set
testdf  <- join(testdf,actLabels)
traindf  <- join(traindf,actLabels)

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#
wantCols <- grep(wantCols.regex, names(testdf), ignore.case=F)

# Put wanted cols into dataframe
dataset <- rbind(testdf[,wantCols], traindf[,wantCols])

### This is for comparing versions of the feature list ###
#featureCompare <- matrix(names(dataset))

#
# 4. Appropriately labels the data set with descriptive variable names. 
#
#   Tidy up the column headers, reuse "features" variable to save memory
features <- names(dataset)
#   make "acc" more like "accelerometer"
features <- sub("Acc","Accel", features)
#   time domain can be assumed if not frequency domain
features <- sub("^t","", features)
#   change initial f to "freq" for clarity
features <- sub("^f","freq", features)
#   Body can be assumed if the measurement is not for Gravity, so delete "Body" everywhere
features <- gsub("Body","", features)
#   Remove periods from variables
features <- gsub("\\.","", features)

###
#featureCompare <- cbind(featureCompare,features,tolower(features))

#   lowercase column headers and apply to the dataframe
names(dataset) <- tolower(features)

#
# 5. From the data set in step 4, creates a second, independent tidy data 
#       set with the average of each variable for each activity and each subject.
#
dsMelt <- melt(dataset, id=c("subject","activity")) 
dsSummary <- dcast(dsMelt, subject + activity ~ ..., mean)

#
# 6. Output data set as a txt file created with write.table() using row.name=FALSE
#   The full dataset
write.table(dataset, file=outputfile, row.names=FALSE)
#   The summary table
write.table(dsSummary, file=dsoutputfile, row.names=FALSE)

## run_analysis.R
## Timothy Johnstone, April 2015
## Analysis script for the final project of Coursera Data Science Series, 
## Course 3: Getting and Cleaning Data 'getdata-013'

## For more information, PLEASE see the attached README.md and CODEBOOK.md

##THINGS TO REMOVE BEFORE FINAL PUB
setwd("~/Dropbox/Coursera/3_Getting_and_cleaning_data/Projects/UCI HAR Dataset/")
##THINGS TO REMOVE BEFORE FINAL PUB

## Libraries to load - requires tidyr
require(tidyr)

##########

# Load in test dataset files
testx <- read.table("test/X_test.txt")
testy <-  read.table("test/y_test.txt")$V1
testsubject <- read.table("test/subject_test.txt")$V1
# Load in training dataset files
trainx <- read.table("train/X_train.txt")
trainy <-  read.table("train/y_train.txt")$V1
trainsubject <- read.table("train/subject_train.txt")$V1

#merge test and training set
bothx <- rbind(testx, trainx)
bothy <- c(testy, trainy)
bothsubject <- c(testsubject, trainsubject)


# Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table('activity_labels.txt', sep="\t", stringsAsFactors = F)
activitylabels <- separate(activitylabels, V1, c("num","label"), " ")
activitylabels$num <- as.numeric(activitylabels$num)
activitylabels$label <- tolower(activitylabels$label)
activitylabels$label <- sub("_","",activitylabels$label)

# Make a data frame to translate feature numbers into feature names
featurelabels <- read.table('features.txt', sep="\t", stringsAsFactors = F)
featurelabels <- separate(featurelabels, V1, c("num","label"), " ")
featurelabels$num <- as.numeric(featurelabels$num)
  
# Relabel and factorize tasks
bothy <- activitylabels$label[match(bothy, activitylabels$num,)]
bothy <- factor(bothy,levels = activitylabels$label)

# Factorize subjects
bothsubject <- as.factor(bothsubject)

# Add column which indicates whether this subject is in the test or training set
bothset <- factor(c(rep("test", length(testsubject)), rep("training", length(trainsubject))), levels=c("test","training"))

# Extracts only the measurements on the mean and standard deviation for each measurement. 
# See note in README!
# The (commented out) version will not include separate mean()-x, mean()-y, and mean()-z vars
# featurelabelsmeanstd <- featurelabels[grep(".mean\\(\\)$|.std\\(\\)$", featurelabels$label),]
selectedfeaturelabels <- featurelabels[grep('.mean\\(\\)|.std\\(\\)', featurelabels$label),]  
bothx <- bothx[,selectedfeaturelabels$num]

# Appropriately labels the data set with descriptive variable names.
# Column names are all in lower case, with underscores (_) separating words
# This is in accordance with Hadley Wickham's style guide: http://stat405.had.co.nz/r-style.html
names(bothx) <- selectedfeaturelabels$label
names(bothx) <- tolower(names(bothx))
names(bothx) <- sub('\\(\\)', '', names(bothx))
names(bothx) <- sub("^t", "time_", names(bothx))
names(bothx) <- sub("^f", "frequency_", names(bothx))
names(bothx) <- sub("acc", "accelerometer_", names(bothx))
names(bothx) <- sub("gyro", "gyroscope_", names(bothx))
names(bothx) <- sub("mag", "magnitude_", names(bothx))
names(bothx) <- sub("jerk", "jerk_", names(bothx))
names(bothx) <- sub("body", "body_", names(bothx))
names(bothx) <- sub("gravity", "gravity_", names(bothx))
names(bothx) <- sub("-std", "std", names(bothx))
names(bothx) <- sub("-mean", "mean", names(bothx))
names(bothx) <- sub("-", "_", names(bothx))

## TODO here finish naming properly

# Properly combine all dataset files into a single data frame
allcombined <- cbind("subject"=bothsubject, "task"=bothy, bothx)

# From the data set in step 4, creates a second, independent tidy data set with the average
#  of each variable for each activity and each subject.
tidyset <- aggregate(allcombined[,3:ncol(allcombined)],
                   by=list(allcombined$subject,allcombined$task),
                   FUN = mean)
# Fix factor labels from aggregation
names(tidyset)[1:2] <- c("subject","task")
# Append average to all measurement column names to reflect change
names(tidyset)[3:ncol(tidyset)] <- sapply(names(tidyset)[3:ncol(tidyset)], function(x) paste0("average_",x))




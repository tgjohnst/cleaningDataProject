## run_analysis.R
## Timothy Johnstone, April 2015
## Analysis script for the final project of Coursera Data Science Series, 
## Course 3: Getting and Cleaning Data 'getdata-013'

## For more information, PLEASE see the attached README.md and CODEBOOK.md

##THINGS TO REMOVE BEFORE FINAL PUB
setwd("~/Dropbox/Coursera/3_Getting_and_cleaning_data/Projects/UCI HAR Dataset/")
##THINGS TO REMOVE BEFORE FINAL PUB

## Libraries to load - requires plyr
require(tidyr)
## /Libraries to load

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
# Separates out just the features we care about - See note in README!
# The (commented out) version will not include separate mean()-x, mean()-y, and mean()-z vars
# featurelabelsmeanstd <- featurelabels[grep(".mean\\(\\)$|.std\\(\\)$", featurelabels$label),]
selectedfeaturelabels <- featurelabels[grep('.mean\\(\\)|.std\\(\\)', featurelabels$label),]  
  
# Relabel and factorize tasks
bothy <- activitylabels$label[match(bothy, activitylabels$num,)]
bothy <- factor(bothy,levels = activitylabels$label)

# Factorize subjects
bothsubject <- as.factor(bothsubject)

# Add column which indicates whether this subject is in the test or training set
bothset <- factor(c(rep("test", length(testsubject)), rep("training", length(trainsubject))), levels=c("test","training"))

# Extracts only the measurements on the mean and standard deviation for each measurement. 
bothx <- bothx[,selectedfeaturelabels$num]
names(bothx) <- selectedfeaturelabels$label
# Appropriately labels the data set with descriptive variable names. 
names(bothx) <- tolower(names(bothx))
names(bothx) <- sub('\\(\\)', '', names(bothx))
names(bothx) <- sub("acc", "acceleration", names(bothx))
names(bothx) <- sub("mag", "magnitude", names(bothx))
names(bothx) <- sub("^t", "time", names(bothx))
names(bothx) <- sub("^f", "freq", names(bothx))
## TODO here finish naming properly
## TODO here


# Properly combine all dataset files into a single data frame
allcombined <- cbind("subject"=bothsubject, "subjectclass"=bothset, "task"=bothy, bothx)






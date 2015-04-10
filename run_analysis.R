## run_analysis.R
## Timothy Johnstone, April 2015
## Analysis script for the final project of Coursera Data Science Series, 
## Course 3: Getting and Cleaning Data 'getdata-013'
## For more information, see the attached README.md and CODEBOOK.md

##THINGS TO REMOVE BEFORE FINAL PUB
setwd("~/Dropbox/Coursera/3_Getting_and_cleaning_data/Projects/UCI HAR Dataset/")
##THINGS TO REMOVE BEFORE FINAL PUB

## Libraries to load - requires plyr
require(tidyr)
## /Libraries to load

##########

# Make a data frame to translate activity numbers into activity names
activitylabels <- read.table('activity_labels.txt', sep="\t", stringsAsFactors = F)
activitylabels <- separate(activitylabels, V1, c("num","label"), " ")
activitylabels$label <- tolower(activitylabels$label)
activitylabels$label <- sub("_","",activitylabels$label)

# Make a data frame to translate feature numbers into feature names
featurelabels <- read.table('features.txt', sep="\t", stringsAsFactors = F)
featurelabels <- separate(featurelabels, V1, c("num","label"), " ")
# Separate out just the features we care about - See note in README!
# The (commented out) version will not include separate mean()-x, mean()-y, and mean()-z vars
# FIX THIS FIX THIS FIX THIS FIX THIS FIX THIS to include mean and sd, properly escape parentheses in grep statement
featurelabelsMeanStd <- featurelabels[c(grep('.mean()', featurelabels$label, fixed=T),grep('.std()', featurelabels$label, fixed=T)),]
# featurelabelsmeanstd <- featurelabels[grep(".mean\\(\\)$|.std\\(\\)$", featurelabels$label),]

# Load in test dataset files
testx <- read.table("test/X_test.txt")
testy <-  read.table("test/y_test.txt")$V1
testsubject <- read.table("test/subject_test.txt")$V1

# Select and label the actual observations


# Properly combine test dataset files



# Load in training dataset files and properly combine
trainx <- read.table("train/X_train.txt")
trainy <-  read.table("train/y_train.txt")$V1
trainsubject <- read.table("train/subject_train.txt")$V1


# Merge test and training dataset




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
featurelabelsMeanStd <- featurelabels[grep(".mean()|.std()", featurelabels$label),]

# Load in test dataset files
# Subvert automatic detection of " " as a separator since we will do the splitting later
testx <- read.table("test/X_test.txt", sep="\t", stringsAsFactors=F)$V1
testy <-  read.table("test/y_test.txt")$V1
testsubject <- read.table("test/subject_test.txt")$V1

# Properly combine test dataset files


# Load in training dataset and properly combine



# Merge test and training dataset




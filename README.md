# cleaningDataProject
Final project for the 'Getting and Cleaning Data' course as part of the Coursera Data Science Specialization (getdata-013)

# Script overview
The purpose of this R script is to prepare a tidy, curated dataset from a large repository of human activity tracking data. More information about this dataset is available at the links in the original assignment description (below). 

The script is written to run inside of the UCI dataset folder assuming no changes to the original file structure. There is a note at the top of the script with a setwd() command that can be modified by the user per their system. 

**R Packages required**: tidyr

The script performs five main operations:
##### 1. Merges the training and the test sets to create one data set.
This is a straightforward operation, as no changes need to be made prior to merging the datasets using rbind. I added an additional factor column (not present in the final output file, but preserved throughout the script run) which stores *test/training* so that these original sets could be recovered later if the user had a reason.
##### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
In the original dataset, there are variables including the phrase *mean* and *std* such as *...meanFreq()...* and *angle(...mean...)*, but which may not represent an actual mean - It was specified in the assignment addendum on the forums that this was open to interpretation. In my case, I took mean features and std features to exclude meanFreq and angle features. 

There was also the possibility of excluding the axis-specific measurements (e.g. *...mean()-X*) and keeping only those averaged across axes, but I felt that that including the separate X, Y, and Z components was most complete. However, a case could be made to exclude them, as they are (in the real world case of a cell phone accelerometer) not really independent as a subject will rarely travel on just one axis, and the accelerometer is likely not consistently oriented/mounted per subject.

This extraction results in 66 measurements per observation.
##### 3. Uses descriptive activity names to name the activities in the data set
Activities are named according to the included activity labels. For cleanliness, these are converted to lowercase and underscores (_) are removed. *I did not fully expand each abbreviation (e.g. used Accel instead of Accelerometer), as this would have resulted in incredibly long variable names.* They are stored as a factor column in the final data frame with the levels preserving the order/identifier (1-6) of the original file provided.
##### 4. Appropriately labels the data set with descriptive variable names. 
Column names are in camel case for readability, with summary operations separated from the descriptive part of the name with a period (.). Periods are allowed symbols in R columns, and this demarcation helps to distinguish between parts of the column name that refer to the measurement type versus summary statistics (e.g. mean, stdev) that have been applied to the measurement data. 
While this does not strictly adhere to Hadley Wickham's style guide, it is much more readable/accessible and improves upon the original variable names. There is more extensive discussion of this point at the following forum link (including a note from the course TA saying this form of variable is appropriate for the assignment) here: https://class.coursera.org/getdata-013/forum/thread?thread_id=154
##### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is another straightforward step - the aggregation is performed using the *aggregate()* function. I took "average" to indicate the arithmetic mean. After fixing column labels, the script then writes the output file into the working directory.


Thanks for reading this far!!


## The original assignment from the course: 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

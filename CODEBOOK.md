---
title: "Codebook for the tidy version of the activity dataset"
author: "Timothy Johnstone"
date: "April, 2015"
output:
  html_document:
    keep_md: yes
---
 
## Project Description
Final project for the 'Getting and Cleaning Data' course as part of the Coursera Data Science Specialization (getdata-013). The purpose of the project is to prepare a tidy, curated dataset from a large repository of human activity tracking data. More information about this dataset is available at the links in the original assignment description in the readme. 
 
##Study design and data processing
 
###Collection of the raw data
Description of how the data was collected.
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/
 
###Cleaning of the data
The script performs five main operations:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

More information and justification of design choices is available in [The README](README.md)
 
##Description of the variables in the tidy_data.txt file
The tidy_data file is a tab-separated text file that is 180Rx68C. The first two columns denote the subject and activity, making up 180 combinations (30 subjects * 6 activities). The other 66 variables are the arithmetic means of a number of summary statistics of activities, as follows:
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
##Sources
Sources you used if any, otherwise leave out.
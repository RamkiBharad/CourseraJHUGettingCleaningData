# Code Book of Getting and Cleaning Data Project 

First download data from below website.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Then unzip the file which will create folder "UCI HAR Dataset". Under this folder few files are there. "activity_labels.txt" file describes activity and features.txt file lists all feature names for which data was collected. Train and test folders holds the data.

run_analysis.R file reads data from train/test folders and merges them. It reads only mean/sd features, which are main interest of this project. Then it does cleanup of feature names and makes them more meaningful. 

Then it applies "melt" function which generates new record for each feature so in short one record gets trasnposed into multuple records. Then we use "dcast" function to calculate average for each subject, activity and feature and bring back all feature names in single record. 
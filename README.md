# Coursera's Getting and Cleaning Data Course offered by John Hopkinson University

The goal of this project assignment was to download the data from below website and tidy up the data. Data is collected for around 30 people who caaried smartphone and had apps running to collect various movement data during various activities like walking, sitting, standing etc. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once above zip file is downloaded and unzipped, run R script "run_analysis.R" uploaded here. This script reads subject/activity data along with train/test data for interested features (mean/sd), merges them, cleans up their column names and then calculates average with grouped by on each feature, subject and activity. 


# Readme
The purpose of this project is to demonstrate the ability to collect, work with, 
and clean a data set. The goal is to prepare tide data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers
from the Samsung Galaxy S smartphone. 

The description of the data set is available here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set used for this project is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The data cleaning includes:

- Merging the training and the test sets to create one data set.

- Extracting only the measurements on the mean and standard deviation for each measurement. 

- Using descriptive activity names to name the activities in the data set

- Appropriate labels the data set with descriptive variable names. 

- Casting independent tidy data set with the average of each variable for each activity and each subject.

Files:
- tidydata.csv -> csv file which contains the tidy data set after cleaning
- CodeBook.md -> markdown file that includes the variables 
- run_analysis.R -> script to process data

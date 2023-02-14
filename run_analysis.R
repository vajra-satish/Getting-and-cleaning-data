# Download the Human Activity Recognition (HAR) data collected from the accelerometers from the Smasung Galaxy S smartphone
library(data.table)
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./data/Smartphone.zip", method="curl")
unzip("./data/Smartphone.zip", exdir="./data/")
# 1 Read the activity labels
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
# 1.1 Check the contents of the activity_labels table
head(activity_labels)
# Two variable names present in the dataset, i.e., V1 & V2
# 1.2 Rename the variable names for the purpose of clarity and description
names(activity_labels)<-c("activity_id", "activity")
# 2. Read the features.txt file
# It contains all the listed features
features<-read.table("./data/UCI HAR Dataset/features.txt")
head(features)
# Here the v2 variable is of interest as it consists the main feature list
# 3. Read the test data
# 3.1 Read the file with the unique subject identifier for test
testsubject_id<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
# The testsubject_id consists of all the subject ids of the participants
# 3.1.1 Rename the column name from V1 to subject_id for more clarity
names(testsubject_id)<-"subject_id"
# 3.2 Read the test labels file
test_labels<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
# The test label file consists of a column with the activity id for each activity (i.e, walking, sitting etc.) from the activity_labels dataset
# 3.2.1 Rename the column name to activity_id 
names(test_labels)<-"activity_id"
# 3.3 Read the test data set
test_set<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
# 3.3.1 Add feature list as the variable names in the test data set
names(test_set)<-features$V2
# 3.4 Bind the test data set
testset<-cbind(testsubject_id, test_set, test_labels)
# 3.5 Only take columns with mean, standard deviation, subject id, and activity id
subset_testset<-testset[,grepl("subject_id|activity_id|mean\\(\\)|std\\(\\)",names(testset))]
# We use \\ to inform R that () is not a metacharacter but rather an expression
# 3.6 Add activity labels in the test data set
final_test<-merge(subset_testset, activity_labels, all=TRUE)
# 4. Read training data
# 4.1 Read the file with the unique subject identifier for training
trainsubject_id<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
# 4.1.1 Rename the column name from V1 to subject_id for more clarity
names(trainsubject_id)<-"subject_id"
# 4.2 Read the training labels file
train_labels<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
# The train labels data set includes a column with the activity id for each activity (i.e, walking, sitting etc.)
# 4.2.1 Rename the column name to activity_id
names(train_labels)<-"activity_id"
# 4.3 Read the training data set
train_set<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
# 4.3.1 Add feature list as the variable names in the train data set
names(train_set)<-features$V2
# 4.4 Bind the train data set
trainset<-cbind(trainsubject_id, train_set, train_labels)
# 4.5 Only take columns with mean, standard deviation, subject id, and activity id
subset_trainset<-trainset[,grepl("subject_id|activity_id|mean\\(\\)|std\\(\\)",names(trainset))]
# 4.6 Add activity labels in the train data set
final_train<-merge(subset_trainset, activity_labels, all=TRUE)
# 5 Merge test and train data set
data_merged<-merge(final_test, final_train, all=TRUE)
# 6. Create a second independent tidy data set with average of each variable of each activity and subject
# 6.1 Load the reshape2 package
library(reshape2)
# 6.2 melt the data while conserving ids (subject_id and activity)
# select column names that will be aggregate
melted_data<-melt(data_merged, id=c("subject_id","activity"), measure.vars=names(data_merged[, 3:68]))
# 6.3 Cast the melted data set with the average of each variable for each avtivity and each subject
tidy_data<-dcast(melted_data, subject_id+activity~variable, mean)
# 7. Write the tidy data set
write.csv(tidy_data, file="tidydata.csv", row.names=FALSE)


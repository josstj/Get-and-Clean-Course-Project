#Getting & Cleaning Data Course Project 
  #Human Activity Recognition Using Smartphones Dataset 

#Project Assignment:
#You should create one R script called run_analysis.R that does the following.

       #1 Merges the training and the test sets to create one data set.  
            #---> data set that gets created is called "all_data"
      
       #2 Extracts only the measurements on the mean and standard deviation for each measurement. 
            #----> "all_data" is updated to only include mean and standard deviations 
      
       #3 Uses descriptive activity names to name the activities in the data set  
            #----> These labels added: Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying
      
       #4 Appropriately labels the data set with descriptive variable names.  
            #---> Variable names are labelled in dataset according to their original names, e.g. tBodyAcc-mean()-X
              #--) note that numbers were added to the variable names 1-543, to link back to the original column_ids in "features" file

       #5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
            #----> "summary_data" is data set that gets created for this final step 


library(data.table)
library(dplyr)
 
######### Download data, unzip it, and retrieve tables from main folder

#hide or unhide the download file and unzip commands as needed, files download and unzip to working directory.

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","getdata%2Fprojectfiles%2FUCI HAR Dataset.zip")
#unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip")

# Read in feature names and ids, and rename columns
features <- tbl_df(fread("UCI HAR Dataset/features.txt"))
features <- rename(features,feature_id=V1,feature = V2)
features$feature_id <- as.character(features$feature_id)

features <- paste(features$feature_id,features$feature, sep = " ")

# Read in activity names and ids, and rename columns
activity_labels <- tbl_df(fread("UCI HAR Dataset/activity_labels.txt"))
activity_labels <- rename(activity_labels,activity_id=V1,activity = V2)

######### Retrieve tables from train data folder

#read in subject ids from training data, and rename columns
subject_train <- tbl_df(fread("UCI HAR Dataset/train/subject_train.txt"))
subject_train <- rename(subject_train,subject=V1)

#read in X_train data, and rename columns
X_train <- tbl_df(fread("UCI HAR Dataset/train/X_train.txt"))
colnames(X_train) <- features

#read in Y_train data, rename, join activity labels.  
Y_train <- tbl_df(fread("UCI HAR Dataset/train/Y_train.txt"))
Y_train <- rename(Y_train,activity_id = V1)
Y_train <- left_join(Y_train,activity_labels,by="activity_id")

#Create vector of train
train_or_test <- rep("train",7352)

#CBind X_train, Y_train, and subject_train
Train <- cbind(train_or_test,subject_train,Y_train,X_train)

######### Retrieve tables from data folder

#read in subject ids from test data, and rename columns
subject_test <- tbl_df(fread("UCI HAR Dataset/test/subject_test.txt"))
subject_test <- rename(subject_test,subject=V1)

#read in X_test data, and rename columns
X_test <- tbl_df(fread("UCI HAR Dataset/test/X_test.txt"))
colnames(X_test) <- features

#read in Y_test data, rename, join activity labels.  
Y_test <- tbl_df(fread("UCI HAR Dataset/test/Y_test.txt"))
Y_test <- rename(Y_test,activity_id = V1)
Y_test <- left_join(Y_test,activity_labels,by="activity_id")

#Create vector of test
train_or_test <- rep("test",2947)

#CBind train_or_test, X_test, Y_test, and subject_test
Test <- cbind(train_or_test,subject_test,Y_test,X_test)

########## RBind Train and Test data tables (long tidy data frame format)

all_data <- rbind(Train,Test)

#Select columns that only inlclude mean and standard deviation

all_data <- select(all_data, contains("train_or_test"),matches("activity"),-contains("activity_id"),contains("subject"),contains("mean"),contains("std"))

#########Creates another tidy data set with average of each variable from above step.

#create a lookup table of the subject id, and whether they were part of train or test group

subject_lookup <- select(all_data,contains("subject"),contains("train_or_test"))
subject_lookup <- unique(subject_lookup[,1:2])

#Group data by subject and activity, temporarily remove "train or test" column
grouped_data <- group_by(all_data,activity,subject)
grouped_data <- select(grouped_data,-contains("train_or_test"))

#takes average of all variables for each unique "subject:activity" combination
summary_data <- summarise_all(grouped_data,funs(mean))

#adds back in the information about whether the subject was part of "train or test" set, and brings that to beginning of df
summary_data <- left_join(summary_data,subject_lookup,by="subject")
summary_data <- select(summary_data,train_or_test,everything())


#clean up and rename names of variables

varnames <- names(summary_data)
varnames <- sub("-","",varnames)
varnames <- sub("\\()","",varnames)
varnames <- sub("mean","Mean",varnames)
varnames <- sub("std","Std",varnames)
varnames <- gsub("[0-9]","",varnames)
colnames(summary_data) <- varnames

#View data

View(summary_data)
View(all_data)

#Export data files to working directory
#write.table(all_data,"all_data.txt", row.names = FALSE)
write.table(summary_data,"summary_data.txt", row.names = FALSE)



# Get-and-Clean-Course-Project

##The code "run_analysis.R" creates a tidy dataset from the "Human Activity Recognition Using Smartphones" Dataset 

The following Data Set and Attribute infromation comes from the following weblink:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: <https://www.youtube.com/watch?v=XOEN9W05_4A>

## Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Guide to create the tidy data file

   1. Download the following dataset into your R working directory:        
        <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
   2. Unzip the file to a new folder within the R working directory.
   3. Run the script "run.analysis.R" located in this repo to create a tidy data set of the original data.   
     
 Note: if you un-comment lines 31 and 32 in the run_analysis.R script, and run the resulting script, the file will download and unzip automatically to the working directory.    
  
### Cleaning of the data
The run_analysis.R script goes through the following steps to create a tidy data set called "summary_data.txt" described in step 5 below:

1. Merges the training and the test sets to create one data set.  
     --> data set that gets created is called "all_data"
      
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
     --> "all_data" is updated to only include mean and standard deviations 
      
3. Uses descriptive activity names to name the activities in the data set  
     --> These labels added: Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying
      
4. Appropriately labels the data set with descriptive variable names.  
     --> Variable names are labelled in dataset according to their original names, e.g. tBodyAcc-mean()-X
     --> note that numbers were added to the variable names 1-543, to link back to the original column_ids in "features" file

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
     --> "summary_data" is data set that gets created for this final step 

## Detailed Steps
 
1. Download data, unzip it, and retrieve tables from main folder
2. Read into R the feature names and ids from the file "features.txt" file, and rename the columns from V1, V2 to  feature_id and feature.
3. Read in activity names and ids from "activity_labels.txt" and rename columns from V1, V2 to "activity", and "activity_id".
4. Retrieve tables from train data sub-folder, and rename the columns 
4.1. Read in subject numbers from training data, and rename columns from V1 to "subject". 
4.2. Read in X_train data, and rename columns using the features table (from step 2). 
5. Read in Y_train data, and join activity labels. 
6. Join Y_train, X_train data, and subject tables.
7. Repeat steps 4-6, but with the test data folder, rather than the train data folder
8. Join the test data set, with the train data set, created in steps 1-7.
9. Select the columns that only include the words "mean" or "std".
10.Group data by subject, and activity variables (to allow for averaging later), and temporarily remove "train_or_test" column
11.Take the average of all of the measurement variables (which have either the word "mean" or "std" in the variable name, and create a summary table of the result, called "summary_data.txt.
12.Add back in the "train_or_test" variable
13. Clean up the variable names in th resulting file, by removing dashes, and parenthesis, and capitalizing the first letters of mean and std.  
14. Export (write.table) the resulting summary dataframe (summary_data.txt)


## Sources

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



# Codebook for R Script to _Tidy_ "Human Activity Recognition Using Smartphones" Data Set 
### Codebook for "run_analysis.r script" and output file called "summary_data.txt"

author: josstj

date: 5/5/18

## Project Description
The run_analysis.R script creates a tidy data set from the the Human Activity Recognition Using Smartphones Data Set, which is available at this link:li

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#>

## Study design and data processing

### Collection of the raw data
(The following text is directly from the website link above)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Notes on the original (raw) data 
A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: 

<https://www.youtube.com/watch?v=XOEN9W05_4A>

## Creating the tidy datafile

### Guide to create the tidy data file

   1. Download the following dataset into your R working directory:        
        <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
   2. Unzip the file to a new folder within the R working directory.
   3. Run the script "run.analysis.R" located in this repo to create a tidy data set of the original data.   
     
 Note: if you un-comment lines 31 and 32 in the run_analysis.R script, and run the resulting script, the file will download and unzip automatically to the working directory.    
  
### Cleaning of the data
The run_analysis.R script goes through the following steps to create a tidy data set called "summary_data.txt" described in step 5 below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description of the variables in the summary_data.txt file

This tidy dataset includes 180 observations of 89 variables  The 89 variables are briefly described below. 
 
### Variable 1: Train_or_Test

This factor variable describes whether the measurements (variables 4-89) recorded on a given row are part of the training data set, or the testing data set.  There are 126 rows of "train" data, and 54 rows of test observations.   

### Variable 2: activity

This variable describes the activity that the subject was doing when the measurements were recorded.  It is a factor variable with the following possible values:

1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying

### Variable 3. subject

This variable is the subject id number which identifies which of the (30) subjects the measurements were taken on. 

### Variables 4 - 89

These variables are the measurement recordings taken on the (30) subjects, in one of the (2) groups (test or train), doing one of the (6) activities.   The measurements include triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration as well as triaxial Angular velocity from the gyroscope. Each value in this dataset represents the average of numerous trials.   The original dataset (all_data) consists of 10,299 observations of 89 rows, but this summary dataset, whose variables are described below, is the average of those 10,299 observations grouped by activity and subject.   

The measurements include:

##### t-Body XYZ coordinate mean variables
|X      | Y      | Z    |
|-------|-------|-------|		
|tBodyAccMeanX	|tBodyAccMeanY|	tBodyAccMeanZ|
|tGravityAccMeanX|	tGravityAccMeanY|	tGravityAccMeanZ|
|tBodyAccJerkMeanX|	tBodyAccJerkMeanY|	tBodyAccJerkMeanZ|
|tBodyGyroMeanX|	tBodyGyroMeanY	|tBodyGyroMeanZ|
|tBodyGyroJerkMean|	tBodyGyroJerkMeanY	|tBodyGyroJerkMeanZ|

##### f-Body XYZ coordinate mean variables
|X      | Y      | Z    |
|-------|-------|-------|	
|fBodyAccMeanX|	fBodyAccMeanY|	fBodyAccMeanZ|
|fBodyAccMeanFreqX|	fBodyAccMeanFreqY	|fBodyAccMeanFreqZ|
|fBodyAccJerkMeanX|	fBodyAccJerkMeanY|	fBodyAccJerkMeanZ|
|fBodyAccJerkMeanFreqX|	fBodyAccJerkMeanFreqY|	fBodyAccJerkMeanFreqZ|
|fBodyGyroMeanX|	fBodyGyroMeanY|	fBodyGyroMeanZ|
|fBodyGyroMeanFreqX|	fBodyGyroMeanFreqY|	fBodyGyroMeanFreqZ|

##### angular gravity XYZ mean variables

|X      | Y      | Z    |
|-------|-------|-------|	
|angle(X,gravityMean)|	angle(Y,gravityMean)|	angle(Z,gravityMean)

##### t-Mag mean variables

|Variable Name|
|-------------|
|tBodyAccMagMean|
|tGravityAccMagMean|
|tBodyAccJerkMagMean|
|tBodyGyroMagMean|
|tBodyGyroJerkMagMean|

##### f-Mag mean variables

|Variable Name|
|-------------|
|fBodyAccMagMean|
|fBodyAccMagMeanFreq|
|fBodyBodyAccJerkMagMean|
|fBodyBodyAccJerkMagMeanFreq|
|fBodyBodyGyroMagMean|
|fBodyBodyGyroMagMeanFreq|
|fBodyBodyGyroJerkMagMean|
|fBodyBodyGyroJerkMagMeanFreq|

##### t-Body angular mean variables

|Variable Name|
|-------------|
|angle(tBodyAccMean,gravity)|
|angle(tBodyAccJerkMean),gravityMean)|
|angle(tBodyGyroMean,gravityMean)|
|angle(tBodyGyroJerkMean,gravityMean)|

##### t-Body XYZ coordinate standard deviation variables
|X      | Y      | Z    |
|-------|-------|-------|	
|tBodyAccStdX|	tBodyAccStdY|	tBodyAccStdZ|
|tGravityAccStdX|	tGravityAccStdY|	tGravityAccStdZ|
|tBodyAccJerkStdX|	tBodyAccJerkStdY|	tBodyAccJerkStdZ|
|tBodyGyroStdX|	tBodyGyroStdY|	tBodyGyroStdZ|
|tBodyGyroJerkStdX|	tBodyGyroJerkStdY|	tBodyGyroJerkStdZ|

##### f-Body XYZ coordinate standard deviation variables
|X      | Y      | Z    |
|-------|-------|-------|	
|fBodyAccStdX|	fBodyAccStdY|	fBodyAccStdZ|
|fBodyAccJerkStdX|	fBodyAccJerkStdY|	fBodyAccJerkStdZ|
|fBodyGyroStdX|	fBodyGyroStdY	|fBodyGyroStdZ|


##### t-Mag standard deviation variables
|Variable Name|
|-------------|
|tBodyAccMagStd|
|tGravityAccMagStd|
|tBodyAccJerkMagStd|
|tBodyGyroMagStd|
|tBodyGyroJerkMagStd|

##### f-Mag standard deviation variables
|Variable Name|
|-------------|
|fBodyAccMagStd|
|fBodyBodyAccJerkMagStd|
|fBodyBodyGyroMagStd|
|fBodyBodyGyroJerkMagStd|

## Sources

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

# Get-and-Clean-Course-Project
---
title: "Codebook"
author: "josstj"
date: "5/5/18"
output:
  html_document:
    keep_md: yes
---

## Project Description
The run_analysis.R script creates a tidy data set from the the Human Activity Recognition Using Smartphones Data Set, which is available at this link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

##Study design and data processing

###Collection of the raw data

(The following text is directly from the website link above)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Notes on the original (raw) data 
A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: 

https://www.youtube.com/watch?v=XOEN9W05_4A

##Creating the tidy datafile

###Guide to create the tidy data file

      1.) Download the following dataset into your R working directory:         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
      2.) Unzip the file to a new folder within the R working directory.
      3.) Run the script "run.analysis.R" to create a tidy data set of this data.   
      
      Note - if you un-comment lines 31 and 32 in the run_analysis.R script, and run the resulting script, the file will download and unzip automatically to the working directory.    
  
###Cleaning of the data
The run_analysis.R script goes through the following steps to create a tidy data set called "summary.txt" described in step 5 below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Description of the variables in the summary_data.txt file
General description of the file:
 - Dimensions of the dataset:  180 observations of 89 variables  
 
 
 
 
 
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

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)

Codebook for Getting and Cleaning Data Project
================
Sharon Puddle  
25 July 2018

Project Description
-------------------

This project is for the Coursera course on Getting and Cleaning Data. purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.  

***
Data Collection
---------------

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone. 

* [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* [Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Notes on the original (raw) data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

These signals were used to estimate variables of the feature vector for each pattern.'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Examples of variables:

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag 

The set of variables that were estimated from these signals include:

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation  
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  

***
Creating the tidy datafile
---------------

### Guide to create the tidy data file
Details about the above variables are outlined in features\_info.txt.

The subjects aere split into 2 groups (Test and Train) and data is split into files accordingly.

Dimensions files:  
* activity.txt  
* features.txt  
* subject\_test.txt  
* subject\_train.txt  
* y\_test.txt (activities data set)  
* y\_train.txt (activities data set)

Fact files:  
* X\_test.txt (signals data set)  
* X\_train.txt (signals data set)


### Cleaning of the data
Read in files listed above. Tidy signal variable names by removing. Combine tables for 2 subject groups, then combine Test and Train data. Reduce data for signal variables with "Mean" or "Std". Create text file of data calculating mean by activity, subject and signal variable.

[ReadMe.md](https://github.com/s-puddle/GettingCleaningDataProject/blob/master/README.md)

***
Description of the variables in the uci_activity_summary.txt file
-------------------------------------------------------
The dataset examined has the following dimensions:

Feature       |    Result
------------- | -------------
No. obs       |    11880
No. variables |      4


# Summary table

------------------------------------------------------------------------------

Variable        |    Class
--------------- | ---------------
[Activity]      |    factor
[Subject]       |   integer
[SignalVar]     |   factor
[SignalVarMean] |   numeric


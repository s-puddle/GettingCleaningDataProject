# Getting and Cleaning Data Project (Coursera)

This is the repository for my Getting and Cleaning Data Project for Coursera 

## run_analysis.R

When run the script will locate files in the "UCI HAR Dataset" subdirectory of the current directory.

# Processing Steps
1. Read in activity_labels.txt and create activity vector.
2. Read in features.txt and create feature label vector. Tidy labels by updating "mean" to "Mean", "std" to "Std", and remove "-".
3. For "test" and "train" groups:
    1. Read in and create subject, activity and signals data sets
    2. Name signals set columns with feature vector
    3. Bind subject, activity and signals data sets
4. Bind test and train data sets and join to activity vector.
5. Reduce data set to only where signal variables contact "Mean" or "Std". Remove "()" from labels.
6. New summary data set - calculate mean by activity, subject and signal var.
7. Create text file of summary data set.

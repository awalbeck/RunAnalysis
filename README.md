Miscellaneous Setup to get URL, download the Samsung ZIP file, then unzip
Then when the file is unzipped, it is in a subfolder

run.analysis.R function:
========================

This function performs the following steps:

1) Read in features ("features.txt") & labels ("activity_labels.txt") files - 2nd variable: V2
2) Find column index to means & standard dev. 
3) Work on TRAIN subfolder
4) Read in X_train.txt; y_train.txt & subject_train.txt files
5) Overwrite the labels with better descriptions
6) Work on TEST subfolder
7) Read in X_test.txt; y_test.txt & subject_test.txt files
8) Overwrite the labels with better descriptions
9) Now go back to the "UCI HAR Dataset/" directory
10) Extract mean and std dev.
11) Merge train + test -> single dataset
12) Create tidy data set: Aggregate, Order then re-Label
13) Write out the newly created "tidy" File

Miscellaneous Setup to get URL, download the Samsung ZIP file, then unzip
Then when the file is unzipped, it is in a subfolder


run.analysis.R function:
     
# Read in features ("features.txt") & labels ("activity_labels.txt") files - 2nd variable: V2
# Find column index to means & standard dev. 
# Work on TRAIN subfolder
# Read in X_train.txt; y_train.txt & subject_train.txt files
# Overwrite the labels with better descriptions
# Work on TEST subfolder
# Read in X_test.txt; y_test.txt & subject_test.txt files
# Overwrite the labels with better descriptions
# Now go back to the "UCI HAR Dataset/" directory
# Extract mean and std dev.
# Merge train + test -> single dataset
# Create tidy data set: Aggregate, Order then re-Label
# Write out File

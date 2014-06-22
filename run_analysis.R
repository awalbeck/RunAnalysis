#----------------------------------------------------------------------------------------
# Miscellaneous Setup
#----------------------------------------------------------------------------------------
library(base)
library(utils)
library(data.table)

# Download Samsung ZIP file and extract it:
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipURL, "zipData")
unzipData <- unzip("zipData")

# Now that the file is unzipped, it is now in this Folder:
setwd("UCI HAR Dataset/")

#----------------------------------------------------------------------------------------
# Function Title:   run.analysis
# Credits:          based on work done by Vladimir84
#----------------------------------------------------------------------------------------
run.analysis <- function () {
# Read in features ("features.txt") & labels ("activity_labels.txt") files - 2nd variable: V2
     features <- read.table("features.txt")["V2"]
     aLabels <- read.table("activity_labels.txt")["V2"]

# Find column index to means & standard dev. 
     indices <- grep("mean|std",features$V2) 

# Work on TRAIN subfolder
     setwd("train/")

# Read in X_train.txt; y_train.txt & subject_train.txt files
     X_train <- read.table("X_train.txt")
     y_train <- read.table("y_train.txt")
     subject_train <- read.table("subject_train.txt")

# Overwrite the labels with better descriptions
     names(X_train) <- features$V2
     names(y_train) <- names(y_train) <- "labels"
     names(subject_train) <- "subjects"

# Work on TEST subfolder
     setwd("../test/")

# Read in X_test.txt; y_test.txt & subject_test.txt files
     X_test <- read.table("X_test.txt")
     y_test <- read.table("y_test.txt")
     subject_test <- read.table("subject_test.txt")

# Overwrite the labels with better descriptions
     names(X_test) <- features$V2
     names(y_test) <- "labels"
     names(subject_test) <- "subjects"

# Now go back to the "UCI HAR Dataset/" directory
     setwd("../../")

# Extract mean and std dev.
     means_and_std_colnames <- colnames(X_test)[indices]
     X_test_subset <- cbind(subject_test,y_test,subset(X_test,select=means_and_std_colnames))
     X_train_subset <- cbind(subject_train,y_train,subset(X_train,select=means_and_std_colnames))

# Merge train + test -> single dataset
     Xy <- rbind(X_test_subset, X_train_subset)

# Create tidy data set: Aggregate, Order then re-Label
     tidy <- aggregate(Xy[,3:ncol(Xy)],list(Subject=Xy$subjects, Activity=Xy$labels), mean)
     tidy <- tidy[order(tidy$Subject),]
     tidy$Activity <- aLabels[tidy$Activity,]

# Write out File
     write.table(tidy, file="./tidydata.txt", sep="\t", row.names=FALSE)
}

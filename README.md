# Getting and Cleaning Data Coursera Course Project

This is the course project for Getting and Cleaning Data, a Coursera course created by John Hopkins University. 

## The **run_analysis.R** script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Process High Level

* Read in the activity labels `data.activity_labels`
* Read in the features `data.features`
* Read in training set data, cbind and label columns using `data.train`
* Read in test set data, cbind and label columns using `data.test`
* Merge test and training data into single long form data table `data`
* Extract just the mean and std values `data.tidy`

## Output of the Analyis 

Output of the tidy dataset can be found in **uci-tidy-dataset.txt** 
 
Or in environment as `View(data)` and `View(data.tidy)`

## CodeBook
View the CodeBook.md for additional details about variables used in **run_analysis.R** 
 
As well as information about how the raw data that was used was collected. 

## Additional Details about Using run_analysis.R

* Download the Data and Unzip
  + `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`
* Read in the activity labels `data.activity_labels<-fread("UCI HAR Dataset/activity_labels.txt")`
  + `head(data.activity_labels)`
 
| V1|V2                 |
|--:|:------------------|
|  1|WALKING            |
|  2|WALKING_UPSTAIRS   |
|  3|WALKING_DOWNSTAIRS |
|  4|SITTING            |
|  5|STANDING           |
|  6|LAYING             |

* Read in the features `data.features<-fread("UCI HAR Dataset/features.txt",select = c("V2"))`
  + `head(data.features)`
 
|V2                |
|:-----------------|
|tBodyAcc-mean()-X |
|tBodyAcc-mean()-Y |
|tBodyAcc-mean()-Z |
|tBodyAcc-std()-X  |
|tBodyAcc-std()-Y  |
|tBodyAcc-std()-Z  |
|tBodyAcc-mad()-X  |
|tBodyAcc-mad()-Y  |
|tBodyAcc-mad()-Z  |
|tBodyAcc-max()-X  |

* Read in training set data, cbind and label columns using `data.train`
  + x_train.txt
  + y_train.txt
  + subject_train.txt
* Read in test set data, cbind and label columns using `data.test`
  + x_test.txt
  + y_test.txt
  + subject_test.txt
* Merge test and training data into single long form data frame `data`
* Extract just the mean and std values
  + `data[,which(!grepl("subject$|activities$|-mean()[^meanFreq]|-std()", colnames(data))):=NULL]`
* Use `data.activity_labels` to replace 1-6 values with WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  + `for (i in 1:length(data.activity_labels[[1]])) {
  data$activities<-gsub(data.activity_labels[[1]][i],data.activity_labels[[2]][i],data$activities)
}`
* Create a tidy data set with just the summarized mean values for each activity and subject
  + `data.tidy <- data %>% group_by(subject,activities) %>% summarize_each(funs(mean))`
* View output of thedatasets using `View(data)` and `View(data.tidy)`
* Also writes the output of `data.tidy` to **uci-tidy-dataset.txt**
  + `write.table(data.tidy, file="uci-tidy-dataset.txt", quote=FALSE, sep='\t', row.names = FALSE)`

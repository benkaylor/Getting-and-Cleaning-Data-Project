# Introduction

This codebook will help you to understand how the **run_analysis.R** script works to create a simple data set and tidy dataset.

# Creating a Tidy Data Set

* Read in the activity labels `data.activity_labels<-fread("UCI HAR Dataset/activity_labels.txt")`

| V1|V2                 |
|--:|:------------------|
|  1|WALKING            |
|  2|WALKING_UPSTAIRS   |
|  3|WALKING_DOWNSTAIRS |
|  4|SITTING            |
|  5|STANDING           |
|  6|LAYING             |

* Read in the features `data.features<-fread("UCI HAR Dataset/features.txt",select = c("V2"))`

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

* Read in training set data, cbind and label columns using `data.features`
  + x_train.txt
  + y_train.txt
  + subject_train.txt
* Read in test set data, cbind and label columns using `data.features`
  + x_test.txt
  + y_test.txt
  + subject_test.txt
* Merge test and training data into single long form data table
* Extract just the mean and std values
  + `data[,which(!grepl("subject$|activities$|-mean()[^meanFreq]|-std()", colnames(data))):=NULL]`
* Use 'data.activity_labels' to replace 1-6 values with WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  + `for (i in 1:length(data.activity_labels[[1]])) {
  data$activities<-gsub(data.activity_labels[[1]][i],data.activity_labels[[2]][i],data$activities)
}`
* Create a tidy data set with just the summarized mean values for each activity and subject
  + `data.tidy <- data %>% group_by(subject,activities) %>% summarize_each(funs(mean))`
* View output of thedatasets using `View(data)` and `View(data.tidy)`
* Also writes the output of `data.tidy` to **uci-tidy-dataset.txt**
  + `write.table(data.tidy, file="uci-tidy-dataset.txt", quote=FALSE, sep='\t', row.names = FALSE)`

## Additional Information About How the Raw Data Was Collected

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

**Table 1: Protocol of activities for the HAR Experiment.**
![](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/5-Table1-1.png)

*Text Source - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones* 
 
*Image Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9* 

 
**Figure 1: Samsung Galaxy S2 Smartphone. (a) arrows show the axis orientation of the accelerometer. (b) the smartphone case and belt used for the experiments**
![](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/5-Figure1-1.png)
*Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9*


* It uses the standard android smartphone coordinate system.
  + X is left side or right side of phone.
  + Y is up or down on phone
  + Z is forward or backward on phone.
* However phone is flipped sideways and hooked on the hip, similar to how a VR headset uses/positions the phone.
  + Therefore X is head or body moving up and down - red
  + Therefore Y is moving head or body left or right - green
  + Therefore Z is moving head or body forward or backward - blue
 
**Figure 2: Human activity recognition experimental setup. Two of the six activities performed during experimentation and their triaxial acceleration signals: (a) walking, (b) walking upstairs.**
![](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/6-Figure2-1.png)

*Image Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9*

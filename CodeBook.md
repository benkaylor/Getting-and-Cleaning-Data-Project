# Introduction

This codebook will help you to understand how the **run_analysis.R** script works to create a simple data set and tidy dataset.

## Process

* Read in the activity labels `data.activity_labels`
* Read in the features `data.features`
* Read in training set data, cbind and label columns using `data.train`
* Read in test set data, cbind and label columns using `data.test`
* Merge test and training data into single long form data table `data`
* Extract just the mean and std values `data.tidy`


## Variables

* Global
  + `data.activity_labels` - Reads activity_labels.txt and labels
  + `data.features` - reads features.txt and labels data.train.x and data.test.x
  + `data` - merges data from `data.train` and `data.test` into single dataset, filtered for mean and std column values
  + `data.tidy` - summarized tidy data grouped by subject and activity, and mean value taken of remaining columns

* Training Data Specific
  + `data.train.x` - raw measurements from X_train.txt
  + `data.train.y` - raw activity type from y_train.txt
  + `data.train.subject` - raw subject from subject_train.txt
  + `data.train` - merges data.train.y, data.train.x, and data.train.subject

* Test Data Specific
  + `data.test.x` - raw measurements from X_test.txt
  + `data.test.y` - raw activity type from y_test.txt
  + `data.test.subject` - raw subject from subject_test.txt
  + `data.test` - merges data.test.y, data.test.x, and data.test.subject
  + `data.test` - merges data.test.y, data.test.x, and data.test.subject

## Output

* `uci-tidy-dataset.txt` is 180x68 data frame
  + `data.tidy$subject` column is the anonymous representation of the person participating in the experiment
  + `data.tidy$activities` column is the type of 6 activities that the subject was attempting
  + The remaining 66 columns are the mean for each measurement taken from the device the subject was wearing, where the measurement already represented a mean or std.

### Additional Information About How the Raw Data Was Collected

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

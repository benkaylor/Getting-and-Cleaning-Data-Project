# Introduction

This codebook will help you to understand how the **run_analysis.R** script works.

# Creating a Tidy Data Set

run_analysis.R s used to download the UCI HAR Dataset, unzip the data and create a tidy dataset.
It will unzip the data, and merge the training and test set into a single dataset.
It labels the columns of variables based on the features and activities that were collected.
It filters for those columns that are specific to mean and std.

It outputs to datasets, "data" and "data.tidy". 
"data"" is a single, long form data table that contains the merge test and traind data appropriately labeled.
"data.tidy" is a tidy dataset that filters out columns that are not dealing directly with mean and std. It then groups and creates a summarized mean of each measurement for the activity and subject.



## Data Set Information:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

![Figure 1: Samsung Galaxy S2 Smartphone. (a) arrows show the axis orientation of the accelerometer. (b) the smartphone case and belt used for the experiments](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/5-Table1-1.png)

Text Source - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Image Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9 

 
![Figure 1: Samsung Galaxy S2 Smartphone. (a) arrows show the axis orientation of the accelerometer. (b) the smartphone case and belt used for the experiments](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/5-Figure1-1.png)
 
Image Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9


* Red for the X axis, green for Y and blue for Z. It uses the standard android smartphone coordinate system.
  + X is left side or right side of phone.
  + Y is up or down on phone
  + Z is forward or backward on phone.
* However phone is flipped sideways and hooked on the hip, similar to how a VR headset uses/positions the phone.
  + Therefore X is head or body moving up and down - red
  + Therefore Y is moving head or body left or right - green
  + Therefore Z is moving head or body forward or backward - blue
 
![Figure 2: Human activity recognition experimental setup. Two of the six activities performed during experimentation and their triaxial acceleration signals: (a) walking, (b) walking upstairs.](https://ai2-s2-public.s3.amazonaws.com/figures/2016-03-25/dc7024840a4ba7ab634517fae53e77695ff5dda9/6-Figure2-1.png)

Image Source - https://www.semanticscholar.org/paper/Energy-Efficient-Smartphone-Based-Activity-Anguita-Ghio/dc7024840a4ba7ab634517fae53e77695ff5dda9

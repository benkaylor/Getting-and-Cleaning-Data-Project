## Getting and Cleaning Data Coursera Course Project

##run_analysis.R 

run_analysis.R s used to download the UCI HAR Dataset, unzip the data and create a tidy dataset.
It will unzip the data, and merge the training and test set into a single dataset.
It labels the columns of variables based on the features and activities that were collected.
It filters for those columns that are specific to mean and std.

It outputs to datasets, "data" and "data.tidy". 
"data"" is a single, long form data table that contains the merge test and traind data appropriately labeled.
"data.tidy" is a tidy dataset that filters out columns that are not dealing directly with mean and std. It then groups and creates a summarized mean of each measurement for the activity and subject.



##uci-tidy-dataset.csv


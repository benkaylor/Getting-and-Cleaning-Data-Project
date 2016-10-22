#Download the Zip Files
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Human+Activity+Recognition+Using+Smartphones.zip")
unzip("Human+Activity+Recognition+Using+Smartphones.zip", exdir = ".", unzip = "internal")

#Required Packages to run
library(data.table)
library(dplyr)

# Read in the Features and Activity Labels
data.activity_labels<-fread("UCI HAR Dataset/activity_labels.txt")
data.features<-fread("UCI HAR Dataset/features.txt",select = c("V2"))
#data.features_info<-fread("UCI HAR Dataset/features_info.txt")

# Read in Training Set (UCI HAR Dataset/train/x_train.txt) and Training Labels (UCI HAR Dataset/train/y_train.txt)

# Read in Training Set and Label Columns
data.train.x <- fread("UCI HAR Dataset/train/X_train.txt")
names(data.train.x) <- as.vector(unlist(data.features))

#Read in Subject and Activity, Label columns
data.train.y <- fread("UCI HAR Dataset/train/y_train.txt")
names(data.train.y) <- c("activities")
data.train.subject <- fread("UCI HAR Dataset/train/subject_train.txt")
names(data.train.subject) <- c("subject")

#Merge 2 Additional Columns for Activity and Experiment Volunteer to Training Set
data.train <- cbind(data.train.y,data.train.x)
data.train <- cbind(data.train.subject,data.train)

# Remove unnecessary Training Set data.frames from workspace
rm(data.train.x)
rm(data.train.y)
rm(data.train.subject)

# Read in Test Set (UCI HAR Dataset/test/x_train.txt) and Training Labels (UCI HAR Dataset/train/y_train.txt)

# Read in Test Set and Label Names
data.test.x <- fread("UCI HAR Dataset/test/X_test.txt")
names(data.test.x) <- as.vector(unlist(data.features))

#Read in Subject and Activity, Label columns
data.test.y <- fread("UCI HAR Dataset/test/y_test.txt")
names(data.test.y) <- c("activities")
data.test.subject <- fread("UCI HAR Dataset/test/subject_test.txt")
names(data.test.subject) <- c("subject")

#Bind 2 Additional Columns for Activity and Experiment Volunteer to Test Set
data.test <- cbind(data.test.y,data.test.x)
data.test <- cbind(data.test.subject,data.test)

# Remove unnecessary Test set data.frames from workspace
rm(data.test.x)
rm(data.test.y)
rm(data.test.subject)


#Merge the training and the test sets to create one data set.

#Bind Train and Test set
data<-rbind(data.train,data.test)


#Extracts only the measurements on the mean and standard deviation for each measurement.

data[,which(!grepl("subject$|activities$|-mean()[^meanFreq]|-std()", colnames(data))):=NULL]

#Iterate through data and label the activity with descriptive variable instead of 1:6 e.g. SITTING/STANDING/LAYING

for (i in 1:length(data.activity_labels[[1]])) {
  data$activities<-gsub(data.activity_labels[[1]][i],data.activity_labels[[2]][i],data$activities)
}


# Create a tidy data set, group activity with subject and find mean of each variable.

data.tidy <- data %>% group_by(subject,activities) %>% summarize_each(funs(mean))

View(data)
View(data.tidy)

write.table(data.tidy, file="uci-tidy-dataset.txt", quote=FALSE, sep='\t', row.names = FALSE)
#write.table(data.tidy, file="uci-tidy-dataset.csv", quote=FALSE, sep=',', row.names = FALSE)

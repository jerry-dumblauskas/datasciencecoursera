#1Merges the training and the test sets to create one data set.
l_tst_dt       <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
l_tst_person   <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
l_tst_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="")

l_trn_dt       <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
l_trn_person   <- read.table("./UCI HAR Dataset/train/subject_test.txt", sep="")
l_trn_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
#2Extracts only the measurements on the mean and standard deviation for each measurement. 
#3Uses descriptive activity names to name the activities in the data set
#4Appropriately labels the data set with descriptive variable names. 
#5From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

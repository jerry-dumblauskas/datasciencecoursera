# 1 Merges the training and the test sets to create one data set.
# We will pull both the test and training data into data frames
# THIS CODE MUST RUN IN A DIRECTORY WHERE THE 'UCI HAR Dataset' FOLDER IS LOCATED!
library(dplyr)
# create basic column names
# we are going to make a logical vector mask that will use to keep the columns we want (the mean and std cols)
l_features       <- read.table("./UCI HAR Dataset/features.txt", sep="")
col_chs<-grepl('std\\(|mean\\(', l_features[[2]] )
msk<-c(TRUE,TRUE)
final_msk<- append(msk, col_chs)

# Uses descriptive activity names to name the activities in the data set
l_act_names <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
nice_act_name <- function (in_df)
{
    in_mtx = matrix(nrow=nrow(in_df), ncol=1)
    x<-1
    for (l_row in in_df[[1]]) {
        in_mtx[x,] <- look_up_stuff(l_row)
        x<-x+1
    }
    rtn<-data.frame(in_mtx)
    colnames(rtn) <- c("activity")
    rtn
    
}

look_up_stuff <- function (in_num)
{
    as.character(subset(l_act_names$V2, l_act_names$V1 == in_num) )
}

# pull in the test data and combine
# rename the person and activity columns
# format will be
# person_id, activity, 561 obs
l_tst_dt        <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", check.names = FALSE, col.names=l_features[[2]])
l_tst_person    <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="", col.names="person_id")
l_tst_activity  <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="", col.names="activity")
l_tst_activity1 <-nice_act_name(l_tst_activity)

l_tst_all <- cbind(l_tst_person, l_tst_activity1, l_tst_dt)

# pull in the train data and combine
# rename the person and activity columns
# format will be
# person_id, activity, 561 obs

l_trn_dt        <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", check.names = FALSE, col.names=l_features[[2]])
l_trn_person    <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="", col.names="person_id")
l_trn_activity  <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="", col.names="activity")
l_trn_activity1 <- nice_act_name(l_trn_activity)

l_trn_all <- cbind(l_trn_person, l_trn_activity1, l_trn_dt)

#1 rbind and have one big data set!
l_total_dataset <- rbind(l_tst_all, l_trn_all)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
FINAL_DATA_SET <- subset(l_total_dataset, select=final_msk)

# 4Appropriately labels the data set with descriptive variable names. 
#This funtion will apply some regular expressions to clean up the variable names
transform_col_names <- function (in_names)
{
    in_mtx = matrix(nrow=length(in_names), ncol=1)
    x<-1
    for (l_row in in_names) {
        l_row <- gsub('^f', 'frequency ', l_row)
        l_row <- gsub('^t', 'time ', l_row)
        l_row <- gsub('Mag', ' Magnitude ', l_row)    
        l_row <- gsub('BodyAcc', 'Body Acceleration ', l_row)
        l_row <- gsub('GravityAcc', 'Gravity Acceleration ', l_row)
        l_row <- gsub('BodyGyro', 'Body Gyroscope ', l_row)
        l_row <- gsub('std', 'standard deviation', l_row)
        l_row <- gsub('BodyBody', 'Body ', l_row)
        l_row <- gsub('-', ' ', l_row)
        l_row <- gsub('\\(\\)', '', l_row)
        l_row <- gsub('  ', ' ', l_row)
        
        in_mtx[x,] <- l_row
        x<-x+1
    }
    in_mtx[,1]
}

# call and apply the variable name cleanup function
temp_bs <- transform_col_names(colnames(FINAL_DATA_SET))
colnames(FINAL_DATA_SET) <- temp_bs

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
PART5<-group_by(FINAL_DATA_SET, person_id, activity)
PART5_FINAL <- summarise_each(PART5, funs(mean))
write.table(PART5_FINAL, "Q5.txt", row.name=FALSE)
This CodeBook lists the variables included in both tidy_data.txt and 
summarazied_tidy_data.txt. The Variable names are almost identical 
across the two, with the exception that the summary data does not include
the data_set variable, and the values for each column in the summarized
data set have collapsed all values in the tidy data set down to the mean
per subject_id and activity.

## tidy_data.txt

### subject_id
Type: Categorical

Description: Unique ID identifying the person in the experiment

### data_set
Type: Categorical

Values: "test" or "train"

Description: Subjects were divided into two groups. This variable identifies which group the subject was in.


### activity
Type: Categorical

Values: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

Description: indicates the type of activity that the individual was undertaking

### Measurements
Type: Numeric
Description: The remaining set of variables are the measurements taken from
the sensors in the Galaxy phone use in the experiment. Of the original set of
measurements, this data set has been stripped down to only the means and 
standard deviations from each measurement. The complete list is as follows:

* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-std()
* tGravityAccMag-std()
* tBodyAccJerkMag-std()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-std()
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-std()
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyAccMag-mean()
* tGravityAccMag-mean()
* tBodyAccJerkMag-mean()
* tBodyGyroMag-mean()
* tBodyGyroJerkMag-mean()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyAccMag-mean()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroJerkMag-mean()

## summarized_tidy_data.txt
See the description for the tidy_data.txt file for each one of these variables.
The difference is that for each combination of subject_id and activity, there
is only one value across each variable. This value is the mean of all the values
for that subject/activity pair as listed in the tidy_data.txt file.
## Code Book for Course Project - Getting and Cleaning Data
(<a href="https://www.coursera.org/course/getdata">Coursera.org, Johns Hopkins University, Data Science Specialization</a>)

They can be found <a href='http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'>here</a> along with more information on the data.

## Feature Description from UCI Machine Learning 

The following description of the features comes from the dataset documentation file "features_info.txt" and can be found with the original data <a href='http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'>here</a>

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## run_analysis.R Description

1. Read in the list of feature names from "features.txt."  These are used to give the dataset descriptive column names.

2. Read in all the necessary training and testing datasets using read.table().  The following files are used:
	
	* 'UCI HAR Dataset/train/X_train.txt'
	* 'UCI HAR Dataset/train/y_train.txt'
	* 'UCI HAR Dataset/train/subject_train.txt'
	* 'UCI HAR Dataset/test/X_test.txt'
	* 'UCI HAR Dataset/test/y_test.txt'
	* 'UCI HAR Dataset/test/subject_test.txt'

3. Use cbind to merge columns of X, Y, and subject labels for both training and testing.  This results in one dataframe for training data and one for testing data.

4. Use rbind to combine training and testing dataframes.

5. Give activities their descriptive labels:
	* 1 = 'WALKING
	* 2 = 'WALKING_UPSTAIRS'
	* 3 = 'WALKING_DOWNSTAIRS'
	* 4 = 'SITTING'
	* 5 = 'STANDING'
	* 6 = 'LYING'

6. From the available features, we're only concerned with means and standard deviations for each feature type.  This includes any of the features that use "mean()" or "std()" in the feature name.  grep() is used to to extract the features that include these strings in the feature name, and a new dataframe is created using these features as well as the subject and activity features.


7. group_by() is used to group the data by subject and activity.


8. summarise_each() is used to create a dataframe that includes only the average of each feature by subject and activity.

9. Write the summary table to a .txt file using write.table().

## Output dataset "summary.txt"

The averages of the variable means and standard deviations (mean() and std() in feature names) are included in the "summary.txt" file for each subject/activity pair and for each direction (X, Y, and Z) as applicable.  The following features are included in the summary table.

	"Subject"
	"Activity"
	"tBodyAcc.mean...X"
	"tBodyAcc.mean...Y"
	"tBodyAcc.mean...Z"
	"tGravityAcc.mean...X"
	"tGravityAcc.mean...Y"
	"tGravityAcc.mean...Z"
	"tBodyAccJerk.mean...X"
	"tBodyAccJerk.mean...Y"
	"tBodyAccJerk.mean...Z"
	"tBodyGyro.mean...X"
	"tBodyGyro.mean...Y"
	"tBodyGyro.mean...Z"
	"tBodyGyroJerk.mean...X"
	"tBodyGyroJerk.mean...Y"
	"tBodyGyroJerk.mean...Z"
	"tBodyAccMag.mean.."
	"tGravityAccMag.mean.."
	"tBodyAccJerkMag.mean.."
	"tBodyGyroMag.mean.."
	"tBodyGyroJerkMag.mean.."
	"fBodyAcc.mean...X"
	"fBodyAcc.mean...Y"
	"fBodyAcc.mean...Z"
	"fBodyAcc.meanFreq...X"
	"fBodyAcc.meanFreq...Y"
	"fBodyAcc.meanFreq...Z"
	"fBodyAccJerk.mean...X"
	"fBodyAccJerk.mean...Y"
	"fBodyAccJerk.mean...Z"
	"fBodyAccJerk.meanFreq...X"
	"fBodyAccJerk.meanFreq...Y"
	"fBodyAccJerk.meanFreq...Z"
	"fBodyGyro.mean...X"
	"fBodyGyro.mean...Y"
	"fBodyGyro.mean...Z"
	"fBodyGyro.meanFreq...X"
	"fBodyGyro.meanFreq...Y"
	"fBodyGyro.meanFreq...Z"
	"fBodyAccMag.mean.."
	"fBodyAccMag.meanFreq.."
	"fBodyBodyAccJerkMag.mean.."
	"fBodyBodyAccJerkMag.meanFreq.."
	"fBodyBodyGyroMag.mean.."
	"fBodyBodyGyroMag.meanFreq.."
	"fBodyBodyGyroJerkMag.mean.."
	"fBodyBodyGyroJerkMag.meanFreq.."
	"tBodyAcc.std...X"
	"tBodyAcc.std...Y"
	"tBodyAcc.std...Z"
	"tGravityAcc.std...X"
	"tGravityAcc.std...Y"
	"tGravityAcc.std...Z"
	"tBodyAccJerk.std...X"
	"tBodyAccJerk.std...Y"
	"tBodyAccJerk.std...Z"
	"tBodyGyro.std...X"
	"tBodyGyro.std...Y"
	"tBodyGyro.std...Z"
	"tBodyGyroJerk.std...X"
	"tBodyGyroJerk.std...Y"
	"tBodyGyroJerk.std...Z"
	"tBodyAccMag.std.."
	"tGravityAccMag.std.."
	"tBodyAccJerkMag.std.."
	"tBodyGyroMag.std.."
	"tBodyGyroJerkMag.std.."
	"fBodyAcc.std...X"
	"fBodyAcc.std...Y"
	"fBodyAcc.std...Z"
	"fBodyAccJerk.std...X"
	"fBodyAccJerk.std...Y"
	"fBodyAccJerk.std...Z"
	"fBodyGyro.std...X"
	"fBodyGyro.std...Y"
	"fBodyGyro.std...Z"
	"fBodyAccMag.std.."
	"fBodyBodyAccJerkMag.std.."
	"fBodyBodyGyroMag.std.."
	"fBodyBodyGyroJerkMag.std.."	

Below is a sample of the resulting summary table. 

Subject | Activity             | tBodyAcc-mean()-X |  ... |
 ------ | -------------------- | ----------------- | ---- |
1       | 'WALKING'            | 0.2773308         |  ... |
1       | 'WALKING_UPSTAIRS'   | 0.2554617         |  ... |
1       | 'WALKING_DOWNSTAIRS' | 0.2891883         |  ... |
...     | ...                  | ...               |  ... |


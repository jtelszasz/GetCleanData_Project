
# Read in the feature names but don't bring in the first column
feature_names <- read.table('UCI HAR Dataset/features.txt',
                            colClasses = c("NULL","character"))

# Read in all the necessary training and testing datasets
X_train <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=feature_names$V2)
Y_train <- read.table('UCI HAR Dataset/train/y_train.txt', col.names='Label')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names='Subject')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=feature_names$V2)
Y_test <- read.table('UCI HAR Dataset/test/y_test.txt', col.names='Label')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names='Subject')

# Use cbind to merge columns of X, Y, and subject labels for both train and test
train <- cbind(X_train, Y_train, subject_train)
test <- cbind(X_test, Y_test, subject_test)

# Use rbind to merge training and testing sets together
full_set <- rbind(train, test)

# Give activities their descriptive labels
full_set$Activity[full_set$Label == 1] = 'WALKING'
full_set$Activity[full_set$Label == 2] = 'WALKING_UPSTAIRS'
full_set$Activity[full_set$Label == 3] = 'WALKING_DOWNSTAIRS'
full_set$Activity[full_set$Label == 4] = 'SITTING'
full_set$Activity[full_set$Label == 5] = 'STANDING'
full_set$Activity[full_set$Label == 6] = 'LYING'

# Pull out only the columns we care about (means and std. devs.) including
# the subject and activity labels
red_set <- cbind( full_set[ , grep('mean()', names(full_set)) ],
                  full_set[ , grep('std()', names(full_set)) ],
                  'Subject'=full_set$Subject,
                  'Activity'=full_set$Activity)

# Group the data by subject and activity
by_subj_activity <- group_by(red_set, Subject, Activity)

# Create data frame that stores only the means of each variable by subject
# and activity
summary <- summarise_each(by_subj_activity, funs(mean))

# Write the summary table to a .txt file
write.table(summary, file = 'summary.txt', row.names=FALSE)


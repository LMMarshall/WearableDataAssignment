## A script to combine the training and test data sets of
## smartphone accelerometer data together and extract just the
## standard-deviation and mean measurements

## Load necessary packages
library(dplyr)
library(data.table)
library(stringr)

## Pull in activity label data for test and training sets and bind them
## into one data.table
training_labels <- fread("./train/y_train.txt", header = FALSE, col.names = 
                             "act")
test_labels <- fread("./test/y_test.txt", header = FALSE, col.names =
                         "act")
activity_labels <- rbind(training_labels, test_labels)

# Pull in the activity labels file and use it to rename the activities 
# to be descriptive
activity_index <- fread("activity_labels.txt")
rename_function <- function(x){x <- activity_index[x,2]}
activity <- sapply(activity_labels$act, rename_function)
activity <- unlist(activity)
activity_labels2 <- cbind(activity, activity_labels)
activity_labels2 <- select(activity_labels2, 1)

## Pull in participant identification data
subject_train <- fread("./train/subject_train.txt", header = FALSE, col.names = 
                           "participant")
subject_test <- fread("./test/subject_test.txt", header = FALSE, col.names = 
                          "participant")
participant_dt <- rbind(subject_train, subject_test)

## Import feature list, identify std- and mean-related features, and store
## their indices in a vector
features <- fread("features.txt")
features <- as.vector(features$V2)
std_features <- grep("std", features)
mean_features <- grep("mean", features)
features_to_extract <- sort(c(mean_features,std_features))

## Import training and test set data; add column names;
## select only the columns that correspond to the std and mean measurements
training_set <- fread("./train/X_train.txt", col.names=features)
train_dt <- training_set[, features_to_extract, with=FALSE]
test_set <- fread("./test/X_test.txt", col.names=features)
test_dt <- test_set[, features_to_extract, with=FALSE]

## Bind test and training data into a single table with feature list as col names
full_dt <- rbind(train_dt, test_dt)

## Bind activity label and participant id data to the same table
full_dt <- cbind(participant_dt, activity_labels2, full_dt)

## Rename columns to fix unwieldy punctuation
colz <- names(full_dt)
colz <- gsub("\\(\\)", "_", colz)
colz <- gsub("-", "_", colz)
colz <- gsub("__", "_", colz)
colz <- gsub("_$", "", colz)
names(full_dt) <- colz

## Put the rows in tidy order based on participant ID number
full_dt <- arrange(full_dt, participant)

## Save as file
write.table(full_dt, file = "std_mean.txt", row.names = FALSE)

##-----------------------------------------------------
## An independent data set based on full_dt above
## that shows the avg of each variable for each participant per activity

# Pull in the std_mean table
wearable_data <- fread("std_mean.txt", header = TRUE)

# Retrieve the mean per variable for each participant in each activity
avgs_by_participant <- wearable_data %>% 
  group_by(participant, activity) %>% 
  summarise_each(funs(mean), tBodyAcc_mean_X:fBodyBodyGyroJerkMag_meanFreq)

# Save the results to file
write.table(avgs_by_participant, file = "means.txt", row.names = FALSE)
features <- read.table("features.txt", head = F)
X_train <- read.table("train\\X_train.txt", head = F)
Y_train <- read.table("train\\Y_train.txt", sep = " ", head = F)
subject_train <- read.table("train\\subject_train.txt", sep = " ", head = F)
X_test <- read.table("test\\X_test.txt", head = F)
Y_test <- read.table("test\\Y_test.txt", sep = " ", head = F)
subject_test <- read.table("test\\subject_test.txt", head = F)


##1. Merges the training and the test sets to create one data set.
names(Y_test) <- "Activity"
names(Y_train) <- "Activity"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"
names(X_test) <- features$V2
names(X_train) <- features$V2

dataset <- cbind(rbind(Y_test, Y_train),rbind(subject_test, subject_train),rbind(X_test, X_train))

rm(X_test)
rm(X_train)
rm(Y_test)
rm(Y_train)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std <- dataset[,grep(features$V2,pattern = "Activity|Subject|mean|std")]

##3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt", head = F)
mean_std$Activity <- activity[mean_std$Activity,2]


##4. Appropriately labels the data set with descriptive variable names.
##done in 1

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- aggregate(. ~ Activity + Subject, data = mean_std, mean)
write.table(x = tidy, file = "tidy.txt",  row.names=FALSE) 




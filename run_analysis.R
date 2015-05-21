
#download data to application
testlables <- read.table(file.path("UCI HAR Dataset", "test" , "y_test.txt" ),header = FALSE)
testset <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE)
subjecttest <- read.table(file.path("UCI HAR Dataset", "test" , "subject_test.txt" ),header = FALSE)
traininglables <- read.table(file.path("UCI HAR Dataset", "train" , "y_train.txt" ),header = FALSE)
trainingset <- read.table(file.path("UCI HAR Dataset", "train" , "X_train.txt" ),header = FALSE)
subjecttrain <- read.table(file.path("UCI HAR Dataset", "train" , "subject_train.txt" ),header = FALSE)
#merge data
xdata <- rbind(trainingset, testset)
ydata <- rbind(traininglables, testlables)
subjectdata <- rbind(subjecttrain, subjecttest)
#process features
feature <- read.table(file.path("UCI HAR Dataset", "" , "features.txt" ),header = FALSE)
names(xdata)<- feature$V2
meanstdonly <- grep("-(mean|std)\\(\\)", feature[, 2])
xdata <- xdata[,meanstdonly]
names(xdata) <- feature[meanstdonly, 2]
#process activity
activitylabel <- read.table(file.path("UCI HAR Dataset", "" ,"activity_labels.txt"),header = FALSE)
names(ydata)<-c("activity")
ydata[, 1] <- activitylabel[ydata[, 1], 2]
#process subject
names(subjectdata)<-c("subject")
#merge data futher
fulldata <- cbind(xdata, ydata, subjectdata)
#tidy data
tidy<-aggregate(. ~subject + activity, fulldata, mean)
tidy<-tidy[order(tidy$subject,tidy$activity),]
write.table(tidy, "tidydata.txt", row.name=FALSE)
#merge data
#Firstly unzip the zipfiles
unzip("getdata-projectfiles-UCI HAR Dataset")
#create a empty data
mergedata<-data.frame()
#read data from different files
#read data about features
fea<-read.table("UCI HAR Dataset/features.txt")
#read subject data from test files
testsub<-read.table("UCI HAR Dataset/test/subject_test.txt")
#read  561-feature vector with time and frequency domain variables from test.
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
#read  561-feature vector with time and frequency domain variables from train.
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
# read subject data from train files
trainsub<-read.table("UCI HAR Dataset/train/subject_train.txt")
# use cbind to merge subject and 561-feature data, and then use rbind to merge test and 
# train data
mergedata<-rbind(cbind(testsub,X_test),cbind(trainsub,X_train))
# Because the name of all features are not character, use as.character to convert it into
#character.
fea$V2<-as.character(fea$V2)
#in point 4 ,we need labels the data set with descriptive variable names.
#beacuse the second column of fea is the name of thess varianles, use it as colnames
colnames(mergedata)<-c('subject',fea$V2)
#in point 2, i need to extracts only the measurements on the mean 
#and standard deviation for each measurement. So i extracts column contains mean and
#std seperately, then merge them.
selectdata01<-mergedata[,grepl("mean",colnames(mergedata))]
selectdata02<-select(mergedata[,grepl("std",colnames(mergedata)))]
selectdata<-cbind(subject=mergedata$subject,selectdata01,selectdata02)
#In point 3,Uses descriptive activity names to name the activities in the data set
#So it require us to read the labels which stand for the activities.
# read test labels
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
#read train labels
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
#merge these test and train labels with rbind
y<-rbind(y_test,y_train)
#read the name of these activities with labels
labels<-read.table("UCI HAR Dataset/activity_labels.txt")
#add a new column to the y which specify the name of activity via matching the 
#labels with it's corresponding activity name
y$activity<-labels[y$V1,2]
# merge data about descriptive activity names with the data set using cbind
labelsdata<-cbind(selectdata,y)
#in point 5, we need to create a new tidy data set 
#with the average of each variable for each activity and each subject.

library(dplyr)
#group data by subject and activity
tidydata<-group_by(labelsdata,subject,activity)

#sumarise data for each measurment varibles
 
tidydata<-summarise_each(tidydata,c("mean"))
#Save tidydata as a txt files
write.table(tidydata,"tidydata.txt",row.names = FALSE)

  

library(plyr)
if(!file.exists("data"))
{
  dir.create("data")
}
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

x_train <- read.table("data/train/X_train.txt")
x_test <- read.table("data/test/X_test.txt")


y_test <- read.table("data/test/y_test.txt")
y_train <- read.table("data/train/y_train.txt")

s_test <- read.table("data/test/subject_test.txt")
s_train <- read.table("data/train/subject_train.txt")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

activity <- read.table("data/activity_labels.txt")
features <- read.table("data/features.txt")

meanstd <- c(grep("-(mean|std)\\(\\)", features[, 2]))
x_data <- x_data[, meanstd]
names(x_data) <- features[meanstd, 2]

y_data[, 1] <- activity[y_data[, 1], 2]
names(y_data) <- "activity"

names(s_data) <- "subject"
all_data <- cbind(x_data, y_data)
all_data<-cbind(all_data, s_data)

data<-aggregate(. ~subject + activity, all_data, mean)
data<-data[order(data$subject,data$activity),]

write.table(data, file = "tidydata.txt",row.name=FALSE)

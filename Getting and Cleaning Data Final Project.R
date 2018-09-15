##  Getting and Cleaning Data Project
##  Read in Text Files
##  I moved some data from subfolders to make it easier to read
testdata <- read.table("X_test.txt", header = FALSE, sep = "")
traindata <- read.table("X_train.txt", header = FALSE, sep = "")
## Now read in the exercise label # for these tables
testactivity <- read.table("Y_test.txt",header=FALSE,sep="")
trainactivity <- read.table("Y_train.txt",header=FALSE,sep="")
## Get the Activity Labels which associate with these observations
activitylabels <- read.table("activity_labels.txt")
## Merge these tables with the Activity Labels to get a more descriptive (tidy)
mergetest <- merge(testactivity,activitylabels)
testactivity <- mergetest$V2
mergetraining <- merge(trainactivity, activitylabels)
trainactivity <- mergetraining$V2
##Now read in the subject data
subjecttrain <- read.table("subject_train.txt")
subjecttest <- read.table("subject_test.txt")
## Now lets gets the column names
features <- read.table("features.txt")
## Need to find the rows which relate to mean or std. Use grep
meanstdrows <- grep("*mean|std*",features$V2)
## Store the measure names
measures <- features$V2[meanstdrows]
## Clean up the names per Tidy Data rules by removing dashes and parenthesis
measuresTidy <- gsub("*-|\\(|\\)","",measures)
measuresTidyMore <- gsub("mean","Mean",measuresTidy)
## Now Rename the Columns
## I Created My Own Names for Subject and Exercise columns
names(alldata)[1] <- "SubjectID"
names(alldata)[2] <- "Activity"
names(alldata)[3:81] <- measuresTidyMore
## Begin Building the Full Data Table using cbind and rbing
alltestdata <- cbind(subjecttest,testlabels,testdata[meanstdrows])
alltraindata <- cbind(subjecttrain,trainlabels,traindata[meanstdrows])
alldata <- rbind(alltestdata,alltraindata)
## Now to Summarize the data use the summarize_all function from dplyr
summarytableSubject <- alldata %>% group_by(SubjectID) %>% summarize_all(mean)
summarytableActivity <- alldata %>% group_by(Activity) %>% summarize_all(mean)




#Load dplyr
library(dplyr)
#Read the features.text file - This will give us the column names of the data contained 
#within the X_test.txt and X_train.txt
ftrs_df <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
#Create filter criterias
fltr_crt1 <- c("mean()")
fltr_crt2 <- c("std()")
#-------------------------------------------------------------------------------------#

#TEST DATA
#Read the test set into a data frame
x_tst_df <- read.table("UCI HAR Dataset/test/X_test.txt", 
                       sep = "", header=FALSE)
#Assign column names to x_tst_df
colnames(x_tst_df) <- c(as.character(ftrs_df$V2))
#select column names that have mean() and sd() in them
x_tst_df1 <- x_tst_df[,grep(fltr_crt1, colnames(x_tst_df), fixed = TRUE)]
x_tst_df2 <- x_tst_df[,grep(fltr_crt2, colnames(x_tst_df), fixed = TRUE)]
#Read the test set subjects into a data frame
stst_df <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                      sep = "", header=FALSE)
#Read the Test set labels
tst_lbls <- read.table("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
#Combine the above 4 data frames
tst_df <- cbind(stst_df, tst_lbls, x_tst_df1, x_tst_df2)
#Remove unnecessary dfs
rm(stst_df, tst_lbls, x_tst_df, x_tst_df1, x_tst_df2)
#-------------------------------------------------------------------------------------#

#TRAIN DATA
#Read the train set into a data frame
x_trn_df <- read.table("UCI HAR Dataset/train/X_train.txt", 
                       sep = "", header=FALSE)
#Assign column names to x_trn_df
colnames(x_trn_df) <- c(as.character(ftrs_df$V2))
#select column names that have mean() and sd() in them
x_trn_df1 <- x_trn_df[,grep(fltr_crt1, colnames(x_trn_df), fixed = TRUE)]
x_trn_df2 <- x_trn_df[,grep(fltr_crt2, colnames(x_trn_df), fixed = TRUE)]
#Read the train set subjects into a data frame
strn_df <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", 
                      header=FALSE)
#Read the train set labels
trn_lbls <- read.table("UCI HAR Dataset/train/y_train.txt", 
                       sep ="", header=FALSE)
#Combine the above 4 data frames
trn_df <- cbind(strn_df, trn_lbls, x_trn_df1, x_trn_df2)
#Remove unnecessary dfs
rm(strn_df, trn_lbls, x_trn_df, x_trn_df1, x_trn_df2)
#-------------------------------------------------------------------------------------#

#Merge the test and train data frames
cmb_df <- rbind(trn_df, tst_df)
colnames(cmb_df)[c(1,2)] <- c("Subject", "Activity")
#Summarize the data frame and perform calculations
smr_df <- cmb_df %>% 
    group_by(Subject, Activity) %>% 
    summarise_each(funs(mean))
#Remove non-essential data frames from environment
rm(cmb_df, tst_df, trn_df)
#Load activity labels
act_df <- read.table("UCI HAR Dataset/activity_labels.txt", 
                           sep="", header=FALSE)
#Replace Activity numbers with labels in smr_df 
smr_df$Activity <- act_df$V2[match(smr_df$Activity, act_df$V1)]
#Produce the tidy dataset
write.table(smr_df, file = "tidydata-Haider.txt")

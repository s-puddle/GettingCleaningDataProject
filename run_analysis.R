# Read in activity and feature key tables
activity <- tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("ActCode", "Activity")))
features <- tbl_df(read.table("./UCI HAR Dataset/features.txt", header=FALSE, col.names=c("Code", "Feature")))
features$Feature <- sub("mean", "Mean", features$Feature)
features$Feature <- sub("std", "Std", features$Feature)
features$Feature <- gsub("-", "", features$Feature)
features <- mutate(features, Feature = as.character(Feature))

# Read in Test files
subject_test <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="Subject"))
subject_test <- mutate(subject_test, Group = "test")
labels_test <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names="ActCode"))
set_test <- tbl_df(read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE))
for (i in 1:561) names(set_test)[i]=features[i,2]

df_test <- bind_cols(labels_test, set_test)
df_test <- bind_cols(subject_test, df_test)

# Read in Train files
subject_train <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="Subject"))
subject_train <- mutate(subject_train, Group = "train")
labels_train <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names="ActCode"))
set_train <- tbl_df(read.table("./UCI HAR Dataset/train/x_train.txt", header=FALSE))
for (i in 1:561) names(set_train)[i]=features[i,2]

df_train <- bind_cols(labels_train, set_train)
df_train <- bind_cols(subject_train, df_train)
rm(i, features, labels_test, labels_train, set_test, set_train, subject_test, subject_train)

# Combine Test and Train data, add Activity, and select only mean and std for each variable
df_uci <- bind_rows(df_test, df_train)
df_uci <- right_join(activity, df_uci)
df_uci <- select(df_uci, Activity, Subject, Group, contains('Mean()'), contains('Std()'))
names(df_uci) <- gsub("\\()", "", names(df_uci))
rm(df_test, df_train, activity)

# Calculate mean by Activity, Subject and Signal_Var
df_uci_summary <- df_uci %>%
                  melt(id.vars=c("Activity", "Subject", "Group")) %>%
                  ddply(c("Activity", "Subject", SignalVar = "variable"), summarise,
                       SignalVarMean = mean(value))

# Create txt file for summary data
write.table(df_uci_summary, "uci_activity_summary.txt", row.name=FALSE)

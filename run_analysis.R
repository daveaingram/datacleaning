# Feature and Activity Labels will help us to tidy up the data
activity_labels <- read.table("./data/activity_labels.txt", col.names=c('id', 'activity'))
feature_labels <- read.table("./data/features.txt", col.names=c('id', 'feature'))

# We will be combining two sets of data into one. One is named "test",
# the other is "train". Given consistent naming conventions, we can 
# loop through an array of these two values to simplify the code.
sets <- vector("list", 2)
sets[[1]]$set <- "test"
sets[[2]]$set <- "train"

for (i in 1:length(sets)) {
  set <- sets[[i]]$set
  dir <- paste0("./data/", set, "/")
  
  ## Load in the soubjects and initialize the data frame
  data <- read.table(paste0(dir, "subject_", set, ".txt"), col.names="subject_id", colClasses="factor")
  data$data_set <- as.factor(set)
  
  ## Next, load in and add the activity name for each row.
  activity_ids <- read.table(paste0(dir, "Y_", set, ".txt"), col.names="id")
  activities <- merge(activity_ids, activity_labels, by="id")
  data$activity <- activities$activity
  
  ## Now we read in the measurements and add the mean and std measures.
  m <- read.table(paste0(dir, "X_", set, ".txt"))
  colnames(m) <- feature_labels$feature
  ## Now filter out only the measurements for Mean and Standard Deviation
  indecies <- c(grep("std()", feature_labels$feature, fixed=TRUE), 
                grep("mean()", feature_labels$feature, fixed=TRUE))
  ## Then add them into the data frame
  data <- cbind(data, m[,indecies])
                        
  ## As the last action in the loop, we add the dataframe to the list for later use
  sets[[i]]$data <- data
}

## Now combine the two data frames together into one and write to disk.
data <- rbind(sets[[1]]$data, sets[[2]]$data)
write.table(data, file="tidy_data.txt")

############################################################

## Next up, we will consolidate this Data Frame still further by taking 
## the mean of each measure in the data set above, grouped by Subject and Activity

## To do this, we'll use the plyr package and ddply function
library(plyr)
summary <- ddply(data, c("subject_id", "activity"), function(df) {
  ## Because the first 3 columns are factorial, not numeric, we skip those.
  colMeans(df[,4:ncol(df)])
})
write.table(summary, file="summarized_tidy_data.txt")

############################################################

## Just to have a little fun, let's generate a heatmap of the new summarized data
png(file="./heatmap.png", width=3000, height=3000)
heatmap(as.matrix(summary[3:nrow(summary)]), cexRow=3, cexCol=4, margins=c(50, 5))
dev.off()
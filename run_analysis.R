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

## Now combine the two data frames together into one.
data <- rbind(sets[[1]]$data, sets[[2]]$data)



## Next up, we will consolidate this Data Frame still further by taking 
## the mean of each measure in the data set above, grouped by Subject and Activity

## To do this, we'll use the plyr package and ddply function
df <- ddply(data, c("subject_id", "activity"), function(df) {
  x <- data.frame(0)
  print(str(d))
  for(i in ncol(df)) {
    if(class(df[,i]) == "numeric") {
      x[[colnames(df)[i]]] <- mean(df[,i])
    }
  }
  x
})

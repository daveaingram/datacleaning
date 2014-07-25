This project tidies a dataset to prepare for a variety of analysies.

The data was originally obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R assumes that the above set of data has been extracted into
a directory called "data" at the same level as the script.

A single run of run_analysis.R will load all relevant data and combine it
into a single Data Frame which lists all subjects and their relevant results.

See CodeBook.md for a full description of each variable in the data frame.
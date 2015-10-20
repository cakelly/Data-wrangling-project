# Data-wrangling-project
---
title: "README"
author: "Chris Kelly"
date: "Thursday, October 20, 2015"
output: html_document
---
Course project

The script run_analysis.R creates a tidy dataset from the dataset described at 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones,
which dataset is available at:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script is commented, a detailed description of all the steps isn't 
needed here. A summary is warranted, however:

Note: the dataset must be unzipped in the "UCI HAR Dataset/" subdirectory of the current
working directory in R or RStudio.

The script reads the dataset and combines the test and training data files (6 in all) into
one dataset, containing only the 66 mean measurements, discarding the meanFreq variables
(since they are derived from other data).  The activity codes were replaced with the activity
names for clarity.  The script writes this as the file: tidyData.txt using write.table().  

Also a summary of the dataset is created in tidySummary.txt, also written when write.table().
This file can be read into R or RStudio with:

```{r}
MyURL <- "http://s3.amazonaws.com/coursera-uploads/user-7f4773206024329704d09eda/975117/asst-3/b091792076da11e5a5e959f85260abc1.txt"
read.table(MyURL, header = TRUE)
```

The summary is in the 'wide" format, with one variable in each column.  The first column is the 
subject ID, followed by the activity, followed by 66 columns for the mean variables chosen for the
dataset.   This is output as file:  tidySummary.txt.  

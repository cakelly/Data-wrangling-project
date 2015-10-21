---
title: "Codebook for Getting and Cleaning Data"
author: "Chris Kelly"
date: "October 20, 2015"
output: html_document
---

# Data Study

The original data on which this tidy dataset was created was gathered in a study entitled _Human Activity Recognition Using Smartphones Data Set_, conducted by the authors in 2013 (see Citation, below).  The dataset consisted of 561 attributes for a total of 10299 observations (including both training and testing datasets) produced as subjects performed routine activities wearing the Samsung Galaxy SII smartphone. These included sensor signals from an accelerometer and gyroscope in each phone. The signals were pre-processed and sampled, and the means and standard deviations computed for each.  It was these mean values which have been extracted for this dataset.

A total of 66 mean values are included, plus the subject id and activity label, from both the training and test data sets are included in this dataset, which is created from the raw data by the accompanying run_analysis.R script. This script combines the data from the training and test data set files into one dataset, **tidyData.txt**.

The script also produces a summary dataset, **tidySummary.txt**.
The summary contains feature averages across all the observations of each activity for each subject.

# Citation

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
The dataset and project are available at the  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

# Codebook

The values of all the features are  normalized and bounded within [-1,1]. The values not prefixed with "freq" are all time-domain measurements.  Also, values not prefixed with "gravity" are assumed to be "body" motion components. The units used for the accelerations (total and body) are 'g (gravity of earth -> 9.80665 m/seg2). The gyroscope units are rad/seg.

Fields  | Description | Units 
------- | ----------- | ----- 
subject| Subject id in the observation | Integers 1 to 30
activity| Activity being measured | "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING"
accel{mean,std}{x,y,z}|  3-axial linear body acceleration | g
gravityaccel{mean,std}{x,y,z}| 3-axial linear gravitational body acceleration | g
acceljerk{mean,std}{x,y,z}|  3-axial jerk components | g
gyro{mean,std}{x,y,z}|  3-axial gyroscope components | rad/seg
accelmag{mean,std}|  Acceleration mag | g
gravityaccelmag{mean,std}|  Gravitational mag | g
acceljerkmag{mean,std}| Acceleration jerk mag | g
gyromag{mean,std}| Gyroscope mag | rad/seg
gyrojerkmag{mean,std}| Gyroscope jerk mag  | rad/seg
freqaccel{mean,std}{x,y,z}| 3-axial Acceleration frequency components | g
freqacceljerk{mean,std}{x,y,z}| 3-axial Acceleration jerk frequency components | g
freqgyro{mean,std}{x,y,z}| 3-axial Gyroscopy frequency components | rad/seg
freqaccelmag{mean,std}| Acceleration mag frequency | g
freqacceljerkmag{mean,std}| Acceleration jerk mag frequency  | g
freqgyromag{mean,std}| Gyroscopy mag frequency | rad/seg
freqgyrojerkmag{mean,std}| Gyroscopy jerk mag frequency | rad/seg



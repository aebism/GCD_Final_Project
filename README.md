# GCD_Final_Project
Final Project for Getting and Cleaning Data - Smartphone Experiment
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Modified Dataset for Getting and Cleaning Data
Johns Hopkins University
www.coursera.org
==================================================================

The attached R script provides multiple functions in order to present the data in a tidy fashion

- The original data is obtained from the link provided in coursera class, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Data for subject and activity files are read separately using read.table
- Data for the Test and Training experiments are read separately usine read.table
- Activity data is modified to provide English descriptions vs. the lookup table approach using the merge function
- Columns reporting on mean and standard deviation calculations are kept. All other calculations are discarded
- Column names are taken from a separate table and read using read.table
- Column names are cleaned up to be more readable using the grep function (only [a-zA-z] characters are used)
- Data from Test and Training are combined into one table called ALLDATA using rbind (it was unclear whether a new column identifying the source of the data was needed)
- Data from the Subject and Activity tables are then merged into the ALLDATA table using cbind
- The proper column names are applied to the ALLDATA table using the names function
- The new ALLDATA table is grouped by SubjectID and Activity respectively with means for each of the observations reported using the dplyr library function summarize_all


For more information about this revised dataset contact: aebism@hotmail.com

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

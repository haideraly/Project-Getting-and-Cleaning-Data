# Project-Getting-and-Cleaning-Data
Getting and Cleaning Data - Project
Haider Ali
====================================

This readme file describes the script used to arrive at the tidy data set submitted for the project.

Location of the script and activity dataset
-------------------------------------------

The script runs on the basis that the extracted Samsung/Smartphones activity dataset is contained within a folder "UCI HAR Dataset".

Both the "run_analysis.R" script and the "UCI HAR Dataset" folder containing the data set are located within the same working directory.

The "UCI HAR Dataset" folder contains the "test" and "train" folders along with the following text files:

- activity_lables.txt

- features.txt

- features_info.txt

- README.txt

How the script works?
---------------------

All the code for creating a tidy dataset is contained within a single file "run_analysis.R"

The tidy dataset output is created in the same working directory where the "run_analysis.R" file is located. The file will be named "tidydata-Haider.txt"

PLEASE MAKE SURE THAT that the extracted Samsung/Smartphones activity dataset is contained within a folder "UCI HAR Dataset" in the working directory and follows the convention mentioned in "Location of the script and activity dataset" section above.

The script removes non-essential data frames used for creating the tidy dataset from the environment - check the "rm()" commands within the script.

There are comments for almost all individual steps/code lines within script file please refer to the original file for individual code lines and exaplanation.

getdata_project
========================
This is a tidy data set of Human Activity Recognition Using Smartphones Dataset. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Shows information about the variables used

- 'tidyData.csv': The actual data


To view the data (assuming the files are in current working directory):

```{r}
data <- read.table("tidyData.txt", header = TRUE)
View(data)
```

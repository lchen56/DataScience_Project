
#####Project Overview
The final tidy data is average of each variable for each activity (6) and each subject (30).

The variables are mean and stand deviation measurments of 66 variables, which are mean and standard deviation of measurements. 





#####View Output
To view the final tidy data output, please save the file to R directory, then use

q1_data<-read.table("q1_data.txt",header=TRUE)
View(q1_data)

#####Overall Process
The project use dplyr package to complete the final table, the package is loaded first

1. Read the raw tables in R (train, test, labesl)

2. Combine the train/ test sets accordingly with rbind and cbind

3. Add column labels from the raw label input

4. As required in the tasks, used merge function to add activity descriptions.

5. Update the data labels to descriptive ones (change tbody -> time_body, etc)

6. Create the final table with the group by, summarise_each from the dplyr pacakge

7. Write the final table to txt file.

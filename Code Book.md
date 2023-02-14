Code Book
General Information on data:
        -> README.md file
Description of steps undertaken to clean and reshape the data:
        
1. -> 2. Read the files containing the labels for activities and features of vector

3. Read the test data

3.1) Read the data identifying subjects for test observations and rename columns 3.2) Read the test label file and add avtivity id 3.3) Read the test data set and add feature list as variable names 3.4) Column bind files under 3.1, 3.2 and 3.3 to get the complete table for test observations 3.5) Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description 3.6) Add the description for activity type to produce the final test data for observations

4. Read the training data
Reproduce steps 4.1 -> 4.6 for training data to get the final training data for observations

5. Merge Training and Test data to create one data set (training and test data have the same format, they will be bound vertically)

6. Reshape the merged data to produce the desired format for data aggregation

6.2) Use the melt function to prepare data for dcast aggregation. 6.3) Aggregate data with dcast function to produce the final (tidy) data set

7. Finally write out to csv file the tidy data set in the Data folder.
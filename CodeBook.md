## Synopsis

The main script which presents the solution to the question is run_analysis.R

- There are two type of data that is the test and train data for each type namely x,y and subject.
- The varibles x_train, x_test, y_train, y_test, s_train, s_test correspond to the training and testing data of x, y and subect.So we can group these two types of data test and train by using rbind() funciton. And the merged data were stored in x_data, y_data and s_data respecively.
- From features.txt we filtered out those data which were for mean and standard deviation and stored the numbers of those in a variable meanstd. This variable will be later used for extracting those necessary columns. 
- From the activity_labels.txt we can find that which activity id corresponds to which activity. This can be used to substitute the values in the dataset.
- The renaming of variables a very important for legible and undersatable data is one. Variables are given names according to what they signify.
- At last a full dataset is made incorprating all the needs of the question.
- Then the full dataset "data" is stored in tidydata.txt according to the instructions.


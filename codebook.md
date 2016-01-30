This file describes the code in 'run_analysis.R' and provides an explanation of the labels and measurements in the tidy dataset 
The script runs on the files UCI HAR Dataset (see 'README.md' for the reference)



Description of Code
====================================
Reading the files
	- The training set data ('X_train.txt', 'y_train.txt', 'subject_train.txt') and test set data ('X_test.txt', 'y_test.txt', 'subject_test.txt')
		are all read into R.  The files 'activity_labels.txt' and 'features.txt' are read into the data.frames 'labels' and 'features', respectively.


Shaping and cleaning the data	
	- The first part merges the training sets and the test sets into one data.frame, 'data', where each measurement correponds to a particular subject and one of six activities.
	- The second part extract only measurements with mean and std
	- The third part add descriptive names to activities
	- The fourth part export the clead deataset to  'tidy.txt'
	

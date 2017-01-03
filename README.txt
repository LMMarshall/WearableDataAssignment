
The data that makes up this dataset was subset from:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The data in this dataset 

The dataset includes the following files:
=========================================

- 'README.txt'

- 'variables.txt': List of all variables

- 'train/X_train.txt': The original set of training measurements.

- 'train/y_train.txt': The original training labels.

- 'test/X_test.txt': The original set of test measurements.

- 'test/y_test.txt': The original test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

-  A script in R called "run_analysis.R" that performs two actions: 1) merges and tidies the above resources and subsets the data to capture 
only the standard deviation and mean variables, which it saves to a file named "std_mean.txt", and 2) creates a separate table called "means.txt" 
that provides the means for all variables per participant per activity.

Details on the means.txt file can be found in the std_mean_markup.txt file included in this data set.

Notes: 
======
- Features are normalized and bounded within [-1,1].



License from owners of the original data set:
=============================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

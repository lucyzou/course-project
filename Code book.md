## DATA DICTIONARY--tidy data
subject         1
    subject code. Each number identifies the subject who performed the 
    activity for each window sample. Its range is from 1 to 30. 
activity        8
  activity name. It is factor with 6 levels. The name of activity which the subject perform.
  They are  WALKING ,WALKING_UPSTAIRS , WALKING_DOWNSTAIRS,  SITTING  STANDING  LAYING.
The following variable name are different paterns come from the accelerometer and gyroscope 
  3-axial raw signals tAcc-XYZ and tGyro-XYZ. These are time domain, others are frequency domain, which start with "f".
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. And we have '-mean()' and "-std()' in the end,
  which stand for means and Standard deviation estimated from these signals.
tBodyAcc-mean()-X     10
  the mean of tBodyAcc-mean()-X's signals in one subject and on activity. It is numeric.
The following have the same structure with the former one.

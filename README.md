## Getting and Cleaning Data Project

## Intro

  This file describes the Getting and Cleaning Data Project.
  The files included in the repository: 
  
  - README.md
  - run_analysis.R
  - CodeBook.md
  - tidydata.txt
  
## Data
  The data files to be used are: 
  -X_test.txt        ... Feature Test
  -y_test.txt        ... Activity Test
  -subject_test.txt  ... Test Subjects
  
  -X_train.txt       ... Feature Training
  -y_train.txt       ... Activity Training
  -subject_train.txt ... Subject Training
  
The Data has been pre-extracted prior to processing with the script.  

## Processing

  Each set is processed and merged.  For example, X_train merges with X_test.  
  
  For the Feature set I load and process an additional features.txt file.  The requirement is to only load mean and standard deviation data.  Using regular expressions mean and standard deviation lables are removed from the features support file.  That file is then merged effectivly with the Features dataset and any feature without mean and standard deviation is removed. 
  
  For the Activity set I load and process an additional activity_labels.txt.  This file is effectively merged with the Activity dataset to provide for a specific description of the activity. 
  
  Finally the Subject set is named. 
  
  Once this is finished all 3 datasets are merged into one matrix. 

##Tidy Data

  To tidy the data I request the mean of the feature set using the activity and subject as a key.  Each very long variable now has a mean for each row of activity and subject.  The list is sorted and then written to tidydata.txt.
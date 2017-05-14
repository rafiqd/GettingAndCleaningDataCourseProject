# Getting and Cleaning Data Course Project

## run_analysis.R
This script takes two data sets as inputs and then runs a number of things on them.
  1. Merges the two data sets.
  2. finds the names of the data columns
  2. Extracts only the mean and standard deviation rows
  3. Finds the corresponding subject list and activity list to each record
  4. It then averages the data by both activity and per each subject

## How to run
  All that's needed to run the script is to call the create_aggregate_data()
  It will source the all the files needed itself and return the aggregated data

## Codebook
  The CodeBook.md file contains all the information about what the data names
  are.

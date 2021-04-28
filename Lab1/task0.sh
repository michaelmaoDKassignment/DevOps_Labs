#!/bin/bash


#Script Usage - Add Timestamp to log files which under a given Path 

currentTimeStamp=$(date +%s)

echo "task 0 Start"

cd $1   #Go to the Directory Path

for fileName in *.log;
do
	newFileName="$currentTimeStamp-$fileName"
	mv $fileName $newFileName    # rename file
done

echo "task 0 Done"
exit 0;


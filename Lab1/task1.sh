#!/bin/bash

# Author: Michael Mao
# Date: 2021/04/26
# Description: Bulk rename log file to TIMESTAMP-N.log under a certain Directory
# Version: 1.0.0

usage()
{
	echo "Usage: please input a directory Path"
	exit 2;
}


if [ $# -eq 1 ] && [ -d $1 ] ;then

	currentTimeStamp=$(date +%s)
	echo "Current TimeStamp is $currentTimeStamp"
	
	cd $1

	for fileName in *.log;
	do
		newFileName=$(echo $fileName | sed "s/[0-9]*/$currentTimeStamp/"); #get and replace old timestamp
		mv $fileName $newFileName
	done

	echo "Rename Done"
	exit 0;
else
	usage    # Handle Empty argument
fi
exit 0;

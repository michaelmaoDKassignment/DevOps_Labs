#!/bin/bash

# Author: Michael Mao
# Date: 2021/04/26
# Description: Bulk compress files under a certain Directory, which within a given TimeStamp 
# Version: 1.0.0

usage()
{
	echo "Usage: [Dir Path] [Start Time (unix Timestamp)] [End Time (unix Timestamp)]"
	exit 2;
}

timeStampPattern='^[0-9]{10}$' # pattern to match 10-digit number
currentTimeStamp=$(date +%s) # get current TimeStamp


if [ $# -eq 3 ] && [ -d $1 ] && [[ $2 =~ $timeStampPattern ]] && [[ $3 =~ $timeStampPattern ]];then
	index=0
	filePath="$1"
	fileList=`ls $filePath -1 -c`  # get filename from the path

	for fileName in $fileList
	do
		fileTimeStamp=$(echo $fileName | egrep -o "^[0-9]{10}");   # parse timestamp from file name
		if [ "$fileTimeStamp" != "" ] && [ $fileTimeStamp -ge $2 ] && [ $fileTimeStamp -lt $3 ];then
			fileList[$index]="$1$fileName" # check timestamp period
		else
			fileList[$index]=""
		fi
		(( index++ ))
	done 
	
	targetFiles=${fileList[@]}  # get all files meet the timestamp
	
	if [ "${#targetFiles}" -gt 0 ];then
		tar -zcvf $currentTimeStamp.tar.gz $targetFiles  # compress
	else
		echo "Not files compress"
	fi
	
	
	# Need clean up ? then
	#rm -fr $targetFiles
	#echo "original files deleted"
	
	exit 0; 
	
else
	usage 
fi
exit 0;

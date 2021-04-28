#!/bin/bash

# Author: Michael Mao
# Date: 2021/04/26
# Description: Bulk change files permission under a certain Directory recursively
# Version: 1.0.0

usage()
{
	echo "Usage: [Dir Path] [3-digit num]"
	exit 2;
}

arg2Pattern='^[0-9]{3}$' # pattern to match 3-digit number

if [ $# -eq 2 ] && [ -d $1 ] && [[ $2 =~ $arg2Pattern ]];then
	find $1 -type f -exec chmod $2 {} \;
	echo "Permission Changed"
	exit 0;
else 
	usage
fi
exit 0;


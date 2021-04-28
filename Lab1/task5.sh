#!/bin/bash

# Author: Michael Mao
# Date: 2021/04/26
# Description: Bulk replace keywords in a given file
# Version: 1.0.0

usage()
{
	echo "Usage [file] [target keyword] [result keyword]"
	exit 2;
}

if [[ -f $1 ]] && [ $# -eq 3 ];then
	sed -i "s/$2/$3/g" $1
	echo "Replacement job done"
else
	usage
fi
exit 0;

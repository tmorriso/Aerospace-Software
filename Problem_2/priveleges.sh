#!/bin/bash
#
# Tom Morrison
# February 23, 2016
# ASEN 4519
# Assignment 5 Problem 2

# First figure out if the variable is a file or directory or other.
temp_variable=$(stat --format "%A" $1)
echo "The permissions string is: $temp_variable"
if [ -f $1 ]
then
	echo "$1 is a regular file"
elif [ -d $1 ]
then
	echo "$1 is directory"
else
	echo "$1 is not a file or directory"
fi

count=0

# Determine if the user has read permissions.
if [ ${temp_variable:1:1} == 'r' ]
then
	echo ${temp_variable:1:1}
	echo "User has read permissions for $1"
else
((count++))
fi

# Determine if the user has write permissions.
if [ ${temp_variable:2:1} == 'w' ]
then
	echo ${temp_variable:2:1}
	echo "User has write permissions for $1"
else
((count++))
fi

# Determine if the user has execute permissions.
if [ ${temp_variable:3:1} == 'x' ]
then
	echo ${temp_variable:3:1}
	echo "User has execute permissions for $1"
else
((count++))
fi

# If the user has no permissions.
if [ $count -eq 3 ]
then
	echo "User has no permissions for $1"
fi


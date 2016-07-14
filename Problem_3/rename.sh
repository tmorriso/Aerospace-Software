#!/bin/bash
#
# Tom Morrison
# February 24, 2015
# ASEN 4519 
# Assignment 5 problem 3
# 
# This Bash script is to enable the user to rename all the files with a particular file extension in a directory.

count=0
for filename in ./*$2
do 
	echo $filename
	((count++))
	echo $count
	mv $filename $1$count.$2
done

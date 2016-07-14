#!/bin/bash
################################################################################
# Tom Morrison
# February 25, 2016
# ASEN 4159 Assignment 5
# Problem 4

# Description: This is a Bash script to read in the contents of a txt file
# for grades, calculate the average, and display the final grade in floating
# point format.
#
################################################################################

# Cut up the file to get the integer grades
variable=$(cut -d';' -f2 $1)

# Sum the grades from the file
sum=0
for i in $variable
do
	sum=$(($sum+$i))
done

# Divide the sum by the total grades
length=${#variable}
denominator=$((length/3+1))
average=$((sum/denominator))
echo "The average grade for $1 is:"
echo "scale=2;$sum/$denominator" | bc

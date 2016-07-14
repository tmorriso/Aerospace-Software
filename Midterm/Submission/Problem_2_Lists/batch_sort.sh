#!/bin/bash
# This is the bash script to run sort_list.c for every file in a current directory and sort them in ascending and descending order.

# Compile the .c file
gcc -o sort_list sort_list.c

# Move sort_list.c out of current directory
#mv sort_list.c ../

# Run for each file in the current directory
for file in *
do
	if [[ $file != batch_sort.sh && $file != sort_list && $file != sort_list.c ]]
	then
	echo $file
	./sort_list $file ascending
	./sort_list $file descending
	fi
done

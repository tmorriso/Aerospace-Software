#!/bin/bash
#
# @date: April 10, 2016
#
# Description: This is a bash script to run matrix operations on  any 3 matrices
# for all possible combinations and permutations stored in a given directory.
#  
#	Example: if called with ./batch_mat_multiply.sh /Users/Tom/Matrices
#	and the directory contains matrices A B and C, then this script will
# 	compute and save all permissible operations, including permutations, 
#	between the matrices saved within these files.
#
#____________________________________________________________________________

# Compile the .c files
gcc -o mat_ops mat_ops.c functions.c write_to_file.c -lblas -lgfortran 

# Move executable to directory chosen
mv mat_ops $1

# Change to directory
cd $1

# Make output directory
mkdir Outputs
# Run
#./mat_ops A B C

# Set path to files
for f in *
do
	#if [ "$f" == "A" ]
		#then
		#echo "Doing it A"
		#./mat_ops $f B C
	#fi

	for g in *
	do

		for h in *
		do
			
			if [ "$f" != "$g" ] && [ "$f" != "$h" ] && [ "$g" != "$h" ] && [ "$f" != "mat_ops" ] && [ "$g" != "mat_ops" ] && [ "$h" != "mat_ops" ] && [ "$f" != "Outputs" ] && [ "$g" != "Outputs" ] && [ "$g" != "Outputs" ] 
			#if [ "$f" == "A" ]
			then
				echo "processing $f $g $h"

				# Run
				./mat_ops $f $g $h
				# Move files to output directory
				mv "$f"_* ./Outputs/
				#mv $g_* ./Outputs/
				#mv $h_* ./Outputs/

				
			fi

		done
	done
done
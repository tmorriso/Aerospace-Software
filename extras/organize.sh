#!/bin/bash
#
# @author: Tom Morrison
# @date: February 27, 2016
# ASEN 4159 Assignment 5
# Problem 5
#
# Description: This bash scipt unzips a tar file and sorts the contents into sub# directories according to there extension type. It then rezips the new         # directory structure into a new zip labeled _clean
#
# Run with command . ./organize.sh ZIPFile 
#
################################################################################

# Unzip the tar file
tar -xvf $1

# Remove the original zip file from the current directory '.' 
mv $1 ../

for file in *
do
	# Determine file extension for each file
	extension=$(echo $file | cut -d'.' -f2-)
	
	# If there is no extension then $extension will = $file
	if [[ $extension != $file ]]
	then
		
		# Loop through each child directory in the current directory
		x=0
		for directory in *
		do
			
			# Determine if a directory exists for the extension
			if [[ $extension == $directory ]]
			then
				x=1
			fi
		done
	
		# If a directory doesn't exist create one
		if [[ $x == 0 ]]
		then
			mkdir $extension
		fi

	# Move file to sub directory
	mv $file ./$extension
	fi	
done

# Finally zip resulting folder structure excluding original zipped tarfile
file_name=$(echo $1 | cut -d'.' -f1)
file_extension="_clean.tar.gz"
tar -zcvf $file_name$file_extension .

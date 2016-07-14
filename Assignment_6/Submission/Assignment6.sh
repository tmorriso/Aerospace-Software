#!/bin/bash
# 
# @author: Tom Morrison and Noel 
# @date: March 3, 2016
#
# Description: This is the bash script to solve both objectives 1 and 2 for assignment 6 with an accuracy of .5 meters per second for a clearance of 0,10,100,1000,5000,10000,50000,100000 meters.
#
###############################################################################


# Compile
gcc -o ThreeBody rk4_solver.c ThreeBody.c -lm

# Run
for i in 0 10 100 1000 5000 10000 50000 100000; 
do
	./ThreeBody 1 $i .5
	./ThreeBody 2 $i .5
done




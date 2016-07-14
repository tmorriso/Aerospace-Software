#!/bin/bash 

gcc heat_solve.c Build_LHS.c Build_RHS.c BC.c Source.c functions.c Conductivity.c Output.c -lm -llapacke -llapack -lblas -lgfortran 

# run
#./a.out $1 $2

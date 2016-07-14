// functions.c

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/
double** BuildMatrix(int Nrows, int Ncols)
/*********************************************************************
	Description: This function dynamically builds a two dimensional
		     matrix on the heap.

	Inputs: 
		Nrows : number of rows
		Ncols : number of columns

	Outputs: 
			A : The matrix
***********************************************************************/
{
	int m, n;
	double **A = (double**)calloc(Nrows, sizeof(double*));
	A[0] = (double*) calloc(Nrows*Ncols, sizeof(double));
	
for(m=1;m<Nrows;++m)
{
	A[m] = A[m-1]+Ncols;
}
return A;
}
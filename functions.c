// These are the functions called in mat_op.c

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"

/**********************************************************************
	Function Prototypes
**********************************************************************/
double **BuildMatrix(int Nrows, int Ncols);
double **FillMatrix(char *matrix);

/*********************************************************************
	Functions
**********************************************************************/

double **BuildMatrix(int Nrows, int Ncols)
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

/*********************************************************************/
double **FillMatrix(char *matrix)
/**********************************************************************

	Description: This function opens a file and reads in the values
	into a matrix.

	Inputs:
		file : name of the file to be read in.

	Outputs: 
		X : The matrix.
**********************************************************************/
{
/*******Read in File***********************/
	//printf("Reading in file: %c \n", *matrix);
	int dimensions[2];
	int d_x, i, j;
	double x, **X;
	FILE *file;
	file = fopen(matrix, "r");

if (file == NULL)
{
	printf("Error opening file! \n");
	//exit(1);
}

// Create "matrix"
	fscanf(file, "%d", &d_x);
	dimensions[0] = d_x;
	fscanf(file, "%d", &d_x);
	dimensions[1] = d_x;
//	printf("The dimensions of %c are %d by %d \n", *matrix, dimensions[0], dimensions[1]);

// Build "matrix"
	X = BuildMatrix(dimensions[0],dimensions[1]);

// Fill "matrix"
for (i=0; i<dimensions[0]; i++)
{
	for (j=0; j<dimensions[1]; j++)
 	{
		fscanf(file, "%lf", &x);
		X[i][j] = x;
		//printf("%f \n", X[i][j]);
	}
}
	fclose(file);
	return X;
}
/********************************************************************
	Adding function
*********************************************************************/

/********************************************************************
int * GetDimensions()
*******************************************************************
	 Get dimensions
*********************************************************************

	printf("Getting dimensions of A: %c \n", *matrix_A);
	int dimension_A[2];
	int d_a, d_b, d_c;
	double a,b,c;
	FILE *file;
	file = fopen(matrix_A, "r");

if (file == NULL)
{
	printf("Error opening file! \n");
}
// Get dimensions
	fscanf(file, "%d", &d_a);
	dimension_A[0] = d_a;
	fscanf(file, "%d", &d_a);
	dimension_A[1] = d_a;
	printf("The dimensions of %c are %d by %d \n", *matrix_A, dimension_A[0], dimension_A[1]);
fclose(file);
*/
/****************************************************************************

Assignment 7 Part 1

@author: Tom Morrison
@date  : March 30, 2016

Description: 
	This program performs various matrix operations.

Command Line Inputs:
		argv[1] : Matrix A
		argv[2] : Matrix B
		argv[3] : Matrix C

File Outputs:
		Creates text files for the results of: 
		       	ABC, AB+C, A+BC, AB-C, A-BC		
*****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>
#include "FUNCTIONS.h"

int main(int argc, char* argv[])
{
/********Get Filenames***************/
	char* matrix_A = argv[1];
	char* matrix_B = argv[2];
	char* matrix_C = argv[3];
	double **A, **B, **C, **AB, **BC, **ABC, **ABplusC, **AplusBC, **ABminusC, **AminusBC;
if (matrix_A == NULL || matrix_B == NULL || matrix_C == NULL)
{
	printf("Error improper input arguments entered!!\n");
	exit(1);
}
/********Get Dimensions******************/
	//printf("Getting dimensions of A: %c \n", *matrix_A);
	int dimension_A[2], dimension_B[2], dimension_C[2], dimension_AB[2], dimension_BC[2], dimension_ABC[2];
	int d_a, d_b, d_c, i, j;
	double a,b,c;
	FILE *file_1;
	FILE *file_2;
	FILE *file_3;
	file_1 = fopen(matrix_A, "r");
	file_2 = fopen(matrix_B, "r");
	file_3 = fopen(matrix_C, "r");
if (file_1 == NULL || file_2 == NULL || file_3 == NULL)
{
	printf("Error opening files! \n");
	exit(1);
}
// Get dimensions
	fscanf(file_1, "%d", &d_a);
	fscanf(file_2, "%d", &d_b);
	fscanf(file_3, "%d", &d_c);
	dimension_A[0] = d_a;
	dimension_B[0] = d_b;
	dimension_C[0] = d_c;
	fscanf(file_1, "%d", &d_a);
	fscanf(file_2, "%d", &d_b);
	fscanf(file_3, "%d", &d_c);
	dimension_A[1] = d_a;
	dimension_B[1] = d_b;
	dimension_C[1] = d_c;
// Get dimensions of AB BC
	dimension_AB[0] = dimension_A[0];
	dimension_AB[1] = dimension_B[1];
	dimension_BC[0] = dimension_B[0];
	dimension_BC[1] = dimension_C[1];
// Get dimensions of solution matrices 
	dimension_ABC[0] = dimension_AB[0];
	dimension_ABC[1] = dimension_C[1];
// Print dimensions
	//printf("The dimensions of %c are %d by %d \n", *matrix_A, dimension_A[0], dimension_A[1]);
	//printf("The dimensions of %c are %d by %d \n", *matrix_B, dimension_B[0], dimension_B[1]);
	//printf("The dimensions of %c are %d by %d \n", *matrix_C, dimension_C[0], dimension_C[1]);
	//printf("The dimensions of %c%c are %d by %d \n", *matrix_A, *matrix_B, dimension_AB[0], dimension_AB[1]);
	//printf("The dimensions of %c%c are %d by %d \n", *matrix_B, *matrix_C, dimension_BC[0], dimension_BC[1]);
	//printf("The dimensions of %c%c%c are %d by %d \n", *matrix_A, *matrix_B, *matrix_C, dimension_ABC[0], dimension_ABC[1]);
fclose(file_1);
fclose(file_2);
fclose(file_3);
/********Conditionals to stop********/
/********Build Solution Matrices*****/
	AB = BuildMatrix(dimension_AB[0], dimension_AB[1]);
	BC = BuildMatrix(dimension_BC[0], dimension_BC[1]);
	ABC = BuildMatrix(dimension_ABC[0], dimension_ABC[1]);
	ABplusC = BuildMatrix(dimension_AB[0], dimension_AB[1]);
	AplusBC = BuildMatrix(dimension_A[0], dimension_A[1]);
	ABminusC = BuildMatrix(dimension_AB[0], dimension_AB[1]);
	AminusBC = BuildMatrix(dimension_A[0], dimension_A[1]);

/*********Read in File 1 and make copies*************/
	A = FillMatrix(matrix_A);
	AplusBC = FillMatrix(matrix_A);
	AminusBC = FillMatrix(matrix_A);

/********Read in File 2**************/
	B = FillMatrix(matrix_B);

/*******Read in File 3 and make copies***************/
	C = FillMatrix(matrix_C);
	ABplusC = FillMatrix(matrix_C);
	ABminusC = FillMatrix(matrix_C);

/*******Add conditionals to make sure operations make sense**************/
// Run Cblas_dgemm for AB
if (dimension_A[1] == dimension_B[0])
{
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_A[0],dimension_B[1],dimension_A[1],1.0,*A,dimension_A[1],*B,dimension_B[1],0.0,*AB,dimension_AB[1]);
}
else
{
	printf("Cannot compute AB, dimensions don't match! \n");
}
// Run Cblas_dgemm for BC ************************************************
if (dimension_A[1] == dimension_B[0])
{
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_B[0],dimension_C[1],dimension_B[1],1.0,*B,dimension_B[1],*C,dimension_C[1],0.0,*BC,dimension_BC[1]);
}
else
{
	printf("Cannot compute BC, dimensions don't match! \n");
}
// Run Cblas_dgemm for ABC ************************************************
if (dimension_AB[1] == dimension_C[0])
{
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_AB[0],dimension_C[1],dimension_AB[1],1.0,*AB,dimension_AB[1],*C,dimension_C[1],0.0,*ABC,dimension_ABC[1]);

	// Create file name
	char file_name1[ sizeof "AAAA_mult_BBBB_mult_CCCC"]; // Add extra values for longer file names
	sprintf(file_name1, "%s_mult_%s_mult_%s", matrix_A, matrix_B, matrix_C);

	// Write to a file
	write_to_file(file_name1, ABC, dimension_ABC[0], dimension_ABC[1]);
}
else
{
	printf("Cannot compute ABC, dimensions don't match! \n");
}
// Compute AB +- C *********************************************************
if (dimension_AB[0] == dimension_C[0] && dimension_AB[1] == dimension_C[1])
{
	//printf("Still need to code AB +- C! \n");
	// AB + C
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_A[0],dimension_B[1],dimension_A[1],1.0,*A,dimension_A[1],*B,dimension_B[1],1.0,*ABplusC,dimension_C[1]);
	// AB - C
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_A[0],dimension_B[1],dimension_A[1],1.0,*A,dimension_A[1],*B,dimension_B[1],-1.0,*ABminusC,dimension_C[1]);

	// Create file names
	char file_name2[ sizeof "AAAA_mult_BBBB_plus_CCCC"]; // Add extra values for longer file names
	sprintf(file_name2, "%s_mult_%s_plus_%s", matrix_A, matrix_B, matrix_C);

	char file_name3[ sizeof "AAAA_mult_BBBB_minus_CCCC"]; // Add extra values for longer file names
	sprintf(file_name3, "%s_mult_%s_minus_%s", matrix_A, matrix_B, matrix_C);

	// Write to a file
	write_to_file(file_name2, ABplusC, dimension_C[0], dimension_C[1]);
	write_to_file(file_name3, ABminusC, dimension_C[0], dimension_C[1]);

}
else
{
	printf("Cannot compute AB +- C, dimensions don't match! \n");
}
// Compute A +- BC ********************************************************
if (dimension_A[0] == dimension_BC[0] && dimension_A[1] == dimension_BC[1])
{
	//printf("Still need to code A +- BC! \n");
	// A + BC
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_B[0],dimension_C[1],dimension_B[1],1.0,*B,dimension_B[1],*C,dimension_C[1],1.0,*AplusBC,dimension_A[1]);
	
	// A - BC 
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,dimension_B[0],dimension_C[1],dimension_B[1],-1.0,*B,dimension_B[1],*C,dimension_C[1],1.0,*AminusBC,dimension_A[1]);
	
	// Create file names
	char file_name4[ sizeof "AAAA_mult_BBBB_plus_CCCC"]; // Add extra values for longer file names
	sprintf(file_name4, "%s_plus_%s_mult_%s", matrix_A, matrix_B, matrix_C);

	char file_name5[ sizeof "AAAA_minus_BBBB_mult_CCCC"]; // Add extra values for longer file names
	sprintf(file_name5, "%s_minus_%s_mult_%s", matrix_A, matrix_B, matrix_C);

	// Write to a file
	write_to_file(file_name4, AplusBC, dimension_A[0], dimension_A[1]);
	write_to_file(file_name5, AminusBC, dimension_A[0], dimension_A[1]);
}
else
{
	printf("Cannot compute A +- BC, dimensions don't match! \n");
}


/******Free memory*******************/
	free(A);
	free(B);
	free(C);
	free(AB);
	free(BC);
	free(ABC);
	free(ABplusC);
	free(AplusBC);
	free(ABminusC);
	free(AminusBC);
//return 0;
}


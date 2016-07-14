/****************************************************************************

Assignment 7 Part 2

@author: Tom Morrison
@date  : March 30, 2016

Description: 
	This program mimics a matlab code for solving the steady heat equation.

Command Line Inputs:
		argv[1] : Number of cells per side.
		argv[2] : Problem index being solved.

File Outputs:
		Returns an output file named heat_solution_n_cell_problem_index
		containing the computed values of the temperature field at the grid nodes.
		In the form of three columns corresponding to x y and T. 
		       	
*****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>
#include <math.h>
#include <lapacke.h>
#include "FUNCTIONS.h"

int main(int argc, char* argv[])
{
	char* endp;
	char** endpp = &endp;
	int n_cells, problem_index, nodes_per_side, i, j;
	int Krows, Kcols, Frows;
	double h, length, *x_array, *y_array, **K, **F, **index, *F_n;

	// Convert inputs to integers 
	n_cells = strtol(argv[1], endpp, 10);
	if (*endp != '\0')
	{
			printf("n_cells value passed is invalid!\n");
			return 1;
	}
	printf(" The number of cells per side is: %d\n", n_cells);

	problem_index = strtol(argv[2], endpp, 10);
	if (*endp != '\0')
	{
			printf("problem_index value passed is invalid!\n");
			return 2;
	}
	printf(" The problem index is: %d\n", problem_index);
/***********************************************************************
	Variable Defintions:
	h = mesh size
	x_array = Array of X positions
	y_array = Array of Y positions
************************************************************************/
// Determine length on problem number
	if (problem_index == 1 || problem_index == 2 || problem_index == 3 || problem_index == 4)
	{
		length = 1;
	}
	else if (problem_index == 5)
	{
		length = .025;
	}
	else
	{
		printf("Problem index entered is invalid! Enter 1-5 \n");
		return 3;
	}
	printf(" The length is: %f\n", length);
	h = length/n_cells;
	printf(" The mesh size is: %f\n", h);
	nodes_per_side = n_cells +1;
	printf(" The nodes per side is: %d\n", nodes_per_side);
/********Build arrays of X and Y positions*****************************/
	//x_array = BuildMatrix(nodes_per_side,1);
	//y_array = BuildMatrix(nodes_per_side,1);
	x_array = (double*) malloc(nodes_per_side*sizeof(double));
	y_array = (double*) malloc(nodes_per_side*sizeof(double));
/***************Fill X and Y matrices**********************************/
	for (i=0; i < nodes_per_side; i++)
 	{
		x_array[i] = i*h;
		y_array[i] = i*h;
		//printf("%f \n", x_array[i][0]);
		//printf("%f \n", y_array[i][0]);
	}

/**************Index array*********************************************
	Takes two dimensional index (i,j) to 
	single index (i-1)*nodes_per_side + 1
**********************************************************************/
	index = BuildMatrix(nodes_per_side, nodes_per_side); // Build index matrix
	for (i=0; i < nodes_per_side; i++)
	{
		for (j=0; j < nodes_per_side; j++)
		{
			index[i][j]=i*nodes_per_side + j;
		}
	}

/**************Build K and F*******************************************/
	Krows = pow(nodes_per_side,2);
	Kcols = pow(nodes_per_side,2);
	Frows = pow(nodes_per_side,2);
	//printf("Krows is %d \n", Krows);
	//printf("Kcols is %d \n", Kcols);

	K = BuildMatrix(Krows,Kcols);
	F = BuildMatrix(Frows,1);

/***************Interior Assembly**************************************
	Form the interior contributions to the LHS matrix and RHS vector.
***********************************************************************/
	Build_LHS(K, n_cells, x_array, y_array, index, h, problem_index);
	//printf(" K is equal to: %f \n", K[4][4]);
	Build_RHS(F, n_cells, x_array, y_array, index, h, problem_index);

/**************Compute the solution vector D****************************/
	//F[0][0] = 1;
	//F[1][0] = 2;

	F_n = (double*) malloc(Frows * sizeof(double));
	
	for (i=0; i < Frows; i++)
	{
		F_n[i] = F[i][0];
		//printf("%f \n ", K[i][0]);
	}
	// Print K (for debugging)
	for (i=0; i < Kcols; i++)
	{
		for (j=0; j < Krows; j++)
		{
			//printf("%f = K in main \n ", K[i][j]);
		}
	}

	// Compute d = K/F Using Lapack
	lapack_int info, n, nrhs, lda, ldb;
	lapack_int ipiv[n];
	n = Krows;
	nrhs = 1;
	lda = Kcols;
	ldb = 1;

	info = LAPACKE_dgesv(LAPACK_ROW_MAJOR,n,nrhs,*K,lda,ipiv,F_n,ldb);
	
	// Print F_n for debugging
	for (i=0; i<n; i++)
	{
		//printf("%f \n", F_n[i]);

	}
	// Write to an output file the solution matrix is F_n
	
	Output(n_cells,problem_index,F_n,x_array,y_array,nodes_per_side,index);

	// Free memory
	free (F_n);
	free (K);
	free (F);
	free (index);
	free (x_array);
	free (y_array);
return 0;
}
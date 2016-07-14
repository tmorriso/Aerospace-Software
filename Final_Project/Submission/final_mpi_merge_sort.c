// final_mpi_merge_sort.c
//
// @author: Tom Morrison
// @date: May 1, 2016
// Aerospace Software
// Final Project for ASEN 4519
//
// Description: This is the final version of mpi merge sort C code. This code uses
// merge sort in conjunction with MPI to optimize the sorting of large arrays. The
// array is input from the command line. It produces a text-file named "output" 
// with the array sorted from least to greatest.
//
// Future Work: Future work should include cleaning up the algorithm and simplifying
// where possible. Extra steps may have been used that were not necessary. Also the
// code should be split into multiple files to help clean it up.
//
// To Compile: mpicc -o sort final_mpi_merge_sort.c 
// To Run	 : mpirun -np 4 ./sort I
// 
// 4 is the desired number of processors, and I is a text file containing the size of
// the array on the first line followed by the entries of the array.
// Associated make file: makefile

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>
#include <time.h>
//#include "FUNCTIONS.h"
/********************Function Prototypes******************************************/
double** BuildMatrix(int Nrows, int Ncols);
void merge(double* X, int l, int m, int r);
void mergeSort(double* X, int l, int r);
double* merger(double *A, int asize, double *B, int bsize);
/*************************Timing**************************************************/
double startT,stopT;
double startTime;
/**********************Main Function*********************************************/
int main(int argc, char ** argv)
{
	int length, source, destination, myrank, nprocs, rem_values, rank, i, j, l, m, s, r;
	const int serverrank = 0;
	char* filename = argv[1];
/***********************Read in file*********************************************/	
	FILE *ifp;
	ifp = fopen(filename,"r");
	if (ifp == NULL)
	{
		printf("Error opening file! \n");
		exit(1);
	}

	// Read in the first value which will be the length
	fscanf(ifp,"%d", &length);
	double *x = malloc(length*sizeof(double));
	//printf("the length is: %d \n",length);

	// Read in the rest of the values to an array
	//printf("In main z is equal to: \n");
	for (i=0;i<length;i++)
	{
		fscanf(ifp,"%lf", &x[i]);
		//printf("%f \n", x[i]);
	}

	fclose(ifp);
/*************************Set up MPI********************************************/
	MPI_Status status;
	MPI_Request request;
	
	int tag = 0;
	int mpi_error_code;
	//length = 6;
	//double x[] = {0,-25,3.8,7,54.9999,12};
	//double *y = malloc(length*sizeof(double));
	double **matrix1, **matrix2, *C, *y, *A;
	int size_per_processor; 
	int solution_count = 0;
	l = solution_count;

	mpi_error_code = MPI_Init(&argc, &argv);
	mpi_error_code = MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	mpi_error_code = MPI_Comm_rank(MPI_COMM_WORLD, &myrank);

	/********************************************************************************
	Steps: 
		   1. Break up the input array into smaller arrays depending on the number of 
			  processors.
		   2. Processors sort their arrays using merge sort.
		   3. The sorted arrays are then merged together on alternating processers
		   	  using merger.
		   4. Serverrank outputs the result to a file.
		   5. Serverrank prints results and time.

	********************************************************************************/
	startT = clock();
	/***************** 1. Break up the array *************************
	This initial array is broken up into smaller arrays depending 
	on the number of processors.
	*****************************************************************/
	/* Get the size of arrays per processor */
	size_per_processor = length/nprocs;
		
	/* Get the remainder values */
	rem_values = length % nprocs;
	if (myrank == serverrank) //Debugg
	{
		//printf("The remainder is: %d \n", rem_values);
		//printf("size_per_processor is equal to: %d \n", size_per_processor);
		//printf("The number of processors is: %d \n", nprocs);
	}
	/* Create two double matrices to store the arrays */
	matrix1 = BuildMatrix(nprocs - rem_values,size_per_processor);
	matrix2 = BuildMatrix(rem_values, size_per_processor+1);
	
	/* Fill matrix 1 */
	int count = 0;
	for (i=0; i<nprocs-rem_values; i++)
	{
		for (j=0; j<size_per_processor; j++)
		{
			matrix1[i][j] = x[count];
			count++;
		}
	}

	/* Fill matrix 2 (contains the remainder values) */
	for (i=0;i<rem_values;i++)
	{
		for (j=0; j<size_per_processor+1; j++)
		{
			matrix2[i][j] = x[count];
			count++;
		}
	}

	/*********Print for debugging************************/
	if (myrank == serverrank)
	{
	//printf("Filled Matrix 1 is: \n");
	for (i=0; i<nprocs-rem_values; i++)
	{
		for (j=0; j<size_per_processor; j++)
		{
			//printf("%f",matrix1[i][j]);
			if (j == size_per_processor-1)
			{
				//printf("\n");
			}
		}
	}
	//printf("Filled Matrix 2 is: \n");
	for (i=0; i<rem_values; i++)
	{
		for (j=0; j<size_per_processor+1; j++)
		{
			//printf("%f",matrix2[i][j]);
			if (j == size_per_processor)
			{
				//printf("\n");
			}
		}
	}
	}
	/************************************************************
		Step 2: Processors merge sort their arrays.

	*************************************************************/
	for (rank=0; rank<nprocs-rem_values;rank++)
	{
		if (myrank == rank)
		{
			A = calloc(size_per_processor, sizeof(double));
			//printf("Hello from rank: %d\n",myrank);
			for (i=0;i<size_per_processor;i++)
			{
				A[i] = matrix1[rank][i];
			}

			// Merge Sort A
			mergeSort(A, 0, size_per_processor-1);
		}
	}
	//B[size_per_processor+1] = matrix2[3][size_per_processor+1];

	for (rank=nprocs-rem_values; rank<nprocs; rank++)
	{
		if (myrank == rank)
		{
			size_per_processor = size_per_processor+1;
			A = calloc(size_per_processor, sizeof(double));
			for (i=0; i<size_per_processor;i++)
			{
				A[i] = matrix2[rank-(nprocs-rem_values)][i];	
			}
			
			// Merge sort B
			mergeSort(A, 0, size_per_processor-1);
		}
	}
	/*
	//Print for debugging
	for (rank=0; rank<nprocs;rank++)
	{
		if (myrank == rank)
		{
			printf("Size per processor is: %d on processor %d\n", size_per_processor,myrank);
			printf("A is equal to %f on processor %d\n", A[0],myrank);
		}
	}
	*/
	/***************************************************************
		Step 3: Merge all of the sorted arrays by alternating
				processors for each step one half as many processors
				are being used, The serverrank does the final merger.

	***************************************************************/
	//Starts here (Remove this and it will work with nprocs =2 )
		
	count = 1;
	while(count<nprocs)
	{
		if( myrank%(2*count)==0)
		{
			if (myrank+count<nprocs)
			{
				source = myrank+count;
				//receive size_per_processor first
				mpi_error_code = MPI_Recv(&s, 1, MPI_INT, source, 0, MPI_COMM_WORLD, &status);
				//allocate size of C
				C = (double *)malloc(s*sizeof(double));
				//receive A (call it C) from myrank+count
				mpi_error_code = MPI_Recv(C, s, MPI_DOUBLE, source, 0, MPI_COMM_WORLD, &status);

				A = merger(A,size_per_processor,C,s);
				
				//update size_per_processor
				size_per_processor=size_per_processor + s;
			}
		}
		else
		{
			//get destination
			int near = myrank-count;
			//send size_per_processor to near
			mpi_error_code = MPI_Send(&size_per_processor, 1, MPI_INT, near, 0, MPI_COMM_WORLD);
			//send A to near
			mpi_error_code = MPI_Send(A, size_per_processor, MPI_DOUBLE, near, 0, MPI_COMM_WORLD);
			//Break out of while loop
			break;
		}
		count = count*2;
	}
// Ends here
	stopT = clock();

	/***************************************************************
		Step 4: Server outputs results to a file, named "output"
	***************************************************************/
	if(myrank==0)
	{
		FILE * fout;

		// Display size, number of processors, and time
		printf("\n-------------------------------\n");
		printf("\n *MPI Results*\n Size of Array: %d;\n Processors   : %d;\n Time Elapsed : %f secs;\n",size_per_processor,nprocs,(stopT-startT)/CLOCKS_PER_SEC);
		printf("\n-------------------------------\n");
		fout = fopen("output","w");
		for(i=0;i<size_per_processor;i++)
			fprintf(fout,"%f\n",A[i]);
		fclose(fout);
	}

	//free memory
	//free (A);
	//free (B);
	free (matrix1);
	free (matrix2);

	mpi_error_code = MPI_Finalize();
}

/********************************************************************
/////////////////////////////////////////////////////////////////////
*********************************************************************
	Functions are below this line
*********************************************************************
/////////////////////////////////////////////////////////////////////	
********************************************************************/

/*********************************************************************
	Function: BuildMatrix 
*********************************************************************/
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
/**************************************************************
	Function: Merge 
**************************************************************/
void merge(double* X, int l, int m, int r)
/**************************************************************
	Description: This function merges two sorted arrays into one.

	Inputs:
			X : The array being sorted
			l : The left index of the sub array
			m :	The middle index of the array
			r :	The right index of the array

**************************************************************/
{
	//printf("Entered merge \n");
	int i, j, k;
	int n1 = m - l + 1;
	int n2 = r - m; 

	// Create temp arrays
	double L[n1], R[n2];

	// Copy data to temp arrays L[] and R[] 
	for (i=0; i < n1; i++)
	{
		L[i] = X[l+i];
		//printf("L is: %f \n", L[i]);
	}
	for (j=0; j < n2; j++)
	{
		R[j] = X[m + 1 + j];
		//printf("R is: %f \n", R[i]);
	}
	// Merge the temp arrays back into X[1..r]
	i = 0;
	j = 0;
	k = l;
	while (i < n1 && j < n2)
	{
		if (L[i] <= R[j])
		{
			X[k] = L[i];
			i++;
		}
		else
		{
			X[k] = R[j];
			j++;
		}
		k++;
	}
	// Copy the remaining elements of L[], if there are any 
	while (i < n1)
	{
		X[k] = L[i];
		i++;
		k++;
	}
	// Copy the remaining elements of R[], if there are any 
	while (j < n2)
	{
		X[k] = R[j];
		j++;
		k++;
	}
}
/**************************************************************
	Function: mergeSort 
**************************************************************/
void mergeSort(double* X, int l, int r)
/***************************************************************
	Description: This function uses recursion to break up the 
	provided array and sort each piece and then merge them back
	together.

	Inputs:
			X : The arrray to be merge sorted.
			l : The left index of the array.
			r : The right index of the array.
***************************************************************/
{
	//int i;
	// Print X for debugging
	//printf("In mergeSort X is equal to: \n");
	//for (i=0;i<=r;i++)
	//{
	//	printf("%f \n", X[i]);
	//}
	
	if (l < r)
	{
		//printf("Entered mergSort \n");
		// Find center
		int m = (l+r)/2;
		//printf("m is: %d\n",m);

		// Sort first and second halves
		mergeSort(X, l, m);
		mergeSort(X, m+1,r);

		merge(X, l, m, r);
	}
}

double* merger(double *A, int asize, double *B, int bsize) 
/**************************************************************
	Description: Use merger when combining sorted matrices. I 
	had to implement this function to be able to merge the sorted 
	arrays together and return the sorted portion. My original 
	"merge" function couldn't handle arrays of uneven sizes.

	Inputs:
			A 	  :	Matrix A to be merged.
			B 	  :	Matrix B to be merged.
			asize :	Size of matrix A.
			bsize :	Size of matrix B. 
	Output: 
			C     : Matrix C is A and B after merging.
***************************************************************/
{
	int ai, bi, ci, i;
	double *C;
	int csize = asize+bsize;

	ai = 0;
	bi = 0;
	ci = 0;

	/* printf("asize=%d bsize=%d\n", asize, bsize); */

	C = (double *)malloc(csize*sizeof(double));
	while ((ai < asize) && (bi < bsize)) {
		if (A[ai] <= B[bi]) {
			C[ci] = A[ai];
			ci++; ai++;
		} else {
			C[ci] = B[bi];
			ci++; bi++;
		}
	}

	if (ai >= asize)
		for (i = ci; i < csize; i++, bi++)
			C[i] = B[bi];
	else if (bi >= bsize)
		for (i = ci; i < csize; i++, ai++)
			C[i] = A[ai];

	for (i = 0; i < asize; i++)
		A[i] = C[i];
	for (i = 0; i < bsize; i++)
		B[i] = C[asize+i];

	/* showVector(C, csize, 0); */
	return C;
}
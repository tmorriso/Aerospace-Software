//mergeSort.c
// These are the functions for serial merge sort 
// they are called by main.c to sort the arrays without
// paralleliszation.

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"
/**************************************************************
	Functions
**************************************************************/
void merge(double* X, int l, int m, int r)
/*************************************************************
	Description:

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

	/* Create temp arrays */
	//double L[n1], R[n2];
	double *L = malloc(n1*sizeof(double));
	double *R = malloc(n2*sizeof(double));

	/* Copy data to temp arrays L[] and R[] */
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

	/* Merge the temp arrays back into X[1..r]*/
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

	/* Copy the remaining elements of L[], if there are any */
	while (i < n1)
	{
		X[k] = L[i];
		i++;
		k++;
	}

	/* Copy the remaining elements of R[], if there are any */
	while (j < n2)
	{
		X[k] = R[j];
		j++;
		k++;
	}
	free(L);
	free(R);
}
	


/**************************************************************/
void mergeSort(double* X, int l, int r)
/***************************************************************
	Description:


***************************************************************/
{
	/*
	int i;
	// Print X for debugging
	printf("In mergeSort X is equal to: \n");
	for (i=0;i<=r;i++)
	{
		printf("%f \n", X[i]);
	}
	*/
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

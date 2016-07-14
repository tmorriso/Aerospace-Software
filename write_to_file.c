// This function writes the ouptuts to the corrresponding text files

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"

/**********************************************************************
	Function Prototype
**********************************************************************/
void write_to_file(char* file_name, double** matrix, int dimension0, int dimension1);

/*********************************************************************
	Function
*********************************************************************/
void write_to_file(char* file_name, double** matrix, int dimension0, int dimension1)
/********************************************************************
Description: This function write a matrix to a corresponding output
				file.

Inputs:
		file_name  : The name of the file as a char.
		matrix	   : The matrix being written to a file.
		dimension0 : The first dimension of the matrix.
		dimension1 : The second dimension of the matrix.

Outputs: 
		A txt file named accordingly. With the matrix and dimensions
**********************************************************************/
{
	int i , j;
	//printf("Creating file named: %s \n", file_name); 
	
	//Write to a file
	FILE *f = fopen(file_name,"w");
	if (f == NULL)
	{
		printf("Error opening file to write");
		exit(1);
	}

	//Write dimensions first
	fprintf(f, "%d ",dimension0);
	fprintf(f, "%d \n",dimension1);

	// Print matrix
	for (j=0; j < dimension0; j++)
	{
		fprintf(f,"\n%f ",matrix[j][0]);
		for (i=1; i < dimension1; i++)
		{
			fprintf(f,"%f ",matrix[j][i]);
		}
	}
	fclose(f);

}
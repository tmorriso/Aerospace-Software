// Output.c

#include <stdio.h>
#include <stdlib.h>

/*********************************************************************
	Function
**********************************************************************/
void Output(int n_cell, int problem_index, double* F_n, double* x_array, double* y_array, int nodes_per_side, double** index)
/*********************************************************************
	Description: This function creates the output file for heat_solve.c

	Inputs: 
			n_cells		  : Number of cells per side.
			x_array 	  : Array of X positions.
			y_array		  : Array of Y positions.
			index 		  : Single dimension indexing
			h 			  : Mesh size
			problem_index : The problem number being solved
	Outputs: 
			Builds the LHS matrix
	
***********************************************************************/
{
	int i, j, F_n_ind;
	
	// Name the file
	char filename[ sizeof "heat_solution_30_1"];
	sprintf(filename, "heat_solution_%d_%d",n_cell,problem_index);

	printf(" Writing to file %s \n", filename);

	FILE* f = fopen(filename,"w");
	if (f == NULL)
	{
		printf("Error opening file to write!");
		exit(1);
	}
	for (i=0; i < nodes_per_side; i++)
	{
		for (j=0; j < nodes_per_side; j++)
		{

			fprintf(f,"%f ",x_array[i]);
			fprintf(f,"%f ",y_array[j]);
			F_n_ind = index[i][j];
			//printf("the integer is: %d \n", F_n_ind);
			fprintf(f,"%f \n",F_n[F_n_ind]);
		}
	}

fclose(f);

}
// Build_RHS.c

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/

void Build_RHS(double** F, int n_cells, double* x_array, double* y_array, double **index, double h, int problem_index)
/*********************************************************************
	Description: This function 

	Inputs: 
		
	
***********************************************************************/
{
	int i, j, index_center, index_bottom, index_top, index_left, index_right; 
	int i_left, i_right, j_top, j_bottom, nodes_per_side;
	double x, y, x_left, x_right, y_top, y_bottom; 
	nodes_per_side = n_cells + 1;
	for (i=1; i < n_cells; i++)
	{
		for (j=1; j < n_cells; j++)
		{
			// Determine position of center
			x = x_array[i];
			y = y_array[j];

			// Determine the indices associated with the five point stencil
			index_center = index[i][j];

			// Determine contributions to RHS matrix
			F[index_center][0] = Source(x,y,problem_index);
			//printf("F[index_center] is %f \n", F[index_center][0]);
		}
	}
			// Boundary Assembly, Left and Right of RHS
			for (j=0; j < nodes_per_side; j++)
			{

				// Determine position
				x_left = x_array[0];
				x_right = x_array[nodes_per_side-1];

				// Determine the i indices
				i_left = 0;
				i_right = nodes_per_side-1;

				// Determine the position indices
				index_left = index[i_left][j];
				index_right = index[i_right][j];

				// Set RHS according to BC
				F[index_left][0]  = BC(x_left,y,problem_index);
				F[index_right][0] = BC(x_right,y,problem_index);
			
			}

			// Boundary assembly, Bottom and Top sides:
			for (i = 0; i < nodes_per_side; i++)
			{
				// Determine position
				x = x_array[i];

				y_bottom = y_array[0];
				y_top = y_array[nodes_per_side-1];

				// Determine the j indices
				j_bottom = 0;
				j_top = nodes_per_side-1;

				// Determine the position indices
				index_bottom = index[i][j_bottom];
				index_top = index[i][j_top];

				// Set RHS according to BC
				F[index_bottom][0] = BC(x,y_bottom,problem_index);
				F[index_top][0]    = BC(x,y_top,problem_index);
				//printf("F[index_bottom][0] is %f \n", F[index_bottom][0]);
			}

			// Print F for debugging
			//for (i=0; i < 9; i++)
			//{
					//printf("%f = F in RHS \n ", F[i][0]);
			//}

}
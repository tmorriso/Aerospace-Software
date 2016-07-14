// Build_LHS.c

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/

void Build_LHS(double** K, int n_cells, double* x_array, double* y_array, double **index, double h, int problem_index)
/*********************************************************************
	Description: This function builds the LHS matrix for the steady 
		heat equation.

	Inputs: 
			K 			  : LHS matrix to be filled in.
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
	int i, j, index_center, index_bottom, index_top, index_left, index_right; 
	int i_left, i_right, j_top, j_bottom, nodes_per_side;
	double x, y, x_left, x_right, y_top, y_bottom; 
	double kappa_bottom, kappa_top, kappa_left, kappa_right;
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
			//printf("index_center is %d \n", index_center);
			index_bottom = index[i][j-1];
			index_top    = index[i][j+1];
			index_left   = index[i-1][j];
			index_right  = index[i+1][j];

			// Determine conductivities associated with five-point stencil
			kappa_bottom = Conductivity(x,y-h/2,problem_index);
			//printf("kappa_bottom is equal to: %f \n", kappa_bottom);
			kappa_top    = Conductivity(x,y+h/2,problem_index);
			kappa_left   = Conductivity(x-h/2,y,problem_index);
			kappa_right  = Conductivity(x+h/2,y,problem_index);

			// Determine contributions to LHS matrix
			K[index_center][index_center] = (kappa_bottom + kappa_top + kappa_left + kappa_right)/pow(h,2);
			//printf("K is equal to %f \n", K[index_center][index_center]);
			K[index_center][index_bottom] = -kappa_bottom/pow(h,2);
			K[index_center][index_top]    = -kappa_top/pow(h,2);
			K[index_center][index_left]   = -kappa_left/pow(h,2);
			K[index_center][index_right]  = -kappa_right/pow(h,2);
		}
	}
			// Boundary Assembly, Left and Right of LHS
			for (j=0; j < nodes_per_side; j++) //-1 for nodes
			{
				// Determine position
				x_left = x_array[0];
				x_right = x_array[nodes_per_side-1];

				y = y_array[j];

				// Determine the i indices
				i_left = 0;
				i_right = nodes_per_side-1;

				// Determine the position indices
				index_left = index[i_left][j];
				index_right = index[i_right][j];

				// Set diagonal entries of LHS
				K[index_left][index_left]   = 1;
				K[index_right][index_right] = 1;

			}

			// Boundary assembly, Bottom and Top sides:
			for (i = 0; i < nodes_per_side; i++) //-1 for nodes
			{
				// Determine the j indices
				j_bottom = 0;
				j_top = nodes_per_side-1;

				// Determine the position indices
				index_bottom = index[i][j_bottom];
				index_top = index[i][j_top];

				// Set diagonal entries of LHS
				K[index_bottom][index_bottom] = 1;
				K[index_top][index_top] = 1;
			}
			// Print K (for debugging)
			//for (i=0; i < 9; i++)
			//{
				//for (j=0; j < 9; j++)
				//{
					//printf("%f = K in LHS \n ", K[i][j]);
				//}
			//}
	
}
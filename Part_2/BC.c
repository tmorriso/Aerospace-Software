// In this function the boundary function should be computed 

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/

double BC(double x, double y, int problem_index)
/*********************************************************************
	Description: This function 

	Inputs: 
		
	
***********************************************************************/
{
	double g;
	if (problem_index == 2 || problem_index == 3 || problem_index == 4)
	{
		g = 0.0;
	}
	else if (problem_index == 1 )
	{
		g = x;
	}
	else if (problem_index == 5 )
	{
		g = 70.0;
	}
	
return g;

	
}
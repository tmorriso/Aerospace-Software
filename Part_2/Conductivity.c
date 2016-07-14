// Conductivity.c

#include <stdio.h>
#include <stdlib.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/

double Conductivity(double x, double y, int problem_index)
/*********************************************************************
	Description: This function computes the conductivity at (x,y).

	Inputs: 
			x : The x position
			y : The y position
			problem_index : The problem number being solved (1-5)

	Output:
			k : The conductivity at x, y
***********************************************************************/
{
	double k;
	if (problem_index == 1 || problem_index == 2 || problem_index == 3)
	{
		k = 1;
	}
	else if (problem_index == 4)
	{
		if (x > .5)
		{
			k = 20.0;
		}
		else
		{
			k = 1.0;
		}
	}
	else if (problem_index == 5)
	{
		if ( x > .01 && x < .015 && y > .01 && y < .015)
		{
			k = 167.0;
		}
		else 
		{
			k = 157.0;
		}
	}

	return k;
}

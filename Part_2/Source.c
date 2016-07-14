// This function computes the applied heating at x,y
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "FUNCTIONS.h"

/*********************************************************************
	Function
**********************************************************************/

double Source(double x, double y, int problem_index)
/*********************************************************************
	Description: This function 

	Inputs: 
		
	
***********************************************************************/
{
	double f;
	if (problem_index == 1)
	{
		f = 0;
	}
	else if (problem_index == 2)
	{
		f = 2*(y*(1-y)+ x*(1-x));
	}
	else if (problem_index == 3)
	{
		// f = exp(-50*sqrt(pow(x-0.5,2)+pow(y-0.5,2)));
	}
	else if (problem_index == 4)
	{
		if ( x < 0.1)
		{
			f = 1;
		}
		else
		{
			f = 0;
		}
	}
	else if (problem_index == 5)
	{
		if ( x > .01 && x < .015 && y > .01 && y < .015)
		{
			f = 1600000.0;
		}
		else 
		{
			f = 0;
		}
	}

	return f;
}
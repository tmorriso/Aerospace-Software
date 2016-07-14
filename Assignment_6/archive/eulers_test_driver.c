// This is the "test" driver for eulers.c 

#include<stdio.h>
#include "functions.h"

int main( int argc, char* argv[])
{
	// Input parameters
	double dt = 10;
	double dvsx = 0;
	double dvsy = 50;
	double clearance = 0;
	int objective = 2;
	double parameter;
	// Call function
	parameter = eulers(dt, dvsx, dvsy, clearance, objective);

	// Get time step
//	double n = parameter/dt;
	// Print results for unit testing	
	if(objective == 2)
	{
		printf("The time taken for the spaceship to return to Earth: %f seconds \n",parameter);
	}
	else if(objective == 1)
	{
		printf("The total delta-V for the spaceship to return to Earth: %f meters per second", parameter);
	}
	else 
	{
		printf("The Spaceship did not return to Earth");
	}	
	return 0;


}

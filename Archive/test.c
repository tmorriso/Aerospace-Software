#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>
#include <math.h>
#include <lapacke.h>
#include "FUNCTIONS.h"

int main(int argc, char* argv[])
{
	double x, y, f, g, h;
	x = 2;
	y = 0;
	h = -50*sqrt(pow((x-0.5),2)+pow((y-0.5),2));
	f = exp(-50*sqrt(pow((x-0.5),2)+pow((y-0.5),2)));
	g = exp(h);
		printf(" f is equal to %f \n",f);
		printf(" h is equal to %f \n",g);

}
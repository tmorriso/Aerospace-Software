#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "FUNCTIONS.h"

int main()
{
	int obj;
	double *pmin_dvsx, *pmin_dvsy, *pmin_t, min_dvsx, min_dvsy, dvsx, dvsy, dvs, min_t, clearance, DT;
	DT = .1;
	dvsx = -80.3;
	dvsy = 50.0;
	min_dvsx = 100;
	min_dvsy = 100;
	obj = 2;
	clearance = 0.0;
	min_t = 9999999999999;
	pmin_dvsx = &min_dvsx;
	pmin_dvsy = &min_dvsy;
	pmin_t = &min_t;
int i;
/**********************Run the function*****************************************************/
//for (i=0; i<1; i++)
//{
	rk4(pmin_t, pmin_dvsx, pmin_dvsy, clearance, obj,DT,dvsx,dvsy);
//}
/************** Example to use the results.*************************************************/
	if (obj == 2)
	{
		printf("The minimum time is %f in main \n",min_t/3600);
	}
	if (obj == 1)
	{	
		dvs = sqrt(pow(min_dvsx,2)+pow(min_dvsy,2));	
		printf("The minimum dvs is %f \n", dvs);
	}
	printf("The corresponding dvsx is: %f \n",min_dvsx);
	printf("The corresponding dvsy is: %f \n",min_dvsy);

}

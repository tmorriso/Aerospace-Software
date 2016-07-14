#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>

int main(int argc, char* argv[])
{
	/*
	double x[5] = {1,2,3,4,5};
	double y[5] = {6,7,8,9,10};

	cblas_ddot(5,x,1,y,1);
	*/

	
	double x[1][2], y[2][1], XY[1][1];
	//XY[0][0] = 0;
	x[0][0] = 1;
	printf("x[0][0] is: %f",x[0][0]);
	x[0][1] = 2;
	y[0][0] = 3;
	y[1][0] = 4;
	printf("y[1][0] is : %f \n",y[0][0]);
	
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,1,1,2,1.0,*x,2,*y,1,0.0,*XY,1);
	printf(" XY is: %f \n", XY[0][0]);
return 0;
}

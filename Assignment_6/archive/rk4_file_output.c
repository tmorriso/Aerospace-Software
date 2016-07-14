// This is the test driver and function to calculate the ordinary differential equations (Currently using RK4)

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define PI 3.14159265		/* Value of PI */
#define mm 7.34767309e22	/* Mass of the moon in kg */
#define me 5.97219e24		/* Mass of the Earth in kg */
#define ms 28833.0		/* Mass of the Space ship in kg*/
#define rm 1737100.0		/* Radius of the moon in meters*/
#define re 6371000.0		/* Radius of the Earth in meters*/
#define G  6.67408e-11		/* Gravitational constant m3kg-1s-2*/

//-------------------------------Structs-------------------------------------------------------------
/*struct solution_vectors
{
	double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey, T0; 
};
*/
//-------------------------Function Prototypes-------------------------------------------------------

double *RHS (double t, int m, double u[]);
double *rk4vec (double t0, int m, double u0[], double dt, double *RHS ( double t, int m, double u[] ));
void get_solution_vectors(double *pmin_t, double *pdvsx, double *pdvsy, double clearance, int obj, double DT, double tol);
//-------------------------Main Function-------------------------------------------------------------
/*
int main()
{
	// Input paramters
	int obj;
	double *pdvsx, *pdvsy, *pmin_t, dvsx, dvsy, dvs, min_t, clearance, DT, tol;
	DT = 100;
	dvsx = 0;
	dvsy = 50;
	obj = 2;
	clearance = 0;
	min_t = 900;
	tol = .5;
	pdvsx = &dvsx;
	pdvsy = &dvsy;
	pmin_t = &min_t;

/*********************************************************************************************
	Set up struct to capture the solution vectors for the optimal solution.
**********************************************************************************************/
/*	struct solution_vectors *solution_vector_ptr;
	int n;
	n = min_t/DT; // This will be the size of the array determined by the time step and total time.
	solution_vector_ptr = malloc(n * sizeof(struct solution_vectors));
********************************************************************************************/	

/**********************Run the function*****************************************************/
//	get_solution_vectors (pmin_t, pdvsx, pdvsy, clearance, obj,DT,tol);
	
	// Write output to file.
	
//		printf("%f",solution_vector_ptr[2].vsy);
/*
return 0;
}*/

void get_solution_vectors(double *pmin_t, double *pdvsx, double *pdvsy, double clearance, int obj, double DT, double tol)
{
// Name the file.*******************************
/*char *arr[sizeof(tol)];
memcpy(&arr,&tol,sizeof(tol));

char *strsep( char **arr, char *.);
char *file_name;
file_name = "Optimum"+ 
*/
//**********************************************
FILE *f = fopen("Optimum_%d_%f_0p%c","w");
if (f == NULL)
{
	printf("Error opening file! \n");
}
	// Initial change in velocity
	double dvsx, dvsy, min_t;
	dvsx = *pdvsx;
	dvsy = *pdvsy;
	min_t = *pmin_t;
		
	// Set initial values for Rk4 function.
	int i, M = 8;		/* Size of array needed for positions and velocities*/
	double *u0;		/* Declare initial value array pointer */
	double T0 = 0;		/* Set initial time */
	double *u1, T1;		/* Declare +1 step */
	int count = 0; 		/* Initialize count to index solutions array */
	int n = min_t/DT;	/* The size of the solution vectors */
	
	// Set Initial Conditions
	double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey;
	double dms, des, dem, theta_m, theta_s, vs, dvs, vm, val;
	val = PI / 180.0;
	des = 340000000.0;
	theta_s = 50.0*val;
	vs = 1000.0;
	xs = des*cos(theta_s);
	ys = des*sin(theta_s);
	vsx = vs*cos(theta_s)+dvsx;
	vsy = vs*sin(theta_s)+dvsy;
	dem = 384403000.0;
	theta_m = 42.5*val;
	vm = sqrt((G*pow(me,2))/((me+mm)*dem));
	xm = dem*cos(theta_m);
	ym = dem*sin(theta_m);
	vmx = -vm*sin(theta_m);
	vmy = vm*cos(theta_m);
	xe = 0;
	ye = 0;
	vex = 0;
	vey = 0;
	dms = sqrt(pow((xs-xm),2)+pow((ys-ym),2));
	dvs = sqrt(pow(dvsx,2)+pow(dvsy,2));	


	// Allocate size and fill in initial value array.
	u0 = (double *) malloc(M * sizeof(double));
	u0[0] = vsx;
	u0[1] = vsy;
	u0[2] = vmx;
	u0[3] = vmy;
	u0[4] = xs;
	u0[5] = ys;
	u0[6] = xm;
	u0[7] = ym;
/**********************************************************	
	 Run the simulation with all input parameters.
************************************************************/
	while (dms >= rm+clearance && des >= re && des <= 2*dem)		
	{
/**********************************************************
	Call rk4 function
************************************************************/
	T1 = T0 + 1;
	u1 = rk4vec( T0 , M , u0 , DT , RHS);	
/*********************************************************
	Shift the data to prepare for another step
***********************************************************/
	T0 = T1;
	for ( i = 0; i < M; i++)
	{
		u0[i] = u1[i];
	}
/***********************************************************
	Get distances to check events.
*************************************************************/	
	vsx = u0[0];
	vsy = u0[1];
	vmx = u0[2];
	vmy = u0[3];
	xs  = u0[4];
	ys  = u0[5];
	xm  = u0[6];
	ym  = u0[7];
	dms = sqrt(pow((xs - xm),2) + pow((ys - ym),2));
	dem = sqrt(pow((xe - xm),2) + pow((ye - ym),2));
	des = sqrt(pow((xe - xs),2) + pow((ye - ys),2));
/***********************************************************
	Create solutions array using a struct.
***********************************************************/	
	if (count<n)	
/* Make sure the count stays below the predetermined array size. Replace this with total time/ time step */
	{
/*
		solution_vector_ptr[count].xs = xs;
		solution_vector_ptr[count].ys = ys;
		solution_vector_ptr[count].xm = xm;
		solution_vector_ptr[count].ym = ym;
		solution_vector_ptr[count].xe = xe;
		solution_vector_ptr[count].ye = ye;
		solution_vector_ptr[count].vsx = vsx;
		solution_vector_ptr[count].vsy = vsy;
		solution_vector_ptr[count].vmx = vmx;
		solution_vector_ptr[count].vmy = vmy;
		solution_vector_ptr[count].vex = vex;
		solution_vector_ptr[count].vey = vey;
		solution_vector_ptr[count].T0 = T0;
*******************************************************************************************************/
// Put in the values
fprintf(f, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f \n",T0,xs,ys,xm,ym,xe,ye,vsx,vsy,vmx,vmy,vex,vey);


	}
//	count++;
	free ( u1 );
	}

fclose(f);
//	free(solution_vector_ptr);
}		

//----------------------Functions-------------------------------------------------------------------

double *rk4vec (double t0, int m, double u0[], double dt, double *RHS ( double t, int m, double[] ))
/***************************************************************************************************

Description: This function uses rk4 to calculate the ODE for the three body problem.

Input: 
	t0   : The initial time value.
	m    : The dimension of the array of values being solved.
	u0[] : The array of initial values.
	dt   : The desired time step.  
	RHS(double t, int m, double[] )  : Function that calculates the right hand side of the ODE function.
Output:
	u    : Pointer to array of current values for the ODE.

***************************************************************************************************/
{
	double *f0;
	double *f1;
	double *f2;
	double *f3;
	int i;
	double t1;
	double t2;
	double t3;
	double *u;
	double *u1;
	double *u2;
	double *u3;
/********************************************************
	Get sample derivatives.
*********************************************************/

	f0 = RHS(t0, m, u0);

	t1 = t0 + dt / 2.0;
	u1 = (double *) malloc( m * sizeof(double));
	for ( i = 0; i < m; i++)
	{
		u1[i] = u0[i] + dt * f0[i] / 2.0;
	}
	f1 = RHS(t1, m, u1);

	t2 = t0 + dt / 2.0;
	u2 = (double *) malloc( m * sizeof(double));
	for (i = 0; i < m; i++)
	{
		u2[i] = u0[i] + dt*f1[i] / 2.0;
	}
	f2 = RHS(t2, m, u2);

	t3 = t0 + dt;
	u3 = (double *) malloc(m * sizeof(double));
	for ( i = 0; i < m; i++)
	{
		u3[i] = u0[i] + dt * f2[i];
	}
	f3 = RHS( t3, m, u3);
/*********************************************************
	Combine them to get estimate solution.
**********************************************************/
	u = (double*) malloc(m *sizeof(double));
	for (i =0; i < m; i++)
	{
		u[i] = u0[i] + dt * (f0[i] + 2.0 * f1[i] + 2.0 * f2[i] + f3[i] )/6.0;
	}
/********************************************************
	Free memmory.
**********************************************************/
	free ( f0 );
	free ( f1 );
	free ( f2 );
	free ( f3 );
	free ( u1 );
	free ( u2 );
	free ( u3 );

return u;
}

//----------------------RHS Function-----------------------------------------------------------------
double *RHS (double t, int m, double u[])
/**************************************************************************************
Description: This function calculates the right hand side of the ODE to be used in the
	     rk4vec function.
Inputs: 
	t :  the time dependency of the differential equation.
	m :  the spatial dimension of the array of ODEs.
	u[]: the array of the current values at the current time.
Outputs:
	r :  A pointer to the array of the RHS values.
***************************************************************************************/
{
		// Get current values
		double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey;
		vsx = u[0];
		vsy = u[1];
		vmx = u[2];
		vmy = u[3];
		xs = u[4];
		ys = u[5];
		xm = u[6];
		ym = u[7];
			
		// Calculate distances
		double dms, dem, des;
		dms = sqrt(pow((xs - xm),2) + pow((ys - ym),2));
		dem = sqrt(pow((xe - xm),2) + pow((ye - ym),2));
		des = sqrt(pow((xe - xs),2) + pow((ye - ys),2));
	
		// Calculate the forces
		double fmsx, fmsy, fesx, fesy, femx, femy, fsmx, fsmy;
		fmsx = (G*mm*ms*(xm - xs))/pow(dms,3);
		fmsy = (G*mm*ms*(ym - ys))/pow(dms,3);
	
		fesx = (G*me*ms*(xe - xs))/pow(des,3);
		fesy = (G*me*ms*(ye - ys))/pow(des,3);
	
		femx = (G*me*mm*(xe - xm))/pow(dem,3);
		femy = (G*me*mm*(ye - ym))/pow(dem,3);

		fsmx = (G*ms*mm*(xs - xm))/pow(dms,3);
		fsmy = (G*ms*mm*(ys - ym))/pow(dms,3);

		// Calculate the accelerations
		double asx, asy, amx, amy;
		asx = (fmsx + fesx)/ms;
		asy = (fmsy + fesy)/ms;
		amx = (femx + fsmx)/mm;
		amy = (femy + fsmy)/mm;
	
		// Assign output array
		double *r;
		r = ( double *) malloc(m * sizeof(double));
		r[0] = asx;
		r[1] = asy;
		r[2] = amx;
		r[3] = amy;
		r[4] = vsx;
		r[5] = vsy;
		r[6] = vmx;
		r[7] = vmy;
return r;
}


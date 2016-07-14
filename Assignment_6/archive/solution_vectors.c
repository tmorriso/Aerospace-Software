// This is the test driver for Eulers function that returns the solution vectors

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

struct solution_vectors
{
	double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey, time; 
};

void f(struct solution_vectors *solution_vector_ptr, double dt, double clearance, double dvsy, double dvsx);

int main ()
{
	// Inputs
	double dt = 10;
	double time = 294399;
	double clearance = 0;
	double dvsx = 0;
	double dvsy = 50;
	struct solution_vectors *solution_vector_ptr;
	int n;
	n = 29439;
	solution_vector_ptr = malloc(n * sizeof(struct solution_vectors));

	f(solution_vector_ptr, dt, clearance, dvsy, dvsx);
	int i;
	for (i=0; i <= 20; i++)
	{
	printf("%f \n", solution_vector_ptr[i].xs);
	}
	free(solution_vector_ptr);
return 0;
}


void f(struct solution_vectors *solution_vector_ptr, double dt, double clearance, double dvsy, double dvsx)
{

	// Declare constants	
	const double mm = 7.34767309e22;/* Mass of the moon in kg */
	const double me = 5.97219e24;	/* Mass of the Earth in kg */
	const double ms = 28833.0;	/* Mass of the Space ship in kg*/
	const double rm = 1737100.0;	/* Radius of the moon in meters*/
	const double re = 6371000.0;	/* Radius of the Earth in meters*/
	const double G = 6.67408e-11;	/* Gravitational constant m3kg-1s-2*/
	const double PI = 3.1459;	/* The value of PI */	

	// Set Initial Conditions
	double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey;
	double dms, des, dem, theta_m, theta_s, vs, dvs, vm, val, time;
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
	time = 0;
	dvs = sqrt(pow(dvsx,2)+pow(dvsy,2));
	
	int count = 0;

	while (dms >= rm+clearance && des >= re && des <= 2*dem)		
	{
		if (count<=29439)
		{
		// Create the solution arrays
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
		solution_vector_ptr[count].time = time;
		}
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
	
		// Calculate the positions
		xs += dt * vsx;
		ys += dt * vsy;
		xm += dt * vmx;
		ym += dt * vmy;

		// Calculate the velocities
		vsx += dt*((fmsx + fesx)/ms);
		vsy += dt*((fmsy + fesy)/ms);
		vmx += dt*((femx + fsmx)/mm);
		vmy += dt*((femy + fsmy)/mm);
	
		// Calculate distances
		dms = sqrt(pow((xs - xm),2) + pow((ys - ym),2));
		dem = sqrt(pow((xe - xm),2) + pow((ye - ym),2));
		des = sqrt(pow((xe - xs),2) + pow((ye - ys),2));

		// Increment time step
		time = time + dt;
		count++;
	}
}

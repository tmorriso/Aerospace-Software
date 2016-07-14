// This is the function to calculate the ordinary differential equations (Currently using Eulers)

// This function takes in dt, dvsx, dvsy, clearance, and objective as inputs. And returnseither time or total dv depending on the objective desired.


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "functions.h"

#define PI 3.14159265

double eulers(double dt, double dvsx, double dvsy, double clearance, int objective)
{
	// Declare constants	
	const double mm = 7.34767309e22;/* Mass of the moon in kg */
	const double me = 5.97219e24;	/* Mass of the Earth in kg */
	const double ms = 28833.0;	/* Mass of the Space ship in kg*/
	const double rm = 1737100.0;	/* Radius of the moon in meters*/
	const double re = 6371000.0;	/* Radius of the Earth in meters*/
	const double G = 6.67408e-11;	/* Gravitational constant m3kg-1s-2*/

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

	while (dms >= rm+clearance && des >= re && des <= 2*dem)		
	{
	
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
	
	}
	
	double value = 1;

	// If the spaceship returns to Earth and Objective 1 is selected return 
	// the total delta-V.
	if(des <= re && objective == 1)
	{
		value = dvs;	
	}

	// If the spaceship returns to Earth and Objective 2 is selects return
	// the total time taken.
	if(des <= re && objective == 2)
	{
		value = time;
	}
	if(dms <= rm)
	{
	printf("YEEEESSS");
	}
	if(des >= 2*dem)
	{
	printf("Lost TO SPACE!!!!!!!!!!!!");
	}

return value;
}

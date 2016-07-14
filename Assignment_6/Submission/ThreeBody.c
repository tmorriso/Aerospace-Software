/* Method:
1. Decide which objective to pursue
2. Command for loop to optimize result for objective
3. Output results to display and save data to output file 

Inputs Arguments:
1. Objective: either <'Time'> or <'DV'>
2. Clearance distance [m]: Example: <1000>
3. Accuracy [m/s]: Example: <0.5>

Output: Results to display and data to output.txt file */
// ----------------- PREPROCESSOR COMMANDS -------------------
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "FUNCTIONS.h"

// ----------------- Structs ---------------------------------
struct Opti_io{
	int attempt_num, index[2], OBJ;
	double res[4], dV_mag, CLEAR, TOL;	
	double array_out[21][22],results[21][22], min_T,dVsx,dVsy;
};

/*
struct Globals{
	 double xs, ys, xm, ym, xe, ye, vsx, vsy, vmx, vmy, vex, vey;
     double dms, des, dem, theta_m, theta_s, vs, dvs, vm, deg2rad, t;
};
*/

// ----------------- FUNCTION PROTOTYPES ------------------------
void Opti(struct Opti_io *io);
void Initialize(struct Opti_io *io);
int ChkDvs(float dVx, float dVy);
void CreateSolSpace(struct Opti_io *io, double res);


// ******************** MAIN SCRIPT *************************** 
int main(int argc, char* argv[]){

//Assign initial conditions
struct Opti_io io;
//struct Globals gb;
char* endp;
char **endpp = &endp;


// Convert inputs to correct data type and validate data type
io.OBJ= strtol(argv[1], endpp,10);
if (*endp != '\0')	{
	printf("Objective value passed is invalid.\n");
	return 1; 		} 
printf("The Objective is %.0d\n",io.OBJ );

io.CLEAR = strtod(argv[2], endpp);
if (*endp != '\0')	{
	printf("Clearance value passed is invalid.\n");
	return 2;		} 
printf("The Clearance in meters is %.0f\n",io.CLEAR );

io.TOL= strtod(argv[3], endpp);
if (*endp != '\0')	{
	printf("Accuracy value passed is invalid.\n");
	return 3;		} 
printf("The Accuracy in meters per second is %.1f\n",io.TOL );


//Decide which objective to process: 1 or 2
switch (io.OBJ)	{
	case 1 :
		printf("Calculating DV optimization! ...\n");
		Initialize(&io);
		Opti(&io);
		printf("The minimum dV magnitude is %f [m/s].\n",io.dV_mag);
		printf("This minimum dV took %f hours to Earth.\n",(io.min_T/3600));
		break;

	case 2 :
		printf("Calculating time optimization! \n");
		Initialize(&io);
		Opti(&io);
		printf("The minimum time is %f hours to Earth.\n",(io.min_T/3600));
		printf("This minimum dV magnitude that took was %f [m/s].\n",io.dV_mag);
		break;

	default :
		printf("Objective not selected! \n");
		return 1;
}

return 0;
}




// -------------------- FUNCTIONS -------------------------
void Opti(struct Opti_io *io){

printf("Opti_io called!\n");

// Declare variables
int j,i=0,k,outside_constraint;
double *pmin_T = &(io->min_T);  
double *pdVsx = &(io->dVsx);
double *pdVsy = &(io->dVsy);

//-------------------Run first attempt --------------------------------
printf("Attempt %.d called!\n",io->attempt_num);
		
//Create array of solution space from resolution
	CreateSolSpace(io, io->res[i]);

//Send DVs to RK4
for ( j=0; j<21; j++ ){
	for (k=0; k<22; k++ ){		
		//Check to see if Dv_mag is outside constraint
		outside_constraint = ChkDvs( io->array_out[j][0], io->array_out[j][k+1] );
		if (outside_constraint == 1){
			continue;		}

		//Run RK4		
		rk4(pmin_T, pdVsx , pdVsy, io->CLEAR, io->OBJ, 200, io->array_out[j][0] ,io->array_out[j][k+1] );
	}
	
}

io->attempt_num++;
//---------------- Attempts 2+ --------------------------------
// Modify for loop to account for varying length of res[]
for (i=1; i<(4); i++ ){
	printf("Attempt %.d called!\n",io->attempt_num);
	
	//Create array of solution space from resolution
	CreateSolSpace(io, io->res[i]);

		//Send DVs to RK4
		for ( j=0; j<21 ; j++ ){
			for (k=0; k<22; k++ ){
				
				//Check to see if dV_mag is outside constraint
				outside_constraint = ChkDvs( io->array_out[j][0], io->array_out[j][k+1] );
				if (outside_constraint == 1){
					continue;		
					}

				//Run RK4
				rk4(pmin_T, pdVsx , pdVsy, io->CLEAR, io->OBJ, 200, io->array_out[j][0] ,io->array_out[j][k+1] );
			}
		}	

	//Increment for next resolution
	io->attempt_num++;
}

//Calculate dv_mag
io->dV_mag = sqrt( (pow(io->dVsx,2)) + (pow(io->dVsy,2)) );

get_solution_vectors(pmin_T, pdVsx , pdVsy, io->CLEAR, io->OBJ, 200, io->TOL);
}


int ChkDvs(float dVx, float dVy){
	int outside_constraint;
	double dV_MAG;

	dV_MAG = sqrt( (pow(dVx,2)) + (pow(dVy,2)) );
	if (dV_MAG > 100.00000){
		outside_constraint = 1;
	}
	else{ outside_constraint = 0;	}
	
	return outside_constraint;
}


void CreateSolSpace(struct Opti_io *io, double res){
	int j,k;

	if (io->attempt_num == 1){
		for ( j=0; j<21; j++ )	{	
			io->array_out[j][0] = -100+(10*j);
			for (k=0; k<21; k++ ){
				io->array_out[j][k+1] = -100+(10*k);
			}			
		} 
	}
	else{ 
		//Create array of solution space based on current best Dvs and current resolution
		for ( j=0; j<21; j++ )	{
			io->array_out[j][0] = ((io->dVsx)-(10*res)) + (res*j);
			for (k=0; k<21; k++ ){
				io->array_out[j][k+1] = ((io->dVsy)-(10*res)) +(res*k);
				//printf("dVsx = %f , dVsy = %f \n",io->array_out[j][0], io->array_out[j][k+1]);
			}			
		} 
		
	} 
} 

//Create function to..


void Initialize(struct Opti_io *io){
printf("Initialize called!\n");
//Initialize Opti_io valriables
io->res[0] = 10;
io->res[1] = 2;
io->res[2] = 1;
io->res[3] = io->TOL; //Modify to account for varying tolerance
io->attempt_num = 1;
io->min_T = 432000;	//	[s]
io->dVsx = 100;
io->dVsy = 100;
io->dV_mag = 100;


//Initialize Globals variables
/*


gb->deg2rad = gb->PI / 180.0;
gb->des = 340000000.0;
gb->theta_s = 50.0*gb->deg2rad;
gb->vs = 1000.0;
gb->xs = gb->des*cos(gb->theta_s);
gb->ys = gb->des*sin(gb->theta_s);
gb->dem = 384403000.0;
gb->theta_m = 42.5*gb->deg2rad;
gb->vm = sqrt((gb->G*pow(gb->me,2))/((gb->me+gb->mm)*gb->dem));
gb->xm = gb->dem*cos(gb->theta_m);
gb->ym = gb->dem*sin(gb->theta_m);
gb->vmx = -(gb->vm)*sin(gb->theta_m);
gb->vmy = gb->vm*cos(gb->theta_m);
gb->xe = 0;
gb->ye = 0;
gb->vex = 0;
gb->vey = 0;
gb->dms = 0;
gb->t = 0;
gb->dvs = 0;
*/
}

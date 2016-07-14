// --------------------- Preprocessors -----------------
#define PI 3.14159265		/* Value of PI */
#define mm 7.34767309e22	/* Mass of the moon in kg */
#define me 5.97219e24		/* Mass of the Earth in kg */
#define ms 28833.0			/* Mass of the Space ship in kg*/
#define rm 1737100.0		/* Radius of the moon in meters*/
#define re 6371000.0		/* Radius of the Earth in meters*/
#define G  6.674e-11		/* Gravitational constant m3kg-1s-2*/

//-------------------------------Structs-------------------------------------------------------------



// Functions prototypes needed to all function needed for main
double *RHS (double t, int m, double u[]);
double *rk4vec (double t0, int m, double u0[], double dt, double *RHS ( double t, int m, double u[] ));
void rk4(double *pmin_t, double *pdvsx, double *pdvsy, double clearance, int obj, double DT, double dvsx, double dvsy);
void get_solution_vectors(double *pmin_t, double *pdvsx, double *pdvsy, double clearance, int obj, double DT, double tol);

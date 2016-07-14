//main.c
// This is the driver for serial merge sort.
// Compile: gcc -o merge main.c functions.c
// Run: ./merge I
// Wher "I" is the array to be sorted

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <mpi.h>
#include "FUNCTIONS.h"
#include <time.h>
/*************************Timing**************************************************/
double startT,stopT;
double startTime;
/*********************************************************************************/
int main(int argc, char* argv[])
{
/******************** Inputs **************************/
int i, j, n, length;
char* a = "ascending";
char* d = "descending";
char* filename = argv[1];
char* sort_type = argv[2];
/**************** Read in file ***********************/
FILE *ifp;
ifp = fopen(filename,"r");
if (ifp == NULL)
{
	printf("Error opening file! \n");
	exit(1);
}

// Read in the first value which will be the length
fscanf(ifp,"%d", &length);
double *x = malloc(length*sizeof(double));
//printf("the length is: %d \n",length);

// Read in the rest of the values to an array
//printf("In main x is equal to: \n");
for (i=0;i<length;i++)
{
	fscanf(ifp,"%lf",&x[i]);
	//printf("%f \n", x[i]);
}

fclose(ifp);

startT = clock();
/************* Run mergeSort ***********************/
//double** h;
//h = BuildMatrix(1,2);
mergeSort(x, 0, length - 1);
stopT = clock();

// Write to a file and print results

FILE * fout;

		// Display size, number of processors, and time
		printf("\n-------------------------------\n");
		printf("\n *Serial Code Results*\n Size of Array : %d;\n Time Elapsed : %f secs;\n",length,(stopT-startT)/CLOCKS_PER_SEC);
		printf("\n-------------------------------\n");

		fout = fopen("Serial_Output","w");
		for(i=0;i<length;i++)
			fprintf(fout,"%f\n",x[i]);
fclose(fout);

free(x);
/*
// Print array for debugging
printf("In main X is now equal to: \n");
for (i=0;i<length;i++)
{
	//printf("%f \n", x[i]);
}
*/
// 
return 0;
}

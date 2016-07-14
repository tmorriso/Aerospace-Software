// This is the temporary file for problem 2 for the Midterm
// This is my code from the midterm using a selection sort algorithm
// To sort array "H" it takes roughly 1 minute and several hours to sort 
// array "I".

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
/*************************Timing**************************************************/
double startT,stopT;
double startTime;

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
}

// Read in the first value which will be the length
fscanf(ifp,"%d", &length);
long double *x = malloc(length*sizeof(long double));


// Read in the rest of the values to an array
for (i=0;i<length;i++)
{
	fscanf(ifp,"%Lf",&x[i]);
//	printf("%.16Lf \n", x[i]);
}

fclose(ifp);
startT = clock();
// Sort "Descending"
if( strcmp(sort_type, d) == 0)
{
for(i=0; i<length ; i++)
{
	for(j=0+i; j<length; j++)
	{
		if (x[j] > x[i])
		{
			long double holder = x[i];

			x[i] = x[j];
			x[j] = holder;
		}
	}
}
}

// Sort "Ascending"
if( strcmp(sort_type, a) == 0)
{
for(i=0; i<length ; i++)
{
	for(j=0+i; j<length; j++)
	{
		if (x[j] < x[i])
		{
			long double holder = x[i];
			x[i] = x[j];
			x[j] = holder;
		}
	}
}
}
stopT = clock();
printf("\n-------------------------------\n");
printf("\n *Selection Sort Results*\n Size of Array: %d;\n Time Elapsed : %f secs;\n",length,(stopT-startT)/CLOCKS_PER_SEC);
printf("\n-------------------------------\n");
//Free memory
free(x);
return 0;
}

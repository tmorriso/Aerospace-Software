// This is the temporary file for problem 2 for the Midterm

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
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
// Print results
for (i=0; i < length; i++)
{
printf("%.16Lf \n",x[i]);
}
char file_name[ sizeof "A_sorted_ascending"];
sprintf(file_name, "%s_sorted_%s", filename, sort_type);
printf("Creating file named: %s \n", file_name);

//Write results to a file
FILE *f = fopen(file_name,"w");
if (f == NULL)
{
	printf("Error opening file to write");
}

//Write length first
fprintf(f, "%d \n",length);

for (i=0; i < length; i++)
{
	fprintf(f,"%.16Lf \n",x[i]);
}

free(x);

return 0;
}

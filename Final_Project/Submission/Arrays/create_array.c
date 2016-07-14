#include <stdio.h>
#include <stdlib.h>
//#include <mpi.h>
#include <time.h>

#define N 2000000

main(int argc, char **argv)
{

int n = N;
int i;
double *data;
srandom(clock());
data = (double *)malloc((n)*sizeof(double));

for(i=0;i<n;i++)
	data[i] = random();



FILE * fout;

		fout = fopen("L","w");
		for(i=0;i<n;i++)
			fprintf(fout,"%f\n",data[i]);
fclose(fout);
return 0;
}

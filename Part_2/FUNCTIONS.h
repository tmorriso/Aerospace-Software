// FUNCTIONS.h

/********************************************
Function Prototypes.
********************************************/
double **BuildMatrix(int Nrows, int Ncols);
void Build_LHS(double** K, int n_cells, double* x_array, double* y_array, double** index, double h, int problem_index);
void Build_RHS(double** F, int n_cells, double* x_array, double* y_array, double **index, double h, int problem_index); 
double Conductivity(double x, double y, int problem_index);
double Source(double x, double y, int problem_index);
double BC(double x, double y, int problem_index);
void Output(int n_cell, int problem_index, double* F_n, double* x_array, double* y_array, int nodes_per_side, double** index);
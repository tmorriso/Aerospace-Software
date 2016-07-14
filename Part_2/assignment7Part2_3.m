clear;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Get the difference array between x_array and T for Problem 1 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_2_1','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
T_array = A(1:num_rows,3);
difference = x_array - T_array

fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Convergence Study for Problem 2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  #1. heat_solution_2_2; Mesh Size = .5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_2_2','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
y_array = A(1:num_rows,2);
T_array = A(1:num_rows,3);

for i=1:num_rows
exact_solution(i) = x_array(i)*(1-x_array(i))*y_array(i)*(1-y_array(i));
end
exact_solution = exact_solution';

difference_2_2 = T_array - exact_solution;
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The normal of the differences is 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   #2. heat_solution_3_2; Mesh size .33
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_3_2','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
y_array = A(1:num_rows,2);
T_array = A(1:num_rows,3);

for i=1:num_rows
exact_solution2(i) = x_array(i)*(1-x_array(i))*y_array(i)*(1-y_array(i));
end
exact_solution2 = exact_solution2';
difference_3_2 = T_array - exact_solution2;
sum = 0;
% Normalize
for i=1:num_rows
sum = sum + difference_3_2(i);
end
Avg = sum/num_rows
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The normal of the differences is 8.3333e-06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   #3. heat_solution_4_2; Mesh size .25
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_4_2','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
y_array = A(1:num_rows,2);
T_array = A(1:num_rows,3);

for i=1:num_rows
exact_solution3(i) = x_array(i)*(1-x_array(i))*y_array(i)*(1-y_array(i));
end
exact_solution3 = exact_solution3';
difference_4_2 = T_array - exact_solution3;
sum = 0;
% Normalize
for i=1:num_rows
sum = sum + difference_4_2(i);
end
Avg = sum/num_rows
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The normal of the differences for #3 is 4.000e-08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   #4. heat_solution_5_2; Mesh size .20
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('heat_solution_5_2','r');
formatSpec = '%f %f %f';
sizeA = [3 Inf];
A = fscanf(fileID, formatSpec, sizeA);
A = A';
num_rows = size(A,1);
x_array = A(1:num_rows,1);
y_array = A(1:num_rows,2);
T_array = A(1:num_rows,3);

for i=1:num_rows
exact_solution4(i) = x_array(i)*(1-x_array(i))*y_array(i)*(1-y_array(i));
end
exact_solution4 = exact_solution4';
difference_4_2 = T_array - exact_solution4;
sum = 0;
% Normalize
for i=1:num_rows
sum = sum + difference_4_2(i);
end
Avg = sum/num_rows
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The normal of the differences for #4 is 3.8549e-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
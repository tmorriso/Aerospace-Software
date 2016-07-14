%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% RandomNumberAssignment.m
% @author: Tom Morrison
% @date: January 22, 2016
% Assignment 1, Bonus Problem

% This function takes a number of students N and number of assigments M for
% a given class and randomizes the pairings for each assignment with no
% repetitions. 

% Notes: This code will only work if the number of assignments M is
% less than half the number of students N/2. Also it does not take into
% account odd numbers of students. Add a dummy student for odd numbered
% students and the student paired with the dummy student will be a triple.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = RandomNumberAssignment(N,M)
%N = 12;
%M = 5;

% Return an error message if user tries an odd number N.
if rem(N,2) == 1
    error('Number of students must be even.')
end

% Number of assignments must be less than N/2.
while M > N/2
    disp('Invalid number of assignments for number of students (too large)')
    M = input('Enter a smaller number of assignments: ');
end

x=[];

% Get two random arrays for N/2.
r = randperm(N/2,N/2);
p = randperm(N/2,N/2) + N/2;

% Determine the pairings.
if M <= N/2
assignment = 1;
while assignment <= M
    fprintf('\n For assignment %g %s \n',assignment,'the pairings are: ')
    for i = 1:N/2
        student1 = (r(i));
        student2 = (p(i) + (assignment-1));
        if student2 > N
            student2 = student2 - (N/2);
        end
        disp('  ') % Need to put this information into an array and then display later so I can use recursion
        fprintf('\n %g and %g \n', student1,student2)
    end
    assignment = assignment + 1;
end

end

%RandomNumberAssignment(4,2)



end

    


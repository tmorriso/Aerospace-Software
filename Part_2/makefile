# Makefile for Assignment 7 part 2 numerical solution of the steady state heat equation

.PHONY: clean
CC = gcc
CFLAGS = -c
LFLAGS = -lm -llapacke -llapack -lblas -lgfortran
OBJS = heat_solve.o Build_LHS.o Build_RHS.o BC.o Source.o functions.o Conductivity.o Output.o

heat: $(OBJS)
	$(CC) -o $@ $^ $(LFLAGS)

$(OBJS) : %.o: %.c
	$(CC) $(CFLAGS) $<

heat_solve.o: FUNCTIONS.h

Build_LHS.o: FUNCTIONS.h

Build_RHS.o: FUNCTIONS.h

BC.o: FUNCTIONS.h

Source.o: FUNCTIONS.h

functions.o: FUNCTIONS.h

Conductivity.o: FUNCTIONS.h

Output.o: FUNCTIONS.h

clean: 
	rm -rf *.o heat
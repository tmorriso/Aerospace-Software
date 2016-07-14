# Makefile for the Final Project mpi merge sort C code

.PHONY: clean
CC = mpicc
CFLAGS = -c
LFLAGS = 
OBJS = final_mpi_merge_sort.o 

merge: $(OBJS)
	$(CC) -o $@ $^ $(LFLAGS)

$(OBJS) : %.o: %.c
	$(CC) $(CFLAGS) $<

final_mpi_merge_sort.o: 

clean: 
	rm -rf *.o merge

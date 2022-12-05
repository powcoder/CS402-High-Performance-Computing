MPICC := mpicc

all: hello message_passing trap

hello:
	$(MPICC) -o helloWorld helloWorldMPI.c 

message_passing:
	$(MPICC) -o message_passing message_passing.c

trap:
	$(MPICC) -o trap trap.c

clean:
	rm -f helloWorld message_passing trap

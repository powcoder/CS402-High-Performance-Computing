CC := nvcc
CC_FLAGS := -Xcompiler -fopenmp -Xcompiler -O2

all: helloworldCUDA.b saxpy.b memoryTransferOverhead.b matrixMultiplication.b

helloworldCUDA.b:
	$(CC) $(CC_FLAGS) -o helloworldCUDA.b helloworldCUDA.cu

saxpy.b:
	$(CC) $(CC_FLAGS) -o saxpy.b saxpy.cu

memoryTransferOverhead.b:
	$(CC) $(CC_FLAGS) -o memoryTransferOverhead.b memoryTransferOverhead.cu

matrixMultiplication.b:
	$(CC) $(CC_FLAGS) -o matrixMultiplication.b matrixMultiplication.cu

clean:
	rm -f *.b

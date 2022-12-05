CC := g++
CC_FLAGS := -fopenmp

all: helloWorldOMP.b trapSerial.b

helloWorldOMP.b:
	$(CC) $(CC_FLAGS) -o helloWorldOMP.b helloWorldOMP.c

trapSerial.b:
	$(CC) $(CC_FLAGS) -o trapSerial.b trapSerial.c

clean:
	rm -f *.b

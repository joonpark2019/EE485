CC = gcc
VPATH = assignment3
CPPFLAGS = -I assignment3 -D_GNU_SOURCE

all: array hash

array: testclient.o customer_manager1.o
	$(CC) testclient.o customer_manager1.o -o testclient1
hash: testclient.o customer_manager2.o
	$(CC) testclient.o customer_manager2.o -o testclient2

customer_manager1.o: customer_manager1.c
customer_manager2.o: customer_manager2.c
testclient.o: testclient.c


.PHONY: clean
clean:
	rm -f *.o *~
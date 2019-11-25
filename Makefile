CC=gcc
CFLAGS=-Wall -Werror
SOURCES=$(wildcard *.c)
DEPS=$(patsubst %.c, %.dep, $(SOURCES))
OBJ=$(patsubst %.c, %.o, $(SOURCES))

.PHONY:clean default all

all: clean default

default:
	@echo Tapez l\'une des commandes suivantes :
	@echo make essai_fap	
	@echo make clean

clean:
	rm *.o *.dep essai_fap

essai_fap: $(OBJ)
	$(CC) -o $@ $^

-include $(DEPS)

%.dep: %.c
	gcc -MM $< >$@

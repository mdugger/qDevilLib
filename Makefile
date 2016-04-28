.PHONY:	clean

CC = g++
AR = ar
C_FLAGS = -O2 -Wall -fPIC

ROOT_LIBS = $(shell root-config --libs)

INCLUDE = -I./ -I$(ROOTSYS)/include

OBJECTS = qDevilLib.o

LIBS = $(ROOT_LIBS)

all: libqDevil.so

libqDevil.so: $(OBJECTS)
	$(CC) -shared $(C_FLAGS) -o libqDevil.so qDevilLib.o  $(ROOT_LIBS) -lThread


libqDevil.a: $(OBJECTS)
	$(AR) r libqDevil.a $(OBJECTS)

%.o: %.cpp
	$(CC) -c $(C_FLAGS) $(INCLUDE) $<

clean:
	rm -rf *.o *.a *.so

env:
	@echo CC = $(CC)
	@echo C_FLAGS = $(C_FLAGS)
	@echo INCLUDE = $(INCLUDE)
	@echo LIBS = $(LIBS)
	@echo $(CC) -c $(C_FLAGS) $(INCLUDE) 

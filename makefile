INCLUDE_DIR=include
SOURCE_DIR=src
CC=gcc
CXX=g++
INCLUDE=-I$(INCLUDE_DIR) 
CFLAGS=$(INCLUDE)

OBJECT_DIR=obj
LIB_DIR=lib

_DEPS = core.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = utility.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = glm.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = bvh.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = configure.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = imgPPM.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = montecarlo.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = path.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = camera.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = sampler.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_DEPS = light.h
DEPS = $(patsubst %,$(INCLUDE_DIR)/%,$(_DEPS))

_OBJ = main.o imgPPM.o glm.o core.o utility.o bvh.o configure.o montecarlo.o path.o camera.o sampler.o light.o
OBJ = $(patsubst %,$(OBJECT_DIR)/%,$(_OBJ))

$(OBJECT_DIR)/%.o: $(SOURCE_DIR)/%.cpp $(DEPS)
	@echo "Building object $@"
	$(CXX) -O3 -c -msse3 -fopenmp -lm -o $@ $< $(CFLAGS)

all: Artifact

Artifact: $(OBJ)
	$(CXX) -O3 -msse3 -fopenmp -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(OBJECT_DIR)/*.o
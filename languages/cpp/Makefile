###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = g++
LD = g++
GLOBAL_CC_FLAGS =
GLOBAL_LD_FLAGS =
LIB_D = ./build/deps

###########################################################################################################
# Build number tracking
###########################################################################################################

include ./build/build_number.mak

###########################################################################################################
# Main recipe
###########################################################################################################

MAIN_BIN 		= a.exe
MAIN_CC_FLAGS	= $(GLOBAL_CC_FLAGS)
MAIN_LD_FLAGS	= $(GLOBAL_LD_FLAGS) -L'$(LIB_D)' -Wl,-rpath='$(LIB_D)'
MAIN_SRC_D		= ./src
MAIN_INC_D		= ./include
MAIN_OBJ_D		= ./bin/objects
MAIN_CPP_SRC	= $(wildcard $(MAIN_SRC_D)/*.cpp)
MAIN_INC		= $(wildcard $(MAIN_INC_D)/*.h)
MAIN_CPP_OBJ	= $(patsubst $(MAIN_SRC_D)/%.cpp, $(MAIN_OBJ_D)/%_cpp.o, $(MAIN_CPP_SRC))

$(MAIN_OBJ_D)/%_cpp.o:	$(MAIN_SRC_D)/%.cpp
	$(CC) $(MAIN_CC_FLAGS) -I'$(MAIN_INC_D)' -c $< -o $@ 

main: $(MAIN_CPP_OBJ) $(MAIN_INC) # Add any libraries here
	$(LD) $(MAIN_CPP_OBJ) $(MAIN_LD_FLAGS) -o $(MAIN_BIN)

###########################################################################################################
# General recipes
###########################################################################################################

# Recipe for building, (re-)links the executable and triggers the build number
.DEFAULT_GOAL = build
build: main build_number
	@echo "Build complete"

# Recipe for running, just builds and executes the binary
run: build
	@echo ""	
	@./$(MAIN_BIN)

# Recipe for cleaning. Removes all objects and binaries
clean:
	rm -rf $(MAIN_OBJ_D)/*.o
	[ -f "$(MAIN_BIN)" ] && rm $(MAIN_BIN)
	@echo ""

# Recipe for rebuilding. Just an easy way to run "make clean; make build"
rebuild: clean build
	@echo "Rebuilt binary"


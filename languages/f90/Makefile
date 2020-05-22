###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = gfortran
LD = gfortran
GLOBAL_CC_FLAGS =
GLOBAL_LD_FLAGS =
MODULES_D = ./bin/modules

###########################################################################################################
# Build number tracking
###########################################################################################################

include ./build/build_number.mak

###########################################################################################################
# Main recipe
###########################################################################################################

# Modules recipe
MODULES_CC_FLAGS	= $(GLOBAL_CC_FLAGS) -J'$(MODULES_D)'
MODULES_SRC_D		= ./src/modules
MODULES_OBJ_D		= ./bin/objects
MODULES_F90_SRC		= $(wildcard $(MODULES_SRC_D)/*.f90)
MODULES_F90_OBJ		= $(patsubst $(MODULES_SRC_D)/%.f90, $(MODULES_OBJ_D)/%_f90.o, $(MODULES_F90_SRC))

$(MODULES_OBJ_D)/%_f90.o:	$(MODULES_SRC_D)/%.f90
	$(CC) $(MODULES_CC_FLAGS) -c $< -o $@ 

modules: $(MODULES_F90_OBJ)

# Main recipe
MAIN_BIN 		= a.exe
MAIN_CC_FLAGS	= $(GLOBAL_CC_FLAGS) -I'$(MODULES_D)'
MAIN_LD_FLAGS	= $(GLOBAL_LD_FLAGS)
MAIN_SRC_D		= ./src
MAIN_OBJ_D		= ./bin/objects
MAIN_F90_SRC	= $(wildcard $(MAIN_SRC_D)/*.f90)
MAIN_F90_OBJ	= $(patsubst $(MAIN_SRC_D)/%.f90, $(MAIN_OBJ_D)/%_f90.o, $(MAIN_F90_SRC))

$(MAIN_OBJ_D)/%_f90.o:	$(MAIN_SRC_D)/%.f90
	$(CC) $(MAIN_CC_FLAGS) -c $< -o $@ 

main: modules $(MAIN_F90_OBJ)
	$(LD) $(MAIN_F90_OBJ) $(MODULES_F90_OBJ) $(MAIN_LD_FLAGS) -o $(MAIN_BIN)

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
	rm -rf $(MODULES_D)/*.mod
	[ -f "$(MAIN_BIN)" ] && rm $(MAIN_BIN)
	@echo ""

# Recipe for rebuilding. Just an easy way to run "make clean; make build"
rebuild: clean build
	@echo "Rebuilt binary"


###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = gfortran
LD = gfortran
GLOBAL_CC_FLAGS =
GLOBAL_LD_FLAGS =
MODULES_D = ./modules

###########################################################################################################
# Build number tracking
###########################################################################################################

METADATA_D = ./metadata
include $(METADATA_D)/build_number.mak

###########################################################################################################
# Subdirectory recipes
###########################################################################################################

# This is for things like in-house libraries
# For example, if code for the library libsub.so is in
# the same source as this, and main needs it
#
# Example of adding a subdirectory that compiles to a shared object
# Should probably put user-generated library files in different directory

# SUBDIR_BIN 		= subdir.exe
# SUBDIR_CC_FLAGS	= $(GLOBAL_CC_FLAGS)
# SUBDIR_LD_FLAGS	= $(GLOBAL_LD_FLAGS) -L'$(LIB_D)' -Wl,-rpath='$(LIB_D)' -fPIC -shared
# SUBDIR_SRC_D		= ../src/subdir
# SUBDIR_OBJ_D		= ./objects
# SUBDIR_F90_SRC	= $(wildcard $(SUBDIR_SRC_D)/*.f90)
# SUBDIR_F90_OBJ	= $(patsubst $(SUBDIR_SRC_D)/%.f90, $(SUBDIR_OBJ_D)/%_f90.o, $(SUBDIR_F90_SRC))
# 
# $(SUBDIR_OBJ_D)/%_f90.o:	$(SUBDIR_SRC_D)/%.f90
# 	$(CC) $(SUBDIR_CC_FLAGS) -c $< -o $@ 
# 
# subdir: modules $(SUBDIR_F90_OBJ)
# 	$(LD) $(SUBDIR_F90_OBJ) $(MODULES_F90_OBJ) $(SUBDIR_LD_FLAGS) -o $(LIB_D)/$(SUBDIR_BIN)

###########################################################################################################
# Main recipe
###########################################################################################################

MODULES_CC_FLAGS	= $(GLOBAL_CC_FLAGS) -J'$(MODULES_D)'
MODULES_SRC_D		= ../src/modules	
MODULES_OBJ_D		= ./objects
MODULES_F90_SRC	= $(wildcard $(MODULES_SRC_D)/*.f90)
MODULES_F90_OBJ	= $(patsubst $(MODULES_SRC_D)/%.f90, $(MODULES_OBJ_D)/%_f90.o, $(MODULES_F90_SRC))

$(MODULES_OBJ_D)/%_f90.o:	$(MODULES_SRC_D)/%.f90
	$(CC) $(MODULES_CC_FLAGS) -c $< -o $@ 

modules: $(MODULES_F90_OBJ)

# If main relies on any libraries, add them to the LD_FLAGS variable
# Remember to add in-house libraries as dependencies to main recipe,
# ie make them before trying to link
MAIN_BIN 		= a.exe
MAIN_CC_FLAGS	= $(GLOBAL_CC_FLAGS)
MAIN_LD_FLAGS	= $(GLOBAL_LD_FLAGS)
MAIN_SRC_D		= ../src
MAIN_OBJ_D		= ./objects
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
# This is the default recipe
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


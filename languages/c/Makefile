###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = gcc
LD = gcc
GLOBAL_CC_FLAGS =
GLOBAL_LD_FLAGS =
EXE_NAME = a.exe
SRC_EXT = c
HEAD_EXT = h
OBJ_EXT = o
LIB_D = ./libs

###########################################################################################################
# Build number tracking
###########################################################################################################

BUILD_NUMBER_D = ./metadata
include $(BUILD_NUMBER_D)/BuildNumber.mak

###########################################################################################################
# Subdirectory recipes
###########################################################################################################

# This is for things like in-house libraries
# For example, if code for the library libsub.so is in
# the same source as this, and main needs it
#
# Example of adding a subdirectory that compiles to a shared object
# Should probably put user-generated library files in different directory

#SUB_BIN = $(LIB_D)/libsub.so
#SUB_LD_FLAGS = $(GLOBAL_LD_FLAGS) -shared
#SUB_CC_FLAGS = $(GLOBAL_CC_FLAGS) -fPIC
#SUB_SRC_D    = $(MAIN_OBJ_D)/sub
#SUB_HEAD_D   = $(MAIN_HEAD_D)/sub
#SUB_OBJ_D    = $(MAIN_OBJ_D)/sub
#SUB_SOURCES  = $(wildcard $(SUB_SRC_D)/*.$(SRC_EXT))
#SUB_HEADERS  = $(wildcard $(SUB_HEAD_D)/*.$(HEAD_EXT))
#SUB_OBJECTS  = $(patsubst $(SUB_SRC_D)/%.$(SRC_EXT), $(SUB_OBJ_D)/%.$(OBJ_EXT), $(SUB_SOURCES))
#
#$(SUB_OBJ_DIR)/%.$(OBJ_EXT): $(SUB_SRC_D)/%.$(SRC_EXT)
#	$(CC) $(SUB_CC_FLAGS) -I'$(SUB_HEAD_D)' -c $< -o $@
#
#sub: $(SUB_OBJECTS) $(SUB_HEADERS)
#	$(LD) $(SUB_OBJECTS) $(SUB_LD_FLAGS) -o $(SUB_BIN)

###########################################################################################################
# Main recipe
###########################################################################################################

# If main relies on any libraries, add them to the LD_FLAGS variable
# Remember to add in-house libraries as dependencies to main recipe,
# ie make them before trying to link
MAIN_CC_FLAGS = $(GLOBAL_CC_FLAGS)
MAIN_LD_FLAGS = $(GLOBAL_LD_FLAGS) -L'$(LIB_D)' -Wl,-rpath='$(LIB_D)'
MAIN_SRC_D    = ../src
MAIN_HEAD_D   = ../include
MAIN_OBJ_D    = ./objects
MAIN_SOURCES  = $(wildcard $(MAIN_SRC_D)/*.$(SRC_EXT))
MAIN_HEADERS  = $(wildcard $(MAIN_HEAD_D)/*.$(HEAD_EXT))
MAIN_OBJECTS  = $(patsubst $(MAIN_SRC_D)/%.$(SRC_EXT), $(MAIN_OBJ_D)/%.$(OBJ_EXT), $(MAIN_SOURCES))

$(MAIN_OBJ_D)/%.$(OBJ_EXT):	$(MAIN_SRC_D)/%.$(SRC_EXT)
	$(CC) $(MAIN_CC_FLAGS) -I'$(MAIN_HEAD_D)' -c $< -o $@ 

main: $(MAIN_OBJECTS) $(MAIN_HEADERS) # Add any libraries here
	$(LD) $(MAIN_OBJECTS) $(MAIN_LD_FLAGS) -o $(EXE_NAME)

###########################################################################################################
# General recipes
###########################################################################################################

# Recipe for building, (re-)links the executable and triggers the build number
build: main build_number
	@echo "Build complete"

# Recipe for running, just builds and executes the binary
run: build
	@echo ""	
	@./$(EXE_NAME)

# Recipe for cleaning. Removes all objects and binaries
clean:
	rm -rf $(MAIN_OBJ_D)/*.$(OBJ_EXT)
	rm $(EXE_NAME)
	@echo ""

# Recipe for rebuilding. Just an easy way to run "make clean; make build"
rebuild: clean build
	@echo "Rebuilt binary"


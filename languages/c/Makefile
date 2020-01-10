###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = gcc
LD = gcc
GLOBAL_CC_FLAGS =
GLOBAL_LD_FLAGS =
LIB_D = ./libs

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
MAIN_BIN = a.exe
MAIN_CC_FLAGS	= $(GLOBAL_CC_FLAGS)
MAIN_LD_FLAGS	= $(GLOBAL_LD_FLAGS) -L'$(LIB_D)' -Wl,-rpath='$(LIB_D)'
MAIN_SRC_D		= ../src
MAIN_INC_D		= ../include
MAIN_OBJ_D		= ./objects
MAIN_C_SRC		= $(wildcard $(MAIN_SRC_D)/*.c)
MAIN_INC		= $(wildcard $(MAIN_INC_D)/*.h)
MAIN_C_OBJ		= $(patsubst $(MAIN_SRC_D)/%.c, $(MAIN_OBJ_D)/%_c.o, $(MAIN_C_SRC))

$(MAIN_OBJ_D)/%_c.o:	$(MAIN_SRC_D)/%.c
	$(CC) $(MAIN_CC_FLAGS) -I'$(MAIN_INC_D)' -c $< -o $@ 

main: $(MAIN_C_OBJ) $(MAIN_INC) # Add any libraries here
	$(LD) $(MAIN_C_OBJ) $(MAIN_LD_FLAGS) -o $(MAIN_BIN)

###########################################################################################################
# General recipes
###########################################################################################################

# Default recipe, just make it build
all: build

# Recipe for building, (re-)links the executable and triggers the build number
build: main build_number
	@echo "Build complete"

# Recipe for running, just builds and executes the binary
run: build
	@echo ""	
	@./$(MAIN_BIN)

# Recipe for cleaning. Removes all objects and binaries
clean:
	rm -rf $(MAIN_OBJ_D)/*.o
	rm $(MAIN_BIN)
	@echo ""

# Recipe for rebuilding. Just an easy way to run "make clean; make build"
rebuild: clean build
	@echo "Rebuilt binary"


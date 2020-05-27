###########################################################################################################
# Compiler, flags and names
###########################################################################################################
CC = avr-gcc
LD = avr-gcc
OC = avr-objcopy
LIB_D = ./build/deps

CHIP			= atmega328p
PORT			= /dev/ttyUSB0
BAUDRATE		= 115200

GLOBAL_CC_FLAGS = -mmcu=$(CHIP)
GLOBAL_LD_FLAGS = -mmcu=$(CHIP)
GLOBAL_OC_FLAGS = -R .eeprom
AVRDUDE_FLAGS	= -p $(CHIP) -c arduino -b $(BAUDRATE) -P $(PORT)
# May need "-F -V" to stop verification after upload

###########################################################################################################
# Makefile includes
###########################################################################################################

include ./build/build_number.mak	# build number tracking

###########################################################################################################
# Main recipe
###########################################################################################################

MAIN_OUT		= a
MAIN_CC_FLAGS	= $(GLOBAL_CC_FLAGS) -DF_CPU=16000000UL -Os
MAIN_LD_FLAGS	= $(GLOBAL_LD_FLAGS) 
MAIN_OC_FLAGS	= $(GLOBAL_OC_FLAGS) -O ihex
MAIN_SRC_D		= ./src
MAIN_INC_D		= ./include
MAIN_OBJ_D		= ./bin/objects
MAIN_C_SRC		= $(wildcard $(MAIN_SRC_D)/*.c)
MAIN_INC		= $(wildcard $(MAIN_INC_D)/*.h)
MAIN_C_OBJ		= $(patsubst $(MAIN_SRC_D)/%.c, $(MAIN_OBJ_D)/%_c.o, $(MAIN_C_SRC))

$(MAIN_OBJ_D)/%_c.o:	$(MAIN_SRC_D)/%.c
	$(CC) $(MAIN_CC_FLAGS) -I'$(MAIN_INC_D)' -c $< -o $@ 

main: $(MAIN_C_OBJ) $(MAIN_INC) # Add any libraries here
	$(LD) $(MAIN_C_OBJ) $(MAIN_LD_FLAGS) -o $(MAIN_OUT).elf
	$(OC) $(MAIN_OC_FLAGS) $(MAIN_OUT).elf $(MAIN_OUT).hex


###########################################################################################################
# General recipes
###########################################################################################################

# Recipe for building, (re-)links the executable and triggers the build number
.DEFAULT_GOAL = build
build: main build_number
	@echo "Build complete"

# Recipe for running, just builds and executes the binary
upload: build
	avrdude $(AVRDUDE_FLAGS) -U flash:w:$(MAIN_OUT).hex

# Recipe for cleaning. Removes all objects and binaries
clean:
	rm -rf $(MAIN_OBJ_D)/*.o
	rm $(MAIN_OUT).*
	@echo ""

# Recipe for rebuilding. Just an easy way to run "make clean; make build"
rebuild: clean build
	@echo "Rebuilt binary"


###########################################################################################################
# Build number tracking
###########################################################################################################

METADATA_D = ./build
include $(METADATA_D)/build_number.mak

###########################################################################################################
# Main recipe
###########################################################################################################

# If main relies on any libraries, add them to the LD_FLAGS variable
# Remember to add in-house libraries as dependencies to main recipe,
# ie make them before trying to link
PDF_VIEWER		= firefox
CC				= pdflatex
CC_FLAGS		= -output-directory $(MAIN_OUT_D)
MAIN_PDF 		= a.pdf
MAIN_SRC_D		= ./src
MAIN_OUT_D		= ./outs
#MAIN_TEX_SRC	= $(wildcard $(MAIN_SRC_D)/*.tex)
MAIN_TEX_SRC	= $(wildcard ./*.tex)

###########################################################################################################
# General recipes
###########################################################################################################

# Recipe for building, (re-)links the executable and triggers the build number
# This is the default recipe
.DEFAULT_GOAL = build
build: $(MAIN_TEX_SRC) build_number
	$(CC) $(CC_FLAGS) $(MAIN_TEX_SRC)
	cp $(MAIN_OUT_D)/*.pdf $(MAIN_PDF)

# Recipe for running, just builds and executes the binary
run: build
	$(PDF_VIEWER) $(MAIN_PDF)

# Recipe for cleaning. Removes all objects and binaries
clean:
	rm -rf $(MAIN_OUT_D)/*
	@echo ""


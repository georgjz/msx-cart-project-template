# Makefile for a dummy MSX2 16K Cartridge
# ---------------------------------------

# Edit this portion to fit your project
BUILDNAME    = demo.rom     # name of the final ROM
LINKERSCRIPT = MemoryMap.cfg

################################################
##### DO NOT EDIT ANYTHING BELOW THIS LINE #####
###### UNLESS YOU KNOW WHAT YOU ARE DOING ######
################################################

# Assembler and Linker
AS      = wla-z80
# ASFLAGS = 
LD      = wlalink
LDFLAGS = -v

# Directories
SRCDIR   = src
OBJDIR   = obj
BUILDDIR = build

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Generate include directories list
INCLUDES := $(call rwildcard,./,*.inc)          # find all *.inc files
INCDIRS  := $(sort $(dir $(INCLUDES)))          # remove file names, sort them
INCARGS  := $(foreach inc, $(INCDIRS),-I$(inc)) # add to list of include paths

# Sources
SOURCES := $(call rwildcard,./,*.s)             # list all source files
SSRC := $(notdir $(SOURCES))                    # remove file paths
SOBJ := $(patsubst %.s, $(OBJDIR)/%.o, $(SSRC))
vpath %.s $(dir $(SOURCES))                     # add source directories to vpath

# Recipes
EXECUTABLE = $(BUILDDIR)/$(BUILDNAME)

$(EXECUTABLE): $(SOBJ)
	$(LD) $(LDFLAGS) $(LINKERSCRIPT) $(BUILDDIR)/$(BUILDNAME)

$(OBJDIR)/%.o: %.s
	$(AS) -o $@ $< 

.PHONY: clean
clean:
	@rm -f $(OBJDIR)/*.*
	@rm -f $(EXECUTABLE)

dir:
	@mkdir -p $(OBJDIR)
	@mkdir -p $(BUILDDIR)
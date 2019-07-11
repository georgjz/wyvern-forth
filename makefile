# Simple make file to build a 6809 project with lwtools

# Assembler flags 
AS 		:= lwasm 
ASFLAGS := --obj

# Linker flags 
LD 		:= lwlink
LDFLAGS	:= --raw 

# Directories 
BUILDDIR := build
OBJDIR	 := obj
SRCDIR   := src

VPATH = $(SRCDIR)

.PHONY: clean

mumu: main.o subroutine.o

%.o: %.s
	$(AS) $(ASFLAGS) -l$(OBJDIR)/$*.list -o obj/$@ $<

clean:
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*.list
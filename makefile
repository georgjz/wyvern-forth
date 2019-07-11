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

# mumu: $(OBJDIR)/main.o subroutine.o
mumu: $(OBJDIR)/main.o $(OBJDIR)/subroutine.o
	$(LD) $(LDFLAGS) -o $(BUILDDIR)/test.rom $?

$(OBJDIR)/%.o: %.s
	$(AS) $(ASFLAGS) -l$*.list -o $@ $<

clean:
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*.list
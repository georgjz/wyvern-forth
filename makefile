# Simple make file to build a 6809 project with lwtools

# Assembler flags 
AS 		:= lwasm 
ASFLAGS := --obj

# Linker flags 
LD 		:= lwlink
LDFLAGS	:= --raw -s linkscript.cfg

# Directories 
BUILDDIR := build
OBJDIR	 := obj
SRCDIR   := src

VPATH = $(SRCDIR)

.PHONY: clean

# mumu: $(OBJDIR)/main.o subroutine.o
mumu: $(OBJDIR)/main.o $(OBJDIR)/subroutine.o # $(OBJDIR)/vector.o
	$(LD) $(LDFLAGS) -o $(BUILDDIR)/test3.rom $?

$(OBJDIR)/%.o: %.s
	$(AS) $(ASFLAGS) -l$*.list -o $@ $<

clean:
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*.list $(BUILDDIR)/*
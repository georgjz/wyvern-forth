# Simple make file to build a 6809 project with lwtools

# Assembler flags 
AS 		:= lwasm 
ASFLAGS := --obj 
# ASFLAGS := --format=srec

# Linker flags 
LD 		:= lwlink
# LDFLAGS	:= --raw -s linkscript.cfg
LDFLAGS	:= --format=srec -s linkscript.cfg

# Directories 
BUILDDIR := build
OBJDIR	 := obj
SRCDIR   := src

VPATH = $(SRCDIR)

.PHONY: clean

# mumu: $(OBJDIR)/main.o subroutine.o
$(BUILDDIR)/wf.ccc: $(OBJDIR)/Reset.o $(OBJDIR)/CoreWords.o # $(OBJDIR)/vector.o
	$(LD) $(LDFLAGS) -o $(BUILDDIR)/intermediate.srec $?
	python srec2bin.py -s 0xc000 -e 0x10000 -f 0x00 -o $@ $(BUILDDIR)/intermediate.srec

# $(OBJDIR)/%.srec: %.s
$(OBJDIR)/%.o: %.s
	$(AS) $(ASFLAGS) -l$(OBJDIR)/$*.list -o $@ $<

clean:
	rm -f $(OBJDIR)/* $(BUILDDIR)/*
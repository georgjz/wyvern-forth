# Simple make file to build a 6809 project with lwtools

# Assembler flags 
AS 		:= lwasm 
# ASFLAGS := --obj
ASFLAGS := --format=srec

# Linker flags 
# LD 		:= lwlink
# LDFLAGS	:= --raw -s linkscript.cfg
# LDFLAGS	:= --format=decb -s linkscript.cfg

# Directories 
BUILDDIR := build
OBJDIR	 := obj
SRCDIR   := src

VPATH = $(SRCDIR)

.PHONY: clean

# mumu: $(OBJDIR)/main.o subroutine.o
# mumu: $(OBJDIR)/main.o # $(OBJDIR)/subroutine.o # $(OBJDIR)/vector.o
	# $(LD) $(LDFLAGS) -o $(BUILDDIR)/test3.rom $?
ROM: $(OBJDIR)/main.srec
	python srec2bin.py -s 0xc000 -e 0x10000 -f 0x00 -o $(BUILDDIR)/wf.ccc $<

$(OBJDIR)/%.srec: %.s
	$(AS) $(ASFLAGS) -l$(OBJDIR)/$*.list -o $@ $<

clean:
	rm -f $(OBJDIR)/* $(BUILDDIR)/*
# Simple make file to build a 6809 project with lwtools

.PHONY: clean

mumu: main.o subroutine.o

%.o: %.s
	lwasm --obj -l$*.list -o $@ $<

clean:
	rm -f *.o *.list
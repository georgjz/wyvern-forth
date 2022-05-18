# Wyvern Forth

**Update May 2022**: I don't remember writing this. But here it is. It seems I was trying to write a cartridge for the Dragon 32 to run Forth on. I may pick this up again some say.

## build an Object

```
lwasm --obj -lmain.list -o main.o main.s
lwasm --obj -lsubroutine.list -o subroutine.o subroutine.s
```

link objects:

*these Instructions seem to be missing*

## Memory Map

RAM: $0000 - $7fff
    Start of Dictionary
    I/O: Keyboard, Graphics
ROM: $c000 - $feff
PIA/SAM: $ff00 - $ffff
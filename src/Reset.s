; Simple Reset Code for a DTC Forth

    ; org $c000

NEXT macro [noexpand]
    tfr     Y,D
    jmp     [,Y++]
endm


EXIT macro [noexpand]
    pulu    Y
    NEXT 
endm


    org $c000

Reset:
    ldy     #SQUARE             ; load starting address into IP
    ldd     #$05                ; initial data on stack 
    pshs    D 
    ; NEXT  
    tfr     Y,D    
    jmp     [,Y++]


SQUARE:
    .word   DOCOL 
    .word   DUP 
    .word   MULT
    EXIT

DUP:
    puls    X 
    pshs    X
    pshs    X
    NEXT

MULT:
    puls    D 
    mul     ,S-- 
    pshs    D 
    NEXT 

DOCOL:
    pshu    Y
    addd    #$02 
    tfr     D,Y 
    ; NEXT 
    jmp     [,Y++]


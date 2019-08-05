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


    section Reset 

Reset:
    ; reset stack pointers 
    lds     #$8000              ; set parameter pointer to $8000
    ldu     #$7000              ; set return pointer to $7000
    
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

; !BUG 
MULT:
    puls    D 
    mul
    pshs    D 
    NEXT 

DOCOL:
    pshu    Y
    addd    #$02 
    tfr     D,Y 
    ; NEXT 
    jmp     [,Y++]

    endsection
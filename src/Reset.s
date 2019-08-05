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
    
    ; GRAPHICS TEST 
    jsr     WriteTest

EndLoop:
    jmp     EndLoop
    
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
    .word   LOOP
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

LOOP:
    jmp     LOOP


WriteTest:
    ldx     #$0000
Loop: 
    lda     TestText,X 
    sta     $0400,X
    leax    1,X
    cmpx    #$40
    blt     Loop
    rts 

TestText:
    ; .ascii  "WYVERN-FORTH                    " 
    .ascii  "WYVERN"
    .db             $6d
    .ascii           "FORTH                    "
    .ascii  "(C) 2019, CLC_XCE               "


    endsection
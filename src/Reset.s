; Copyright (C) 2018 Georg Ziegler
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of
; this software and associated documentation files (the "Software"), to deal in
; the Software without restriction, including without limitation the rights to
; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
; of the Software, and to permit persons to whom the Software is furnished to do
; so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; -----------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
    include "Macros.inc"
    include "CoreWords.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Section Reset: Contains the start up code that will initialize Wyvern-Forth
;   and ready the Dragon 32/64 for execution.
;-------------------------------------------------------------------------------
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
    .word   EXIT

DUP:
    puls    X 
    pshs    X
    pshs    X
    Next

; !BUG 
MULT:
    puls    D 
    mul
    pshs    D 
    Next 

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
;---- End of section Reset -----------------------------------------------------
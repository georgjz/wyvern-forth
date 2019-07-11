; simple forth test 

Next macro 
    jmp     [,Y++]
    endm


    org $0000
Start:
    lds     #$1000
    ldu     #$2000
    ldy     ColdStart
    Next

ColdStart:
    .word   Two 
    .word   $ffff

    org $3000
Docol:
    pshs    Y
    tfr     Y,D 
    addd    #$02 
    tfr     D,Y
    Next 


    org $4000 
Lit:
    ldd     [,Y++]
    pshs    D 
    Next 


    org $5000 
Two: 
    .word Lit 
    .word 2 
    .word Lit 
    .word 4 
    Next
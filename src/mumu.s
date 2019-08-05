
    org $0000

    lda     $00
    adda    $01
    jsr     Symbol

    org $1000
    Symbol:
    rts 
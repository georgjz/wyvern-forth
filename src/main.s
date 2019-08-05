; simple build test

; TestSubroutine IMPORT 

;    section main

    org $c000

Main:
    lda     #$04

Loop:
    jmp     Loop
    ; jsr     TestSubroutine
    ; sta     $0001
    ; lda     1234
    ; lda     %101011

;    endsection
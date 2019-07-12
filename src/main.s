; simple build test

TestSubroutine IMPORT 

    section main

Main:
    lda     #$04
    jsr     TestSubroutine
    ; sta     $0001
    ; lda     1234
    ; lda     %101011

    endsection
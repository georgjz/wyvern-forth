; simple build test

TestSubroutine IMPORT 

    section mumu

Main:
    lda     #$04
    sta     $0001
    lda     1234
    lda     %101011

    endsection
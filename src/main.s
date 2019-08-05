; simple build test

; TestSubroutine IMPORT 

NEXT macro 
    ldd     #$affe
    endm 

   section main
    ; org $c000


Main:
    lda     #$04

Loop:
    jmp     Loop
    NEXT
    ; jsr     TestSubroutine
    ; sta     $0001
    ; lda     1234
    ; lda     %101011

   endsection
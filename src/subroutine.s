; test subroutine
TestSubroutine export 

    section mumu

TestSubroutine:
    lda     $0001
    adda    $0001
    adda    $0001 
    adda    $0001
    sta     $0001 
    rts

    endsection
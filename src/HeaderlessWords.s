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

; File: HeaderlessWords.s
; Description: This file contains auxiliar subroutines to make the code more concise

; Header Guards
    ifndef HEADERLESSWORDS_S
HEADERLESSWORDS_S = 1

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
    include "Macros.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Exports
;-------------------------------------------------------------------------------
DoCol       export              ; line
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Section HeaderlessWords: Some headerless subroutines that do not represent 
;   Forth words
;-------------------------------------------------------------------------------
    section HeaderlessWords 

;-------------------------------------------------------------------------------
;   Word: DoCol
;   Description: Starts a colon defined word
;-------------------------------------------------------------------------------
DoCol:
    pshu    Y                   ; save the current IP 
    puls    Y                   ; restore IP for the next word
    Next                        ; execute the next word
;---- End of COLON word --------------------------------------------------------

    endsection
;---- End of section HeaderlessWords -------------------------------------------

    endc
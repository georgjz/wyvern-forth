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

; File: CoreWords.s
; Description: This file contains the core words from the Forth-2010 standard

; Header Guards
    ifndef CORDWORDS_S
COREWORDS_S = 1

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
    include "Macros.inc"
    include "HeaderlessWords.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Exports
;-------------------------------------------------------------------------------
COLON       export              ; line
QUIT        export  
EXIT        export  
LITERAL     export  
KEY         export  
EMIT        export  
WORD        export  
TONUMBER    export  
FIND        export  
CREATE      export  
COMMA       export  
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Section Reset: Contains the start up code that will initialize Wyvern-Forth
;   and ready the Dragon 32/64 for execution.
;-------------------------------------------------------------------------------
    section CoreWords

;-------------------------------------------------------------------------------
;   Word: ":", COLON
;   Description: 
;-------------------------------------------------------------------------------
; header
_COLON:
    .word   $ffff               ; Top-most word
    .ascii  ":"                 ; name
    .byte   LENMASK & $01
COLON:
    .word   EXIT 
;---- End of COLON word --------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "QUIT", QUIT
;   Description: Resets the stack pointers and invokes INTERPRET
;-------------------------------------------------------------------------------
; header
_QUIT:
    .word   _COLON              ; link to previous word
    .ascii  "QUIT"              ; name
    .byte   LENMASK & $04
QUIT:
    .word   EXIT 
;---- End of QUIT word ---------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "EXIT", EXIT
;   Description: Returns from a colon-definition
;-------------------------------------------------------------------------------
; header
_EXIT:
    .word   _QUIT               ; link to previous word
    .ascii  "EXIT"              ; name
    .byte   LENMASK & $04
EXIT:
    pulu    Y                   ; restore old IP
    Next                        ; continue with next word
;---- End of EXIT word ---------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "LITERAL", LITERAL
;   Description: Puts a literal on the parameter stack
;-------------------------------------------------------------------------------
; header
_LITERAL:
    .word   _EXIT               ; link to previous word
    .ascii  "LITERAL"           ; name
    .byte   LENMASK & $06
LITERAL:
    .word   EXIT 
;---- End of LITERAL word ------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "KEY", KEY
;   Description: Read a single key stroke from input and place it in buffer
;-------------------------------------------------------------------------------
; header
_KEY:
    .word   _LITERAL            ; link to previous word
    .ascii  "KEY"               ; name
    .byte   LENMASK & $03
KEY:
    .word   EXIT 
;---- End of KEY word ----------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "EMIT", EMIT
;   Description: Print a char from parameter stack
;-------------------------------------------------------------------------------
; header
_EMIT:
    .word   _KEY                ; link to previous word
    .ascii  "EMIT"              ; name
    .byte   LENMASK & $04
EMIT:
    .word   EXIT 
;---- End of EMIT word ---------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "WORD", WORD
;   Description: Read a whole word from parameter stack
;-------------------------------------------------------------------------------
; header
_WORD:
    .word   _EMIT               ; link to previous word
    .ascii  "WORD"              ; name
    .byte   LENMASK & $04
WORD:
    .word   EXIT 
;---- End of WORD word ---------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: ">NUMBER", TONUMBER
;   Description: Turns a literal into a number
;-------------------------------------------------------------------------------
; header
_TONUMBER:
    .word   _WORD               ; link to previous word
    .ascii  ">NUMBER"           ; name
    .byte   LENMASK & $07
TONUMBER:
    .word   EXIT 
;---- End of TONUMBER word -----------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "FIND", FIND
;   Description: Finds the address of a word in the dictionary
;-------------------------------------------------------------------------------
; header
_FIND:
    .word   _TONUMBER           ; link to previous word
    .ascii  "FIND"              ; name
    .byte   LENMASK & $04
FIND:    
    .word   EXIT 
;---- End of FIND word ---------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: "CREATE", CREATE
;   Description: Create a new dictionary entry
;-------------------------------------------------------------------------------
; header
_CREATE:
    .word   _FIND               ; link to previous word
    .ascii  "CREATE"            ; name
    .byte   LENMASK & $06
FIND:    
    .word   EXIT 
;---- End of CREATE word -------------------------------------------------------

;-------------------------------------------------------------------------------
;   Word: ",", COMMA 
;   Description: 
;-------------------------------------------------------------------------------
; header
_COMMA:
    .word   _CREATE             ; link to previous word
    .ascii  ","                 ; name
    .byte   LENMASK & $01
COMMA:   
    .word   EXIT 
;---- End of COMMA word --------------------------------------------------------

    ; dummy file

    endsection
;---- End of section CoreWords -------------------------------------------------

    endc
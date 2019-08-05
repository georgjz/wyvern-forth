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
;   Macro: NEXT 
;   Description: Advances the Instruction Pointer by two (2) and jumps to the
;   next (code)word. Every word written in assembly code should end with NEXT.
;-------------------------------------------------------------------------------
Next macro
    tfr     Y,D                 ; save IP in W 
    jmp     [,Y++]              ; increment IP by 2, and jump indirect to old IP
    endm 

;---- End of macro NEXT --------------------------------------------------------

;-------------------------------------------------------------------------------
;   Macro: EXIT
;   Description: Returns from a colon-defined word that will usually begin with
;   DOCOL.
;-------------------------------------------------------------------------------
Exit macro
    pulu    Y                   ; restore old IP 
    Next                        ; execute next word
    endm
;---- End of macro EXIT --------------------------------------------------------
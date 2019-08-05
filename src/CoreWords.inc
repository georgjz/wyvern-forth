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

; File: CoreWords.inc
; Description: This file contains address of all core words

; Header Guards
    ifndef CORDWORDS_INC
COREWORDS_INC = 1

;-------------------------------------------------------------------------------
;   Imports
;-------------------------------------------------------------------------------
COLON       import              ; line
QUIT        import  
EXIT        import  
LITERAL     import  
KEY         import  
EMIT        import  
WORD        import  
TONUMBER    import  
;-------------------------------------------------------------------------------

    endc
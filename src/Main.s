; Copyright (C) 2019 Georg Ziegler
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
;   File: Neko.s
;   Author(s): Georg Ziegler
;   Description: This file contains subroutines to control the cat/neko
;   character that moves around the map
;

;----- Constants ---------------------------------------------------------------
;-------------------------------------------------------------------------------

; ;----- Assembler Directives ----------------------------------------------------
; .MEMORYMAP
; DEFAULTSLOT 0
; SLOTSIZE $4000
; SLOT 0 $4000
; .ENDME

; .ROMBANKMAP
; BANKSTOTAL 1 
; BANKSIZE $4000
; BANKS 1 
; .ENDRO
; ;-------------------------------------------------------------------------------

.include "MemoryMap.inc"

;-------------------------------------------------------------------------------
.bank 0 slot 0
.org $0200
;-------------------------------------------------------------------------------

Start:
    call    $c0 
    ret 
;--- End of Bank 0 Slot 0 ------------------------------------------------------


; ;-------------------------------------------------------------------------------
; .bank 0 slot 0
; .orga $4000
; ;-------------------------------------------------------------------------------
;     .byt    "AB"
;     .addr   Start 
;     .addr   $0000
;     .addr   $0000
;     .addr   $0000
;     .addr   $0000, $0000, $0000
; ;--- End of ROM header ---------------------------------------------------------
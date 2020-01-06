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

;----- Assembler Directives ----------------------------------------------------
.MEMORYMAP
DEFAULTSLOT 0
SLOTSIZE $4000
SLOT 0 $4000
.ENDME

.ROMBANKMAP
BANKSTOTAL 1 
BANKSIZE $4000
BANKS 1 
.ENDRO
;-------------------------------------------------------------------------------

; .rombanksize $1000
; .rombanks 4
   ;section main,code
; Simple code that fills the screen with garbage
.bank 0 slot 0
.org $0200
; .section "CODE" free

Start:
    call    $c0 
    ret 
; .ends 

    ; .org $4000
    ; section header,code

.bank 0 slot 0
.orga $4000
; .section "HEADER" free

    .byt    "AB"
    .addr   Start 
    .addr   $0000
    .addr   $0000
    .addr   $0000
    .addr   $0000, $0000, $0000

; .ends
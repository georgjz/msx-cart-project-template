; Copyright (C) 2020 Georg Ziegler
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
;   File: MemoryMap.inc
;   Author(s): Georg Ziegler
;   Description: This the memory map of the MSX cartridge. This memory map puts 
;   all code and data banks into one 16KB bank.
;

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

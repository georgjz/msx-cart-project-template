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
BORDER  =   $d020 
CHROUT  =   $ffd2 
;-------------------------------------------------------------------------------

;----- Assembler Directives ----------------------------------------------------
.p02
;-------------------------------------------------------------------------------


.segment "CODE"
; Simple code that fills the screen with garbage
ColdStart:
    lda $4710
    sta $d020
    sta $d021

    ldx #$00
loaddccimage:
    ; lda $3f40,x
    lda image,x
    sta $0400,x
    lda image+$0100,x
    sta $0500,x
    lda image+$0200,x
    sta $0600,x
    lda image+$0300,x
    sta $0700,x
    ; lda $4328,x
    lda image+$03e8,x
    sta $d800,x
    lda image+$04e8,x
    sta $d900,x
    lda image+$05e8,x
    sta $da00,x
    lda image+$06e8,x
    sta $db00,x
    inx
    bne loaddccimage

    lda #$3b
    sta $d011
    lda #$18
    sta $d016
    lda #$18
    sta $d018

loop:
    jmp loop

image:
.incbin "dcc.pal"

WarmStart:
    lda     #$04
    sta     BORDER 
    lda     #147
    sta     CHROUT 
    rts 

Loop:
    jmp     Loop

.segment "HEADER"
    ; .addr   $8009
    .addr   ColdStart 
    ; .addr   $8025 
    .addr   WarmStart 
    .byte   $c3, $c2, $cd, $38, $30


    ; .BYTE	$09, $80			; Cartridge cold-start vector = $8009
    ; .BYTE	$25, $80			; Cartridge warm-start vector = $8025
    ; .BYTE	$C3, $C2, $CD, $38, $30		; CBM8O - Autostart key


;	KERNAL RESET ROUTINE
    ; STX $D016				; Turn on VIC for PAL / NTSC check
    ; JSR $FDA3				; IOINIT - Init CIA chips
    ; JSR $FD50				; RANTAM - Clear/test system RAM
    ; JSR $FD15				; RESTOR - Init KERNAL RAM vectors
    ; JSR $FF5B				; CINT   - Init VIC and screen editor
    ; CLI					; Re-enable IRQ interrupts


;	BASIC RESET  Routine

    ; JSR $E453				; Init BASIC RAM vectors
    ; JSR $E3BF				; Main BASIC RAM Init routine
    ; JSR $E422				; Power-up message / NEW command
    ; LDX #$FB
    ; TXS					; Reduce stack pointer for BASIC

    
;	START YOUR PROGRAM HERE ($8025)

    ; LDA #4		; CHANGE BORDER COLOUR TO 
    ; STA BORDER		; BLACK
    ; LDA #147		; PRINT CHR$(147) TO CLEAR
    ; JSR CHROUT		; SCREEN
    ; RTS
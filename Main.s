{
 Redline 2 (POC)
 https://github.com/albs-br/
 version 0.0.2
 developed set/2020-
 for MSX 1 computers

 File to be assembled by tniasm 0.45

 Tested on emulators WebMSX, Emulicious (C-Bios) and openMSX (various bios)

 Acknowledgements:
 -https://datassette.org/
 -Msx.org and users
 -Web MSX
 -Open MSX
 -Emulicious
 -MSX Pen
 -MSX Community in Brazil, Facebook and Whatsapp groups
 -8 bit workshop
 -TinySprite
}

FNAME "redline2.rom"      ; output file

INCLUDE "include/msxbios.s"
INCLUDE "include/vram.s"


;RomSize:	equ 0x4000	            ; For 16kB Rom size.
RomSize:	equ 0x8000	            ; For 32kB Rom size.


; DEBUG:      equ 255                 ; defines debug mode, value is irrelevant (comment out for production version)

; Compilation address
	org 0x4000	                    ; 0x8000 can be also used here if Rom size is 16kB or less.
 
INCLUDE "include/romheader.s"

; Program code entry point
Execute:

; init interrupt mode and stack pointer (in case the ROM isn't the first thing to be loaded)
	di                      ; disable interrupts
	im	1                   ; interrupt mode 1
    ld sp, (BIOS_HIMEM)     ; init SP

    call ClearRam

    call InitVram


    call EnableRomPage2

    call InitVariables

MainLoop:

    ;Switch name tables
    ;vdp(2)=7			'7x1024 = 7168
    call SetNameTable_1
    ld a, (Speed)
    ld d, a
    call Delay

    ;vdp(2)=6			'6x1024 = 6144
    call SetNameTable_2
    ld a, (Speed)
    ld d, a
    call Delay

    call GameLogic

    call UpdateScreen

    jp MainLoop

; Halt program execution. Change to "ret" to return to MSX-BASIC.
 


Finished:
	jr	Finished	; Jump to itself endlessly.
 

 ; Routines
INCLUDE "InitVram.s"
INCLUDE "Include/CommonRoutines.s"
INCLUDE "Constants.s"
INCLUDE "GameLogic.s"
INCLUDE "InitVariables.s"
INCLUDE "UpdateScreen.s"



 ; Data
INCLUDE "Graphics/Sprites/Sprites.s"
INCLUDE "Graphics/Road/Frames.s"





End:
	ds TableAlignedDataStart - End, 255	; 8000h + RomSize - End if org 8000h



	org 0xbd00	                    ; table aligned data
TableAlignedDataStart:
INCLUDE "Data/Data.s"

;	org 0xbe00	                    ; table aligned data
INCLUDE "Data/Road_Left.s"

TableAlignedDataEnd:

; Padding with 255 to make the file of 16K/32K size (can be 4K, 8K, 16k, etc) but
; some MSX emulators or Rom loaders can not load 4K/8K Roms.
; (Alternatively, include macros.asm and use ALIGN 4000H)
	ds 0x4000 + RomSize - TableAlignedDataEnd, 255	; 8000h + RomSize - End if org 8000h



; Variables (mapped to RAM memory)
	org 0xc000, 0xefff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)
	; CAUTION: do not use 0xe000, it causes the game to crash on real machines with some SD mappers
    ;org 0xe000                          ; for machines with 8kb of RAM (use it if you need 8kb RAM or less, will work on any machine)

; use max addr for RAM:
;         ORG  4000h,7FFFh        ; start from 4000h, warn if exceeding 7FFFh

RamStart:

INCLUDE "Variables.s"
; INCLUDE 'VramSpriteAttrBuffer.s'

RamEnd:



InitVram:


	; call BIOS_DISSCR		; 

; Define screen colors and mode
    ld a, 15                ; Foregoung color
    ld (BIOS_FORCLR), a    
    ld a, 4                 ; Backgroung color
    ld (BIOS_BAKCLR), a     
    ld a, 5                 ; Border color
    ld (BIOS_BDRCLR), a    
    ld a, 2                 ; Screen mode (0 to 3 for MSX1)
    call BIOS_CHGCLR        ; Change Screen Color

    ld a, 0
    ld (ADDR_CLIKSW), a     ; Key Press Click Switch 0:Off 1:On (1B/RW)

    call BIOS_INIGRP        ; Screen 2




; Set screen 2
	ld	a, 2	               		; Screen Mode (0..3 for MSX 1)
    call BIOS_CHGMOD        		; 

; Initialize VDP registers

; Write to VDP register 5 (define the address of the Sprite Attribute Table)
; Set it to 6912 (128 x 54)
; https://www.msx.org/wiki/VDP_Table_Base_Address_Registers#Control_Registers_5_and_11
	ld	c, 5	               		; VDP Register Number (0..27, 32..46)
	ld	b, 54	               		; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 6 (defines the address of the Sprite Pattern Table.)
; Set it to 14336 (2048 x 7)
; https://www.msx.org/wiki/VDP_Table_Base_Address_Registers#Control_Registers_5_and_11
	ld	c, 6	               		; VDP Register Number (0..27, 32..46)
	ld	b, 7	               		; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 1 (Set Screen mode, sprites size, Vblank, Display, VRAM mode setting)
; Set it to 225 (‭1110 0001‬ b)
; bit 7: 4/16K selects VRAM configuration. Write 1 if the VDP is not a V9938 nor V9958.
; bit 6: BL disables the screen display when reseted.VDP's commands work a bit faster as well. Screen display is displayed by default.
; bit 5: IE0 enables (1) or disable (0) the vertical retrace interrupts that occur at just after each display of the screen (foreground).
; bit 4: M2 is one of bits that defines the screen mode. (Write 1 to set the SCREEN 3)
; bit 3: M1 is one of bits that defines the screen mode. (Write 1 to set the SCREEN 0)
; bit 2: not used (always 0)
; bit 1: SI defines the sprite size. Write 1 to use 16x16 sprites, 0 to use 8x8 sprites.
; bit 0: MAG enlarges the sprites when 1 is written. (0 by default)
; https://www.msx.org/wiki/VDP_Mode_Registers#Control_Register_1
	ld	c, 1	               		; VDP Register Number (0..27, 32..46)
	ld	b, 0xe2; ‭% 1110 0010   	 ; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 2 (determines the base address of the Name Table which constitutes the foreground.)
; Screen 2: set it to 6144 (1024 x 6)
	; ld	c, 2	               		; VDP Register Number (0..27, 32..46)
	; ld	b, 6	               		; Data To Write
    ; call BIOS_WRTVDP        		; Block transfer to VRAM from memory


; --------------------------------------------------


	call ClearVRAM




; Define patterns
	ld	bc, 0 + (Frame1_PatternTable_1-Frame1_PatternTable_0)					; Block length
	ld	de, PatternsTable   													; VRAM start address
	ld	hl, Frame1_PatternTable_0        										; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_PatternTable_2-Frame1_PatternTable_1)					; Block length
	ld	de, PatternsTable + (256*8)												; VRAM start address
	ld	hl, Frame1_PatternTable_1        										; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	;Write pattern table twice (is the same for both colors)
	ld	bc, 0 + (Frame1_PatternTable_2-Frame1_PatternTable_1)					; Block length
	ld	de, PatternsTable + (256*8)	+ (Frame1_PatternTable_2-Frame1_PatternTable_1); VRAM start address
	ld	hl, Frame1_PatternTable_1        										; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_PatternTable_End-Frame1_PatternTable_2)					; Block length
	ld	de, PatternsTable + (512*8)												; VRAM start address
	ld	hl, Frame1_PatternTable_2        										; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory



; ; Define colors
	ld	bc, 0 + (Frame1_ColorTable_1-Frame1_ColorTable_0)						; Block length
	ld	de, ColorsTable   														; VRAM start address
	ld	hl, Frame1_ColorTable_0        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_ColorTable_2-Frame1_ColorTable_1)						; Block length
	ld	de, ColorsTable + (256*8)												; VRAM start address
	ld	hl, Frame1_ColorTable_1        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_ColorTable_End-Frame1_ColorTable_2)						; Block length
	ld	de, ColorsTable + (512*8)												; VRAM start address
	ld	hl, Frame1_ColorTable_2        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory


; Fill names table
	ld	bc, 0 + (Frame1_NameTable_1-Frame1_NameTable_0)							; Block length
	ld	de, NamesTable   														; VRAM start address
	ld	hl, Frame1_NameTable_0        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_NameTable_2-Frame1_NameTable_1)							; Block length
	ld	de, NamesTable + 256   													; VRAM start address
	ld	hl, Frame1_NameTable_1        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_NameTable_End-Frame1_NameTable_2)						; Block length
	ld	de, NamesTable + 512   													; VRAM start address
	ld	hl, Frame1_NameTable_2        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory




; Fill names table alternate
	ld	bc, 0 + (Frame1_NameTable_1-Frame1_NameTable_0)							; Block length
	ld	de, NamesTableAlt  														; VRAM start address
	ld	hl, Frame1_NameTable_0        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (FrameAlt_NameTable_2-FrameAlt_NameTable_1)						; Block length
	ld	de, NamesTableAlt + 256   												; VRAM start address
	ld	hl, FrameAlt_NameTable_1        										; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

	ld	bc, 0 + (Frame1_NameTable_End-Frame1_NameTable_2)						; Block length
	ld	de, NamesTableAlt + 512   												; VRAM start address
	ld	hl, Frame1_NameTable_2        											; RAM start address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory



; Define sprites
NumberOfSprites:	equ 10			;

	ld	bc, 32 * NumberOfSprites	; Block length
	ld	de, SpritePatternTable		; VRAM address
	ld	hl, SpritePatterns     		; RAM address
    call BIOS_LDIRVM        		; Block transfer to VRAM from memory


	ret




SetNameTable_1:
; Write to VDP register 2 (determines the base address of the Name Table which constitutes the foreground.)
; Screen 2: set it to 6144 (1024 x 6)
	ld	c, 2	               		; VDP Register Number (0..27, 32..46)
	ld	b, 6	               		; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory
	ret

SetNameTable_2:
; Write to VDP register 2 (determines the base address of the Name Table which constitutes the foreground.)
; Screen 2: set it to 7168 (1024 x 7)
	ld	c, 2	               		; VDP Register Number (0..27, 32..46)
	ld	b, 7	               		; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory
	ret
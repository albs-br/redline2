FIRST_LINE_ROAD:            equ 64
LAST_LINE_OUTSIDE_ROAD:     equ FIRST_LINE_ROAD + 27 - 2 - 1        ; -2: becouse the object appears 2 pixels over the first line on first frame
                                                                    ; -1: compensate the 9918 VDP issue with sprites Y position

OBJECT_Y_INIT:              equ FIRST_LINE_ROAD - 2 - 1

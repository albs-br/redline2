; rb n  = reserve n bytes in RAM
; rw n  = reserve n words in RAM

    Counter:                    rw 1                        ; Global counter
    Speed:                      rb 1
    
; Struct object:
Struct_Obj_Size:                equ 6
Struct_Obj:
.X:                             equ 0
.Y:                             equ 1
.width:                         equ 2
.height:                        equ 3
.column:                        equ 4
.row:                           equ 5
.pattern_0:                     equ 6
.pattern_1:                     equ 7

    LeftObject_0:               rb Struct_Obj_Size          ; Object at the left side of track
    LeftObject_1:               rb Struct_Obj_Size          ; Object at the left side of track
    LeftObject_2:               rb Struct_Obj_Size          ; Object at the left side of track

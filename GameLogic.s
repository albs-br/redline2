GameLogic:


    ; ld ix, LeftObject_0
    ; inc (ix + Struct_Obj.Y)

    ld a, (LeftObject_0 + Struct_Obj.Y)
    inc a
    cp LAST_LINE_OUTSIDE_ROAD + 1
    jp nz, .continue1

    ld a, OBJECT_Y_INIT                         ; reset LeftObject

.continue1:
    ld (LeftObject_0 + Struct_Obj.Y), a         ; save updated value


    ; get X position for pseudo 3d effect
    ; y position should be on A register
    ld hl, ObjectPositionLookupTable_Left
    
    ;ld a, 64+15

    sub OBJECT_Y_INIT
    add l                                       ; no need to change H as the data is table aligned
    ld l, a
    ld a, (hl)                                  ; get x
    ld (LeftObject_0 + Struct_Obj.X), a         ; save x value


    ; ld hl, Counter
    ; inc (hl)


    ret
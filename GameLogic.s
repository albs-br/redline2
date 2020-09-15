GameLogic:

    ; get Y position and increment it
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
    sub OBJECT_Y_INIT
    add l                                       ; no need to change H as the data is table aligned
    ld l, a
    ld a, (hl)                                  ; get x
    ld (LeftObject_0 + Struct_Obj.X), a         ; save x value


    ; get object size for pseudo 3d effect
    ; y position should be on A register
    ld a, (LeftObject_0 + Struct_Obj.Y)
    ld hl, ObjectSizeLookupTable
    sub OBJECT_Y_INIT
    add l                                       ; no need to change H as the data is table aligned
    ld l, a
    ld a, (hl)                                  ; get size
    ld (LeftObject_0 + Struct_Obj.pattern_0), a ; save
    add 4
    ld (LeftObject_0 + Struct_Obj.pattern_1), a ; save





    ld hl, Counter
    inc (hl)


    ret
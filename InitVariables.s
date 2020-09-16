InitVariables:

    ld a, 0
    ld (Counter), a

    ld a, OBJECT_Y_INIT
    ld (LeftObject_0 + Struct_Obj.Y), a
    ; ld a, 0
    ; ld (LeftObject_0 + Struct_Obj.X), a

    ld a, 0x80
    ld (Speed), a

    ret
UpdateScreen:

    ld hl, SpriteAttrTable
    ld a, (LeftObject_0 + Struct_Obj.Y)
    call BIOS_WRTVRM

    inc hl    
    ld a, (LeftObject_0 + Struct_Obj.X)
    call BIOS_WRTVRM

    inc hl    
    ld a, (LeftObject_0 + Struct_Obj.pattern_0)
    call BIOS_WRTVRM

    inc hl    
    ld a, 1 ;color
    call BIOS_WRTVRM

;-----

    inc hl    
    ld a, (LeftObject_0 + Struct_Obj.Y)
    call BIOS_WRTVRM

    inc hl    
    ld a, (LeftObject_0 + Struct_Obj.X)
    call BIOS_WRTVRM

    inc hl    
    ld a, (LeftObject_0 + Struct_Obj.pattern_1)
    call BIOS_WRTVRM

    inc hl    
    ld a, 15 ;color
    call BIOS_WRTVRM



    ret
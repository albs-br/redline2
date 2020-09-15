
; Converts the object position from (col, row) to (x, y) on screen, to give the pseudo 3D aspect
ObjectPositionLookupTable_Road:
; format:
; input:
;   row (0-47)
; output:
;   one byte for each row

; 5 x 48 = 240 bytes

;    db  0,      ?, ?, ?, ?, ?



;ObjectPositionLookupTable_Right:
; one byte per value
;db     ?       ; row 0
;db     ?       ; row 1
;...
;db     ?       ; row 47


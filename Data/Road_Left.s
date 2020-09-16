ObjectPositionLookupTable_Left:
    db 111         ; size for line 0
    db 107         ; x coord for line 1
    db 103         ; x coord for line 2
    db 99         ; x coord for line 3
    db 95         ; x coord for line 4
    db 90         ; x coord for line 5
    db 86         ; x coord for line 6
    db 82         ; x coord for line 7
    db 78         ; x coord for line 8
    db 74         ; x coord for line 9
    db 70         ; x coord for line 10
    db 66         ; x coord for line 11
    db 62         ; x coord for line 12
    db 58         ; x coord for line 13
    db 53         ; x coord for line 14
    db 49         ; x coord for line 15
    db 45         ; x coord for line 16
    db 41         ; x coord for line 17
    db 37         ; x coord for line 18
    db 33         ; x coord for line 19
    db 29         ; x coord for line 20
    db 25         ; x coord for line 21
    db 21         ; x coord for line 22
    db 16         ; x coord for line 23
    db 12         ; x coord for line 24
    db 8         ; x coord for line 25
    db 4         ; x coord for line 26
    db 0         ; x coord for line 27


ObjectSizeLookupTable:
    db 0, 0, 0, 0                         ; size for lines 0-n
    db 8, 8, 8, 8, 8                         ; size for lines ?-?
    db 16, 16, 16, 16, 16, 16, 24, 24, 24, 24, 24, 24, 32, 32, 32, 32, 32, 32, 32   ; size for lines ?-?
    db 0, 32, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24   ; size for lines ?-?
    db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32   ; size for lines ?-47

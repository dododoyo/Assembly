ARRAY DW 5, 8, 12, 1 ;declaring array

MOV AX, 0
MOV BX, 0
MOV DX, 18h

DO: 
ADD AX, ARRAY[BX]
INC BX

CMP AX, DX

JLE DO

; do while loop in assembly 
;while the contents of AL is less than 
;or equal to 24 add elements from the array 
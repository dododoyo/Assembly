
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Start of the code
MOV AX, 300 ; x
MOV BX, 10 ; y

; Compare x and y
CMP AX, BX

; If x > y, jump to the 'x_greater' label
JG x_greater  
          
; If x <= y, print "y greater than x"
JLE y_greater    



y_greater:  
LEA DX, ymsg
MOV AH, 9
INT 21h
JMP end

x_greater:
; Print "x greater than y"
LEA DX, xmsg
MOV AH, 9
INT 21h

end:
; Exit the program
MOV AH, 4Ch
INT 21h

ret

; Define the messages
xmsg DW "x greater than y$"
ymsg DW "y greater than x$"
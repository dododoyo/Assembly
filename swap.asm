mov ax,1234h
mov bx,5678h

push ax
push bx 

pop ax
pop bx


;after these operations, the `ax` register holds the value 5678h
;and the bx register holds the value `1234h`. 
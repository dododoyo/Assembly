start:
code segment
mov ax,1234h ; move the number 1234 to ax register
mov bx,4321h ; move the number 4321 to dx register
add ax,bx    ; add value of dx into ax   

mov ax,4c00h
int 21h
code ends

end start
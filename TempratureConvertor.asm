name  "input"
org 100h ;locate code starting here

jmp start
input db  ?  ;reserve memory for i/p
output db ?  ;and for o/p 

;take a two digit no and save @input 
start:
lea bx, input  ;
mov si, bx ;keep the input address

mov cx, 2 ;no of chars.


INP:
mov ah, 1
int 21h 
mov [bx], al    ;save the i/p
inc bx
loop  INP 


name  "conversion"
mov dl, 10  
mov al, [si] ;fist digit 
and al, 0Fh    ;change to decimal
mul dl  ;10’s decimal place
inc si
mov dl, [si] ;second digit
and dl, 0Fh   ;change to decimal
add al, dl ;one’s decimal place

;f = (c*9)/5 + 32
mov dl, 9
mul dl ;multiply by 9 

mov dl, 5
div dl  ;divide by 5 

add al, 32  ;add 32


name  "format"
; change result to ASCII & store @output
mov cx, 3
lea  bx,  output  ;point in memory @output 
add  bx, 2 ;start at one’s decimal place
mov di, bx
mov dl, 10

ascii:
mov ah, 0
cmp al, 10
jb done
div dl  ;ax/10: q=al, r=ah 
or ah, 30h ;convert to ASCII

mov [bx], ah
dec bx
loop ascii

done: 
or al, 30h ;one’s place
mov [bx], al


name "display" 
mov cx, 2 
lea si, input

mov ah, 2
mov dl, 10 ; ASCII value of newline
int 21h

ip: 
mov dl, [si] ;display input  
int 21h
inc  si
loop  ip

mov ah,2
mov dl, 'C' ;display C  
int 21h


mov cx,3 ;display output


op: 
cmp bx, di
ja finish

mov ah,2
mov dl,[bx]
int 21h
inc bx
loop op

finish: 

mov ah,2
mov dl,"F"   ;display F
int 21h

ret  ;return to operating system
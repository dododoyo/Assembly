data segment 
arr1 db 10,1,2,3,4,5,6,7,8,9,10;first size of array then elements
arr2 db 10 dup(0)
data ends 

code segment 
assume cs:code,ds:data

; for cs code execution starts from 
; the first line of code segment initialization

; but not for ds we have to do it manually

start:
mov ax,data
mov ds,ax
mov es,ax

;load_effective_address of arr1 to source index register 
;load_effective_address of arr2 to destination idnex register

lea si,arr1
lea di,arr2
                

;move the arr1 pointer's value(length of arr1) to cl 
mov cl,[si]         
mov ch,00h

;increment si to go to the next index
;because the first index is the length 
;which is doesn't need to be copied
inc si

;clear direction flag to go from low index to high index
cld

rep movsb       

mov ax,4c00h
int 21h 

code ends   

end start     
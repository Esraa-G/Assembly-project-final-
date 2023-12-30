;Assembly fina project 
;by: Esraa Gamal Elsayed Elsayed Salah   and   Asmaa Yaseen Mohamed 

;Start of the program 
.model small
.data
 arr db   0,1,2,4,5,8,9
 msg1 db  "The array of elements we have is :0,1,2,4,5,8,9 ","$"
 msg3 db  "Emter the element you search for  ","$"
 line db 0dh,0ah ,"$"
 success_message db 'Element is found.', "$"
 failure_message db 'Element is not found.', "$"
 target db ?
 
 
.code
 main proc far
 .startup
 lea dx,msg1
 mov ah,09h
 int 21h
 
 call newline
 call newline
 
 
 lea dx,msg3
 mov ah,09h
 int 21h
 
 mov ah,01h
 int 21h
 
 call newline
 call newline
 
 mov target,al
 
 ; Initialize binary search
 mov cl, target
 mov si, 0
 mov di, 6
    
 call binarysearch



 
 ;  user input to close

 
 .exit
 main endp
 
 
 binarysearch proc near
 ; Binary Search Algorithm
 
 while_loop:
    cmp si, di
    jg  notfound; if si > di, search is complete and the element is not found
   
   
    ; Calculate middle index
    mov bx, si
    add bx, di
    shr bx, 1 ;to div the sum by 2

    ; comparing the array element wz z middle index one
    mov al, arr[bx]
    add al,30h
    cmp al, cl
    je found
    jb less_than_target ; if array[mid] < target, search right half
    ja greater_than_target ; if array[mid] > target, search left half
    
    
  

    less_than_target:
    inc  bx
    mov si,bx ; Move to the right half
    jmp while_loop
    
    
    greater_than_target:
    dec bx
    mov di,bx   ; Move to the left half
    jmp while_loop
    
    found:
    mov ah, 9
    lea dx, success_message
    int 21h
    jmp stop
    
    notfound:
    mov ah, 9
    lea dx, failure_message
    int 21h
   
    stop:
    mov ah, 4ch
    int 21h
    
   
BinarySearch endp

newline proc near 
    lea dx,line
    mov ah,09h
    int 21h
    ret
newline endp
end main


; future work : we 'd make the system show the solving steps as a simulation for how it discovers if the element in the array or not 
; we 've already started to implement it and we 'd continue it 






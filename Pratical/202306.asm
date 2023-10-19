.model small
.stack 100
.data    

num db 1,2,3,4,5,6,7,8,9
max db ?
min db ?

Messagemin db 13,10,"Minimum digit is $"
Messagemax db 13,10,"Maximum digit is $"

.code
main proc
    mov ax, @data
    mov ds, ax           

    mov cx,9
    lea si,num
    mov al,num[0]
    mov min,al
    compare:
        mov al,[si] + 1
        cmp al,min
        JG maxNum
        JL minNUm
        JNG skip

        maxNum:
        mov max,al
        JMP skip

        minNum:
        mov min,al

        skip:
        inc si

    loop compare

    mov ah,09h
    lea dx,Messagemax
    int 21h

    mov ah,02h
    mov dl,max
    add dl,30h
    int 21h

    mov ah,09h
    lea dx,Messagemin
    int 21h

    mov ah,02h
    mov dl,min
    add dl,30h
    int 21h
   
    mov ah, 4ch
    int 21h   

main endp
end main

.model small
.stack 100
.data


total db ?


msg1 DB 13,10,"Enter a number : $"
msg2 DB 13,10,"The total of 4 numbers : $"

.code
main proc
    mov ax,@data
    mov ds,ax

    mov cx,4
    totalAll:
        mov ah,09h
        lea dx,msg1
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        
        ADD total,al

    loop totalAll

    mov ah,09h
    lea dx,msg2
    int 21h

    mov ah,00
    mov al,total
    mov bl,10
    div bl
    mov bl,ah

    mov ah,02h
    mov dl,al
    add dl,30h
    int 21h

    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h

    mov ax,4c00h
    int 21h

main endp
end main
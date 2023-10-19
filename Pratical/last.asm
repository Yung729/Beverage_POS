.model small
.stack 100
.data

str LABEL BYTE
str_length DB 9
actualLength db ?
str_data db 9 DUP('$')


msg1 db "Please enter your password (8 character in length) >> $"
msg2 db 13,10,"The password will be encrypted to            >> $"

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,0Ah
    lea dx,str
    int 21h

    mov ah,09h
    lea dx,msg2
    int 21h

    lea si,str_data
    mov cl,actualLength
    mov ah,02h
    encrypt:
        mov dl,[si]
        inc dl
        int 21h
        inc si
    loop encrypt

    mov ah,4ch 
    int 21h

main endp
end main
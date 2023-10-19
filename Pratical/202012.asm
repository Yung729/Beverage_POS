.model small
.stack 100
.data

msg1 db 13,10,"Enter character (max 9): $"
msg2 db 13,10,"After reverse : $"
msg3 db 13,10,"You have entered  $"
msg4 db " character(s).$"

str LABEL byte
strLength db 10
actualLength db ?
str_data db 10 dup('$')

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

    mov cl,actualLength
    mov ah,02h
    reverse:
        mov si,cx
        mov dl,str_data[si-1] 
        int 21h
    loop reverse

    mov ah,09h
    lea dx,msg3
    int 21h

    mov ah,02h
    mov dl,actualLength
    add dl,30h
    int 21h

    mov ah,09h
    lea dx,msg4
    int 21h

    mov ah,4ch
    int 21h
main endp
end main
.model small
.stack 100
.data

str LABEL BYTE
str_Length DB 9
Actual_Length DB ?
str_Data DB 9 DUP(?)

msg1 DB "Please Enter an 8-character word >> $"
msg2 DB 13,10,"Total number of A and a in the word is >> $"

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,0AH
    LEA dx,str
    int 21h

    lea si,str_Data
    mov cl,Actual_Length
    countA:
        mov al,[si]
        cmp al,'A'
        JE addCount
        cmp al,'a'
        JE addCount
        JMP skip

        addCount:
        add bl,1

        skip:
        inc si

    loop countA

    mov ah,09h
    lea dx,msg2
    int 21h

    add bl,30h
    mov ah,02h
    mov dl,bl
    int 21h

    mov ax,4c00h
    int 21h

main endp
end main
.model small
.stack 100
.data

str LABEL BYTE
str_Length DB 20
Actual_Length DB ?
str_Data DB 20 DUP(?)

msg1 DB "Please Enter a sentence >> $"
msg2 DB 13,10,"The sentence in all lowercase is >> $"

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

    mov ah,09h
    lea dx,msg2
    int 21h

    lea si,str_Data
    mov cl,Actual_Length
    mov ah,02h
    convertCase:
        mov al,[si]
        cmp al,'A'
        JGE doubleCheck
        JMP display

        doubleCheck:
        cmp al,'Z'
        JLE changeCase
        JMP display

        changeCase:
        add al,20h

        display:
        mov dl,al
        int 21h
        inc si

    loop convertCase

    

    mov ax,4c00h
    int 21h

main endp
end main
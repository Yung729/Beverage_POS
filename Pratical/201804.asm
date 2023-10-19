.model small
.stack 100
.data

str LABEL BYTE
str_Length DB 20
Actual_Length DB ?
str_Data DB 20 DUP(?)

count db ?
remainder db ?

msg1 DB "Enter a sentence : $"
msg2 DB 13,10,"Total occurrence of the letter 's' : $"

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
    finds:
        mov al,[si]
        cmp al,'s'
        JE soccur
        JNE skip

        soccur:
            inc count

        skip:
        inc si

    loop finds

    mov ah,09h
    lea dx,msg2
    int 21h

    mov ah,00
    mov al,count
    mov bl,10
    div bl
    mov remainder,ah

    mov ah,02h
    mov dl,al
    add dl,30h
    int 21h
 
    mov ah,02h
    mov dl,remainder
    add dl,30h
    int 21h


    mov ax,4c00h
    int 21h

main endp
end main
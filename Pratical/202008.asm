.model small
.stack 100
.data

msg1 db "Enter Data : $"
validMsg db 13,10,"Valid Input ! $"
invalidMsg db 13,10,"Invalid Input ! $"

str LABEL byte
strLength db 6
actualLength db ?
str_data db 6 dup('$')

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

    lea si,str_data
    mov cl,actualLength
    check:
        mov al,[si]
        cmp al,'A'
        JL invalidInput
        cmp al,'Z'
        JG invalidInput
        JMP validInput
        

    loop check


    invalidInput:
        mov ah,09h
        lea dx,invalidMsg
        int 21h
        JMP endProgram

    validInput:
        mov ah,09h
        lea dx,validMsg
        int 21h

    endProgram:
    mov ah,4ch
    int 21h

main endp
end main
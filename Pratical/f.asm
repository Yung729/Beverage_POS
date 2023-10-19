.model small
.stack 100
.data    

str LABEL BYTE
str_Length DB 24
Actual_Length DB ?
str_Data DB 24 DUP(?)

msg1 db 13,10,"Enter character (max 24): $"
msg2 db 13,10,"Your corrected message is $"

.code
main proc
    mov ax, @data
    mov ds, ax           

    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,0AH
    LEA DX,str
    int 21h

    lea si,str_Data
    mov cl,Actual_Length
    replace:
       mov al,[si]
       cmp al,'3'
       je change3
       jne skip

       change3:
            mov al,'e'
            mov [si],al

       skip: 
       inc si
    loop replace

    mov ah,09h
    lea dx,msg2
    int 21h

    lea si,str_Data
    mov cl,Actual_Length
    mov ah,02h
    display:
        mov al,[si]
        mov dl,al
        int 21h
        inc si
    loop display

    

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

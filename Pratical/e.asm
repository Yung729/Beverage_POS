.model small
.stack 100
.data    

str LABEL BYTE
str_Length DB 20
Actual_Length DB ?
str_Data DB 20 DUP(?)

msg1 db 13,10,"Enter a sentencec :$"
msg2 db 13,10,"The proper case of the sentence : $"
msg3 db 13,10,"Invalid character $"

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
    count:
       MOV al,[si]
       cmp al,41h
       JL invalid
       cmp al,5AH
       JG lowercase

       lowercase:
       cmp al,'a'
       JL invalid
       cmp al,'z'
       JG invalid
        
       inc si
    loop count

    MOV al,str_Data[0]
    cmp al,'a'
    JGE change
    cmp al,'z'
    JLE change
    jmp display

    invalid:
       MOV ah,09h
       lea dx,msg3
       int 21h
       jmp end_program
    
    
    change:
        sub al,20h
        mov str_Data[0],al

    
    display:
        mov ah,09h
        lea dx,msg2
        int 21h

        lea si,str_Data
        mov cl,Actual_Length
        mov ah,02h
        display1:
         MOV dl,[si]
         int 21h
        
         inc si
        loop display1

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

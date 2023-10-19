.model small
.stack 100
.data    

msg1 db 13,10,"Enter movie rating(1-5): $"
msg2 db 13,10,"Movie Rating : $"
msg3 db 13,10,"Invalid Choice ! $"

.code
main proc
    mov ax, @data
    mov ds, ax           

    enter:
    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
    cmp al,1
    JL invalid
    cmp al,5
    JG invalid
    jmp display

    invalid:
    mov ah,09h
    lea dx,msg3
    int 21h
    jmp enter

    display:
        mov ah,09h
        lea dx,msg2
        int 21h

        mov cl,al
        mov ah,02h
        display_asterist:
            mov dl,'*'
            int 21h
        loop display_asterist
    


    

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

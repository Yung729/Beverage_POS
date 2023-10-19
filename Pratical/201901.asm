.model small
.stack 100
.data    

msg1 db 13,10,"Enter score : $"
msg2 db 13,10,"Grade : $"
msg3 db 13,10,"Invalid Choice ! $"

passMsg db "Pass $"
failMsg db "Fail $"
MeritMsg db "Merit $"
DistinctionMsg db "Distinction $"

.code
main proc
    mov ax, @data
    mov ds, ax           

    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,01h
    int 21h

    mov ah,09h
    lea dx,msg2
    int 21h

    cmp al,'5'
    JE pass
    JL fail
    cmp al,'7'
    JLE merit
    cmp al,'9'
    JLE distinction

    pass:
    lea dx,passMsg
    int 21h
    jmp end_program

    fail:
    lea dx,failMsg
    int 21h
    jmp end_program

    merit:
    lea dx,MeritMsg
    int 21h
    jmp end_program

    distinction:
    lea dx,DistinctionMsg
    int 21h
    jmp end_program


end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

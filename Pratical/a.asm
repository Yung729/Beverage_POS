.model small
.stack 100
.data    

msg1 db "Enter a character(a-z or A-Z): $"
msg2 db 13,10,"You have entered an uppercase $"
msg3 db 13,10,"You have entered a lowercase $"
msg4 db 13,10,"Invalid input! Only a-z or A-Z allowed.$"

.code
main proc
    mov ax, @data
    mov ds, ax           
    
Input:
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    mov ah, 01h
    int 21h

    ; Check if it's a valid letter (a-z or A-Z)
    cmp al, 'a'
    jl double_check
    cmp al, 'z'
    jle lowercase

    double_check:
    cmp al, 'Z'
    jg invalid_input
    cmp al, 'A'
    jl invalid_input

    jmp uppercase


lowercase:
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov ah, 02h
    mov dl, al
    int 21h
    jmp end_program

uppercase:
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 02h
    mov dl, al
    int 21h
    jmp end_program

invalid_input:
    mov ah, 09h
    lea dx, msg4
    int 21h

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

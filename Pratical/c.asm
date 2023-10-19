.model small
.stack 100
.data    

LIST1 DB 1,2,3,4,5
LIST2 DB 5,4,3,2,1

.code
main proc
    mov ax, @data
    mov ds, ax           

	lea si,LIST1
    lea di,LIST2
    mov cx,5
    multiple:
        mov al,[si]
        mov bl,[di]
        mul bl

        mov ah,02h
        mov dl,al
        add dl,30h
        int 21h        

        inc si
        inc di
    Loop multiple

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

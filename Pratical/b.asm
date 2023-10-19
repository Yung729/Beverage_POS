.model small
.stack 100
.data    

number db 1,2,3,4,5
total db ?
Message db "The total of odd numbers is :$"

.code
main proc
    mov ax, @data
    mov ds, ax           

	lea si,number
	mov ah,00
	mov cx,5
	mov bl,2
	check_number:

		mov al,[si]
		div bl

		cmp ah,0
		jg odd_number
		jmp skip

		odd_number:
			mov al,[si]
			ADD total,al

		skip:
		inc si
	loop check_number

	mov ah,09h
	lea dx,Message
	int 21h

	mov ah,02h
	mov dl,total
	add dl,30h
	int 21h

end_program:
    mov ah, 4ch
    int 21h   

main endp
end main

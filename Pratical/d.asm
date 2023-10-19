.model small
.stack 100 
.data
    str1 DB "Enter a word: $" 
    str2 DB 80 dup ('$')      
    str3 DB "The second character is $"    
    next DB 10,13,'$'
.code
main proc  
    
    mov ax,@data
    mov ds,ax
        
    mov ah,09h
    lea dx,str1
    int 21h
    
    lea si,str2
    
enter:
    mov ah,01h
    int 21h
    cmp al,13
    je cont
    mov [si],al
    inc si
    jmp enter
    
cont:
    mov ah,09h
    lea dx,next
    int 21h
    
    lea dx,str3
    int 21h
 
    lea si,str2 
    mov ah,02h
    mov dl,[si]+1
    int 21h
        
    mov ah,4ch
    int 21h
    
    main endp
end main
	
.model small
.stack 100 
.data
    str1      DB "Enter secret word          : $" 
    str2      DB "Enter encryption key (1-9) : $"      
    str3      DB "The encrypted word is $"    
    input1    DB 80 DUP ('$')
    encrypted DB ? 
    num       DB ?         
    next      DB 10,13,'$'
.code
main proc  
    
    mov ax,@data
    mov ds,ax
        
    mov ah,09h
    lea dx,str1
    int 21h
    
    lea si,input1
enter:
    mov ah,01h
    int 21h
    cmp al,13
    je cont
    mov [si],al
    inc si
    jmp enter
    
cont:
    mov ah,09h
    lea dx,next
    int 21h
    
    lea dx,str2
    int 21h  
    
    mov ah,01h
    int 21h
    sub al,30h
    mov num,al
    
    lea si,input1
    mov al,num

encrypt:
    cmp [si],'$'
    je exit    
    add [si],al  ;sub to decrypt
    inc si
    jmp encrypt
    
exit: 
    mov ah,09h
    lea dx,next
    int 21h
    
    lea dx,str3
    int 21h   
    
    lea dx,input1
    int 21h 
       
    mov ah,4ch
    int 21h
    
    main endp
end main	

org 0x7C00   
bits 16 

mov ax, 0  
mov ds, ax
mov es, ax
mov ss, ax     ; set stack segments to 0
mov sp, 0x7C00 ; stack actually grows down, not up
   
 boot: 
 	mov ah, 0x02
	mov al, 0x06 ; amount of sectors to load, disk setup stuff
	
	; this bit might not be necessary, but you shouldn't trust the bios
	
	mov dl, 0x00
	mov ch, 0
	mov dh, 0
	mov cl, 2
	
	mov bx, 0x1000 ; start loading at 0x1000
	int 0x13  ; tell the bios to do the things we asked
    

    jmp 0x1000 ; jump to the second part
 
times 510-($-$$) db 0 ; assembler magic to pad out
dw 0AA55h ; magic number

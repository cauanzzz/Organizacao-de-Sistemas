.MODEL SMALL
.STACK 100H
.DATA
 STR db 'digite uma string: $'
.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX
MOV CX,0
MOV AH,09
LEA DX,STR
INT 21H

MOV
ler:
mov ah,01 ;le um caractere e salva em al
int 21h
cmp al,13 ;compara o carcter com enter
je asteriscos
inc cx
jmp ler

asteriscos:
MOV ah,09
LEA DX,'*'
INT 21H
sub cx,1
cmp cx,0
je fim
jmp asteriscos

fim:
MOV AH,4Ch
INT 21h
MAIN ENDP
END MAIN
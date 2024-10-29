.MODEL SMALL
.STACK 100h
.DATA
MSG DB 'DIGITE UM NUMERO DECIMAL:$'
.CODE 
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV AH,09
LEA DX,MSG
INT 21h
lert:
mov ah,01
int 21h
cmp al,13
je sai
and ax,0fh
push ax
mov ax,10
mul bx
pop bx
add bx,ax
jmp lert

sai:
xor cx,cx
mov ax,bx
mov bx,8
transformacao:
inc cx
xor dx,dx
cmp ax,BX
jb proximo
div bx
push DX
jmp transformacao

proximo:
mov dx,ax
add dx,30h
mov ah,02
int 21H
xor dx,dx
pop ax
loop proximo
MOV AH,4CH
INT 21h
MAIN ENDP
END MAIN


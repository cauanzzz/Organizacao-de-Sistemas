
.MODEL SMALL
.STACK 100h
.DATA
vetor db 20 dup(?)
MSG1 DB 'DIGITE SEU NOME:$' 
MSG2 DB 10,13, 'AS INICIAIS SÃO: $'
INICAIS DB ?
.CODE
MAIN PROC

MOV AX,@DATA
MOV Ds,AX
xor bx,bx
lea bx,vetor
MOV AH,09 
LEA DX,MSG1
INT 21H
call leitura
seguindo:
mov ah,09
lea dx,msg2
int 21h
mov si,bx
xor ax,ax
call imp
MOV AH,4CH
INT 21H

main ENDP

leitura proc
    mov cx,20
proximo:
    MOV AH,01
    INT 21H
    mov vetor[bx],AL
    INC bx
    dec cx
ler:
    MOV AH,01
    INT 21H
    cmp al,13
    je seguindo
    cmp al,20h
    je proximo
    loop ler
    ret
  
leitura endp

imp proc
imprimir:
mov ah,09
lea dx,vetor[bx]
int 21h
dec bx
cmp bx,0
jnz imprimir
ret
imp endp
END MAIN
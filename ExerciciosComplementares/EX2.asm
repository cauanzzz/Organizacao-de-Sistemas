
.MODEL SMALL
.STACK 100h
.DATA
vetor db 5 dup(?)
MSG1 DB 'DIGITE SEU NOME:$'
MSG2 DB 10,13, 
INICAIS DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DL,AX
lea bx,vetor
MOV AH,09 
LEA DX,MSG1
INT 21H
call leitura

mov ah,2
xor bx,bx
mov cx,3
imp:
mov dl, vetor [bx]
int 21h
add bx,2
loop imp

main ENDP

letura proc


    mov cx,5
    MOV AH,01
ler:
    INT 21H
    mov vetor[bx],AL
    inc bx
    loop ler
    ret
leitura endp

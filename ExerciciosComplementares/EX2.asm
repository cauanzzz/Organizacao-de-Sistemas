;imprimi iniciais
.MODEL SMALL
.STACK 100h
.DATA
MSG1 DB 'DIGITE SEU NOME:$'
MSG2 DB 10,13, 'INICIAIS:'
INICAIS DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DL,AX
MOV AH,09 
LEA DX,MSG1
INT 21H
MOV AH,01
INT 21H
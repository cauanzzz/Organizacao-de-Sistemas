.MODEL SMALL
.STACK 100H
.DATA
letra DB 0,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV CX,52
    MOV BL,65

IMPRIMIR:
MOV letra,BL
MOV AH,09
LEA DX,letra
INT 21h
CMP BL,90
JE MINUSCULAS
ADD BL,1
LOOP IMPRIMIR
JMP FIM

MINUSCULAS:
ADD BL,7
DEC CX
JMP IMPRIMIR

FIM:
MOV AH,4CH
INT 21h
MAIN ENDP
END MAIN

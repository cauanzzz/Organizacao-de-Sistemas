.MODEL SMALL
STACK 100H
.DATA
LETRA DB 0, "$"
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV CX,26d
MOV BL,97
MOV BP,0

IMPRIMIR:
MOV LETRA,BL
MOV AH,9
LEA DX,LETRA
INT 21h

ADD BL,1
ADD BP,1
CMP BP,4
JE PULARLINHA

LOOP IMPRIMIR
JMP FIM

PULARLINHA:
MOV AH,02
MOV DL,10
INT 21h
MOV AH,02
MOV DL,13
INT 21h
MOV BP,0
DEC CX
JMP IMPRIMIR

FIM:
MOV AH,4CH
INT 21h
MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100h
.DATA
VETOR DB 1,1,1,1,1,1,1,1
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV CX,8
XOR SI,SI
XOR AL,AL
LOP:
ADD AL,VETOR[SI]
INC SI
LOOP LOP

FIM:
ADD AL,30H
MOV AH,02
MOV DL,AL
INT 21h
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100h
.DATA
 MSG DB 'DIGITE UM NOME:$'
 VETOR DB 20 DUP(?)
 MSG2 DB 10,13,'O NUMERO DE VOGAIS EH:$'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV CX,20
MOV AH,09
LEA DX,MSG
INT 21H
RECEBERCARACTER:
MOV AH,01
INT 21H
MOV VETOR[SI],AL
CMP VETOR[SI],'A'
JE VOGAL
CMP VETOR[SI],'E'
JE VOGAL
CMP VETOR[SI],'I'
JE VOGAL
CMP VETOR[SI],'O'
JE VOGAL
CMP VETOR[SI],'U'
JE VOGAL
CMP VETOR[SI],'a'
JE VOGAL
CMP VETOR[SI],'e'
JE VOGAL
CMP VETOR[SI],'i'
JE VOGAL
CMP VETOR[SI],'o'
JE VOGAL
CMP VETOR[SI],'u'
JE VOGAL
CMP VETOR[SI],10H
LOOP RECEBERCARACTER
JMP FIM

VOGAL:
INC BL
LOOP RECEBERCARACTER

FIM:
MOV AH,09
LEA DX,MSG2
INT 21H
XOR AX,AX
MOV AL,BL
ADD AL,30H
MOV AH,02
MOV DL,AL
INT 21H
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
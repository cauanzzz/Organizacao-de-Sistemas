MODEL SMALL
.DATA
STR1 DB "OSC 2S21$"
STR2 DB 8 DUP(?),"$"
TAM EQU 8
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS, AX
MOV ES, AX
MOV CX,8
LEA SI,STR1
LEA DI,STR2
CLD
LOOPA:
REP MOVSB
LOOP LOOPA
MOV AH,9
LEA DX,STR2
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN

;Neste exercicio lera um nome do teclado e indicara quantas vogais o mesmo possui
.MODEL SMALL
.STACK 100h
.DATA
 MSG1 DB 'DIGITE SEU NOME$'
MSG2 DB 10,13, 'O NUMERO DE VOGAIS eh:$'
VOGA DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV CX,0
MOV BL,0
MOV AH,09
LEA DX, MSG1
INT 21H

LERCARACTERES:
CMP CX,5
MOV AH,01
INT 21H
CMP AL, ' '      ; Verifica se é um espaço
JE ESPACO
CMP AL,'a'
JE VOGAL
CMP AL,'e'
JE VOGAL
CMP AL,'i'
JE VOGAL
CMP AL,'o'
JE VOGAL
CMP AL,'u'
JE VOGAL
CMP AL,'A'
JE VOGAL
CMP AL,'E'
JE VOGAL
CMP AL,'I'
JE VOGAL
CMP AL,'O'
JE VOGAL
CMP AL,'U'
JE VOGAL
CMP AL,13 
JE FIM
CMP CX,5
JE FIM
INC CX
jmp LERCARACTERES

ESPACO:
INC cx
CMP CX,5
JE FIM
jmp LERCARACTERES

VOGAL:
ADD BL,1
INC cx
CMP CX,5
JE FIM
jmp LERCARACTERES

FIM:
MOV AH,09
LEA DX,MSG2
INT 21H
MOV VOGA,BL
MOV AL,VOGA
ADD AL,'0'
MOV AH,02
MOV DL,AL
INT 21h
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
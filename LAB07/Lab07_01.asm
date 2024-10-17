.MODEL SMALL
.STACK 100h
.DATA
dendo db 'Digite o dividendo:$'
visor db 10,13, 'Digite o divisor:$'
res db 10,13, 'Resto:$',0
quo db 10,13, 'Quociente:$',0

dive db ?
divi db ?
resto db ?
quociente db ?

.CODE
MAIN PROC

;puxando valores de Data
MOV AX,@DATA
MOV DS,AX
XOR CX,CX

;imprimir
MOV AH,09 
LEA DX,dendo
INT 21H

;salvar
MOV AH,01
INT 21H
SUB AL,'0' 
MOV dive, AL

;imprimir
MOV AH,09 
LEA DX,visor
INT 21H

;salvar
MOV AH,01
INT 21H
SUB AL,'0'
MOV divi, AL

DIVISAO:
MOV BL,dive
MOV AL,divi

SUBTRAIR:
CMP BL, AL
JB fim_div
SUB BL,AL
INC CX
JAE SUBTRAIR

fim_div:
MOV AL, CL
MOV quociente, AL


MOV AH,09
LEA DX,quo
INT 21H

MOV AH,02
MOV DL,quociente
ADD DL,'0'
INT 21H

mov resto,bl

MOV AH,09
LEA DX,res
INT 21H

MOV AH,02
MOV DL,resto
ADD DL,'0'
INT 21H

MOV AH,4Ch
INT 21h
MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Digite um caractere$'
NUM DB 10,13, 'O caractere digitado e um numero$'
LETR DB 10,13, 'O caractere digitado e uma letra$'
NAO DB 10,13, 'O caractere digitado eh desconhecido$'
.CODE
MAIN PROC
;acessando os dados de data
MOV AX,@DATA
MOV DS,AX
;imprimir a primeira string
MOV AH,9
LEA DX,MSG1
INT 21H
;salvar o caractere em AL
MOV AH,1
INT 21H
;transferir o conteudo de AL para BL
MOV BL,AL
CMP BL,48 ;0
;pula se for menor para o desconhecido
JB DESCONHECIDO
CMP BL,58 ;9
JB NUMERO 
CMP BL,65 ;A
JB DESCONHECIDO
CMP BL,123 ;a
JB LETRA
JMP DESCONHECIDO

DESCONHECIDO:
MOV AH,09
LEA DX,NAO
INT 21H
JMP FIM

NUMERO:
MOV AH,09
LEA DX,NUM
INT 21H
JMP FIM

LETRA:
MOV AH,09
LEA DX, LETR
INT 21H
JMP FIM

FIM:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
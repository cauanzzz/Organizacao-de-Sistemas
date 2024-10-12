TITLE 
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'DIgite um caractere$'
SIM DB 10,13, 'O caractere digitado é um numero$'
NAO DB 10,13, 'O caractere digitado nao e um numero$'
.CODE
MAIN PROC
;permite o acesso as informações de data
MOV AX,@DATA
MOV DS,AX

;exibe na tela a MSG1
MOV AH,9
LEA DX,MSG1
INT 21H

;salva o caracter em AL
MOV AH,1
INT 21H

;salvo o conteudo de AL em BL
MOV BL,AL

;comparo o caracter em BL com o valor 48 (na tabela ASCII vale 0)
CMP BL,48

;jump pra nao eh numero 
JB NAOEHNUMERO 

;comparo o caracter em BL com o valor 57(na tabela ASCII vale 9)
CMP BL,57
JA NAOEHNUMERO

;se passou dos jumps exibe que é um numero
MOV AH,09
LEA DX,SIM
INT 21H
;salta pro fim
JMP FIM

NAOEHNUMERO:
MOV AH,09
LEA DX,NAO
INT 21H

FIM:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
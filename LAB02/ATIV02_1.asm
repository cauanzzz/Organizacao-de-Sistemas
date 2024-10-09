.MODEL SMALL
.STACK 100H
.DATA
msg db 'Digite um caracter em letra minuscula$'
msg2 db 'O caracter eh:$'
caracter db ?
.CODE
MAIN PROC

;obtendo dados salvos em .data:
MOV AX,@DATA
MOV DS, AX

;aparecer a string pedindo dados na tela:
MOV AH, 09
LEA DX, msg
INT 21H

;função que le 1 caracter
MOV AH, 01
INT 21H
MOV BL, AL

;comparar;
CMP AL,61H ;compara a letra "a" com o conteudo de AL, que é a outra letra
JB NAOMINUSCULA
CMP AL,7AH
JA NAOMINUSCULA

; converte o caractere para maiúscula
SUB BL, 32         ; subtrai 32 para converter minúscula para maiúscula

NAOMINUSCULA:
;imprimi a segunda mensagem
MOV AH, 09
LEA DX, msg2
INT 21H

;imprimi um caracter
MOV DL, BL         ; move o caractere para DL (parâmetro da função 02h)
MOV AH, 02H        ; função para imprimir um caractere
INT 21H            

MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN


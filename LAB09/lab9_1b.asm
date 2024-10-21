.MODEL SMALL
.DATA
VETOR DB 1, 1, 1, 2, 2, 2 ; inicializacao do vetor
.CODE
MAIN PROC
MOV AX, @DATA ; acesso as variveis
MOV DS,AX
XOR DL, DL ;zera dl
MOV CX,6 ; define cx como 6
XOR BX, BX; zera BX
CALL VETORIAL ;aciona o procedimento vetorial

MOV AH,4CH ;encerra o programa
INT 21H ;saida para o DOS
MAIN ENDP

VETORIAL PROC ;nomeia e define o procedimento

VOLTA:
MOV DL, VETOR[BX] ; coloca o valor que BX aponta em vetor em DL para a impressão
INC BX ;+1 em BL
ADD DL, 30H ; transforma o carcter em ASCII
MOV AH, 02; impressao do caracter
INT 21H
LOOP VOLTA
RET

VETORIAL ENDP
END MAIN

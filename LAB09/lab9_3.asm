.MODEL SMALL
.STACK 100h
.DATA
 VETOR DB 7 DUP(?) ;declaração do vetor de 7 espaços
 IMPR DB 10,13,  'DIGITE O VETOR:$'
.CODE
MAIN PROC
MOV AX,@DATA ;acesso as variaveis 
MOV DS,AX
MOV AH,09
LEA DX,IMPR ;impressão da mensagem
INT 21H
XOR SI,SI ;zera SI
LEA SI, VETOR 
CALL LERCARACTERES ;aciona o procedimento LERCARACTERES
XOR SI,SI ;zera SI
MOV DI,6 ;conteudo de DI é 6 
XOR BX,BX ;zera BX
CALL INVERTER ;aciona o procedimento INVERTER
XOR SI,SI ;zera novamente SI
LEA SI,VETOR
CALL PRINT ;aciona o procedimento PRINT
MOV AH,4CH
INT 21H
MAIN ENDP



LERCARACTERES PROC ;INICIA E NOMEIA O PROCEDIMENTO

OSSETE:
MOV AH,01 ;LE O CARACTER DIGITADO PELO USUARIO E O SALVA EM AL
INT 21H
MOV [SI],AL ;MOVE O CARACTER DIGITADO PARA A POSIÇÃO SI DO VETOR 9 
INC SI ;AUMENTA UM SI
CMP SI,7 ;COMPARA SI COM 7
JNE OSSETE ;REINICIA O LOOP OS SETE SE SI DIFERENTE DE 7

RET
LERCARACTERES ENDP ;ENCERRA O PROCEDIMENTO

INVERTER PROC ;INICIA E NOMEIA O PROCEDIMENTO

INVERTENDO: ;A LOGICA UTILIZADA FOI DE AUMENTAR DI E DIMINUIR SI, ALTERNANDO SEUS CONTEUDOS ATE QUE FICASSEM IGUAIS SIMBOLIZANDO O ULTIMO NUMERO A SE INVERTER
  MOV BL, [SI] ;MOVE O CONTEUDO DO VETOR[SI] 
  MOV AL,[DI] ;MOVE O CONTEUDO DO VETOR[DI]
  MOV [DI],BL ;MOVE O CONTEUDO DE BL PARA VETOR[DI]
  MOV [SI],AL ;MOVE O CONTEUDO DE BL PARA VETOR[SI]
  DEC DI ;DIMINUI DI, QUE PARTIU DO MAIOR PONTEIRO DO VETOR
  INC SI ;AUMENTA SI
  CMP DI,SI ;COMPARA AMBOS PARA VER SE CHEGAMOS EM VALOR IGUAL
  JNE INVERTENDO ;SE DIFERENTE CONTINUA O LOOP

  RET
INVERTER ENDP ;ENCERRA O PROCEDIMENTO

PRINT PROC ;INICIA E NOMEIA O PROCEDIMENTO

IMPRIMIR:
MOV AH,02
MOV DL, [SI] ;IMPRIMI O NUMERO ARMAZENADO NO VETOR NA POSIÇÃO SI
INT 21H
INC SI ;INCREMENTA SI
CMP SI,7 ;COMPARA SI 
JNE IMPRIMIR ;ENCERRA O LOOP SE SI=7
RET
PRINT ENDP ;ENCERRA O PROCEDIMENTO

END MAIN
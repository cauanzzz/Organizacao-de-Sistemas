.MODEL SMALL
.STACK 100H
.DATA
 msg db 'Digite um numero: $'   
 MSG2 DB 'A soma eh:$' 
 soma db 0, '$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV CX,5
NUMERO:
 MOV AH,09
 LEA DX,msg
 INT 21h
 MOV AH,01 ;SALVA EM AL
 INT 21H
; Converte o valor ASCII para o valor numérico
 SUB AL,'0'
 ADD SOMA, AL
 ;pular linha
 MOV AH, 2
 MOV DL, 10
 INT 21H
 LOOP NUMERO 
 
 MOV AH,09
 LEA DX,MSG2
 INT 21H
 ; Converte o número de volta para ASCII
 ADD SOMA, '0'
 MOV AH,09
 LEA DX, SOMA
 INT 21h
 MOV AH,4CH
 INT 21h

 MAIN ENDP
 END MAIN
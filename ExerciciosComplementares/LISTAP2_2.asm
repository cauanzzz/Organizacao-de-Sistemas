.MODEL SMALL
.STACK 100h
.DATA
 MATRIZ DB 1,20,30,40
        DB 50,2,70,80
        DB 90,100,3,120
        DB 130,140,150,3
SOMA DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
XOR SI,SI
XOR BX,BX

LOOPI:
MOV AL, MATRIZ[SI]
ADD BL,AL
ADD SI,5
INC CX
CMP CX,4
JE FIM
JNE LOOPI

FIM:
ADD BL,'0'
MOV SOMA,BL
MOV AH,02 
MOV DL,BL
INT 21H

MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
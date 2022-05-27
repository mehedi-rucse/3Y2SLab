;Write an assembly language program that will read two integer numbers 
;and the perform the following operations of the numbers:
;(i) Addition (ii) Subtraction (iii) Multiplication (iv) Division 


.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER NUMBERS[AB] :","$"
    MSG1 DB 10,13,"ADDITION :","$"
    MSG2 DB 10,13,"SUBTRACTION :","$"
    MSG3 DB 10,13,"MULTIPLICATION :","$" 
    MSG4 DB 10,13,"QUOTIENT :","$"
    MSG5 DB 10,13,"REMAINDER :","$"
    
    NUM1 DB 0
    NUM2 DB 0

 
    
.CODE 
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
              
    MOV AH,1
    INT 21H   
    SUB AL,48
    MOV NUM1,AL
    
    MOV AH,1
    INT 21H   
    SUB AL,48
    MOV NUM2,AL
    
    
    SUM:
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        
        MOV AL,NUM1
        ADD AL,NUM2 
        MOV BL,AL
        MOV AH,00
        MOV AL,BL 
        
        MOV BL,10
        
        DIV BL
        
        MOV BL,AH
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H
           
        
    SUBT:
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
        MOV AL,NUM1
        SUB AL,NUM2
        MOV BL,AL
        MOV AH,00
        MOV AL,BL 
        
        MOV BL,10
        
        DIV BL
        
        MOV BL,AH
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H
        
    MULP:
        LEA DX,MSG3
        MOV AH,9
        INT 21H
        
        MOV AH,00
        MOV AL,NUM1
        MUL NUM2
        
        MOV BL,10
        
        DIV BL
        
        MOV BL,AH
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H
        
    DIVI:
        LEA DX,MSG4
        MOV AH,9
        INT 21H
        
        MOV AH,00
        MOV AL,NUM1
        DIV NUM2 
        MOV BL,AH
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        LEA DX,MSG5
        MOV AH,9
        INT 21H
        
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H   
        
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
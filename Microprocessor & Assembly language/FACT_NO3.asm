;Write an assembly language program that will read an integer number N 
;and then calculate the
;summation value of the series 1 + 2 + 3 + - - - - - - - - + N.


.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER NUMBER :","$"
    MSG1 DB 10,13,"FACTORIAL :","$"
    NUM1 DB 0
    
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

    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,0
    MOV AL,1
    
    FACT:
        CMP NUM1,0
        JE BREAK
        MUL NUM1 
        DEC NUM1
        JMP FACT
    BREAK:    
        
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
        
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
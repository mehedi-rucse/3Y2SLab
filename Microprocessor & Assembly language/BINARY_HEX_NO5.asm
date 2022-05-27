;Write an assembly language program that will
;read an integer number N and then determine
;whether N is a prime number or not.

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER NUMBER :","$"
    MSG1 DB 10,13,"BINARY :","$"
    MSG2 DB 10,13,"HEX :","$"
    NUM1 DB 0
    AR DB 10 DUP (?)
    
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

    MOV BL,2 
    MOV SI,0 
    
    MOV AH,00
    MOV AL,NUM1
    
    
    BINARY:
        
        DIV BL
        MOV AR[SI],AH
        INC SI 
        MOV AH,00
        CMP AL,0
        JNZ BINARY


        MOV DI,0
        LEA DX,MSG1
        MOV AH,9
        INT 21H 
        DEC SI
       
        
    PRINT:    
        CMP SI,DI
        JL EXIT
        
        MOV DL,AR[SI]
        DEC SI
        ADD DL,48
        MOV AH,2
        INT 21H
        
        JMP PRINT
       
    EXIT:
    
        LEA DX,MSG2
        MOV AH,9
        INT 21H 
        MOV DL,NUM1
        ADD DL,48
        MOV AH,2
        INT 21H 
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
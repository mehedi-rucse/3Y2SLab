;Write an assembly language program that will
;read an integer number N and then determine
;whether N is a prime number or not.

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER NUMBER :","$"
    MSG1 DB 10,13,"PRIME","$"
    MSG2 DB 10,13,"NOT PRIME","$"
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

    MOV BL,2
    
    CHECK:
        CMP AL,BL
        JLE IS_PRIME
        
        MOV AH,00
        DIV BL
        
        CMP AH,0
        JE NOT_PRIME 
        
        MOV AL,NUM1
        INC BL
        JMP CHECK
                  
    IS_PRIME:
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        JMP EXIT
    NOT_PRIME:
        LEA DX,MSG2
        MOV AH,9
        INT 21H
       
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
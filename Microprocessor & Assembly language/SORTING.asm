;Write an assembly language program that will read an array of integer numbers
;and then sort the array elements in descending order. 


.MODEL SMALL
.STACK 100H 

.DATA
    NUM DB 20 DUP(?) 
    MSG1 DB "ENTER THE NUMBERS: ", "$"
    MSG2 DB 10,13,"SORTED NUMBERS: " ,"$"
    N DW ?

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H  
    
    MOV SI,OFFSET NUM
    MOV CX,0
    MOV BX,0

    SCAN:
        MOV AH,1
        INT 21H  
        
        CMP AL,13
        JZ BREAK 
        
        MOV NUM[SI],AL
        INC SI 
        INC CX
        JMP SCAN
    BREAK:
        CMP CX,0
        JZ DISPLAY
        MOV N,CX
    SORT:
        MOV CX,N
        MOV DI,00
        SUB CX,BX 
    COMPARE:
        MOV AL,NUM[DI]
        CMP AL,NUM[DI+1]
        JGE CONTINUE
        
        XCHG AL,NUM[DI+1]
        MOV NUM[DI],AL 
        
        CONTINUE:
            INC DI
            LOOP COMPARE
        INC BX
        CMP BX,N
        JNZ SORT 
        

        MOV AH,9
        LEA DX,MSG2
        INT 21H    
        MOV DI,0

        
    DISPLAY:
        CMP SI,DI
        JZ EXIT
        
        MOV DL,NUM[DI]
        MOV AH,2
        INT 21H
        INC DI
        JMP DISPLAY 
    
    EXIT: 
        MOV AH,4CH
        INT 21H 
    
    MAIN ENDP


END MAIN 
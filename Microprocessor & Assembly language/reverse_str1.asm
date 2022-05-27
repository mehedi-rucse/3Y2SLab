;Write an assembly language program 
;that will read a string and then make the string in its reverse
;form.  

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER STRING :","$"
    MSG1 DB 10,13,"REVERSED STRING :","$"
    AR DB 20 DUP (?) 
    
.CODE 
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
              
    MOV AH,1
    MOV SI,0
    
    SCAN: 
        INT 21H
        CMP AL,13
        JE BREAK
        MOV AR[SI],AL
        INC SI 
        JMP SCAN
    BREAK:   
    
        LEA DX,MSG1
        MOV AH,9
        INT 21H
       
        MOV AH,2
        DEC SI
        
    PRINT:
        CMP SI,0
        JL EXIT 
        MOV DL,AR[SI]
        INT 21H  
        DEC SI
        JMP PRINT
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
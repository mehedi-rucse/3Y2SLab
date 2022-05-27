;Write an assembly language program that will read a string and
; then convert the lowercase letters
;of the string into uppercase and vice-versa.
;The other non-alphabetic characters will remain beunchanged.  

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER STRING :","$"
    MSG1 DB 10,13,"CONVERTED STRING :","$"
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
        
        CMP AL,'A'
        JGE CHANGE 
        CMP AL,'Z'
        JLE CHANGE
        CMP AL,'a'
        JGE CHANGE 
        CMP AL,'z'
        JLE CHANGE 
        
        JMP CONTINUE
        
    CHANGE:
        XOR AL,20H 
        
    CONTINUE:
        MOV AR[SI],AL
        INC SI
        JMP SCAN 
        
    BREAK:   
        LEA DX,MSG1
        MOV AH,9
        INT 21H
       
        MOV AH,2 
        MOV DI,0
        
    PRINT:
        CMP DI,SI
        JE EXIT 
        MOV DL,AR[DI]
        INT 21H  
        INC DI
        JMP PRINT
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
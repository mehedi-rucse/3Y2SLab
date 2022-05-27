;Write an assembly language program that will read a string and
;then find out the alphabetic
;character in the string which will come first (having smallest ASCII value) 
;and which will come last (having largest ASCII value).
;Here the string contains either lowercase or uppercase
;alphabetic character but not both. 
  

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER STRING :","$"
    MSG1 DB 10,13,"SMALLEST :","$" 
    MSG2 DB 10,13,"LARGEST :","$"
    AR DB 20 DUP (?) 
    MIN DB 90
    MAX DB 65
    
.CODE 
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
              
    MOV AH,1
    
    SCAN: 
        MOV AH,1
        INT 21H
        CMP AL,13
        JE BREAK 
        
        CMP AL,'A'
        JL SKIP
        CMP AL,'Z'
        JG SKIP  
                             
    CHECK:
        CMP AL,MAX
        JGE LARGE
    CONTINUE:
        CMP AL,MIN
        JLE LESS
        JMP SKIP
        
    LARGE:
        MOV MAX,AL
        JMP CONTINUE
    LESS:
        MOV MIN,AL
        JMP SKIP 
    SKIP:
        JMP SCAN
        
    BREAK:   
        LEA DX,MSG1
        MOV AH,9
        INT 21H
       
        MOV AH,2
        MOV DL,MIN
        INT 21H
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
       
        MOV AH,2
        MOV DL,MAX
        INT 21H
      
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
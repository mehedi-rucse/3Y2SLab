;Write an assembly language program that will read a string 
;and then find out the longest sequence
;of alphabetic characters. Here the string contains 
;either lowercase or uppercase alphabetic character but not both.      

.MODEL SMALL
.STACK 100H 
          
.DATA
  MSG  DB  'ENTER THE STRING :','$'
  MSG1 DB  10,13,'lONGEST SEQUENCE IS  : ','$'
  X DB  255 DUP(?)
  MAX DW 0
  POSITION DW 0

 
.CODE
MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H 

    MOV SI,00 
    MOV CX,0
    MOV AH,1
        
    NEXT:
        INT 21H
        CMP AL,13
        JZ BREAK
        
        CMP AL,32
        JE RESET 
        
        CMP AL,'A'
        JL LAST
        CMP AL,'Z'
        JG LAST
        
        INC CX 
        CMP CX,MAX
        JG CHANGE
        JMP LAST
        
    RESET:
        MOV CX,0
        JMP LAST 
        
    CHANGE:
        MOV MAX,CX
        MOV POSITION,SI
        
        
    LAST:
        MOV X[SI],AL
        INC SI
        JMP NEXT
          
    BREAK: 
        MOV CX,MAX     
        MOV SI,POSITION
        SUB SI,CX
        INC SI
 
        LEA DX,MSG1
        MOV AH,09H
        INT 21H 
        
    PRINT:
 
        MOV DL,X[SI]
        MOV AH,2
        INT 21H
        INC SI
        LOOP PRINT
  
    
        
    EXIT:
      MOV AH, 4CH
      INT 21H
    
  MAIN ENDP  
END MAIN
;Write an assembly language program that will read a string and
;then find out the following items in the string:
;(i) Number of words (ii) Number of vowels 
;(iii) Number of constants (iv) Number of digits 
  

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB "ENTER STRING :","$"
    MSG1 DB 10,13,"WORDS :","$"
    MSG2 DB 10,13,"VOWELS :","$"
    MSG3 DB 10,13,"CONSONANTS :","$"
    MSG4 DB 10,13,"DIGITS :","$"
    AR DB 20 DUP (?) 
    
    WORD DB 1
    VOWEL DB 0
    CONSONANT DB 0
    DIGIT DB 0
    
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
        
        CMP AL,32
        JNE CHECK_DIGIT
        CMP BL,32
        JE LAST 
        
        INC WORD
        JMP LAST
        
    CHECK_DIGIT:
        CMP AL,'0'
        JL LAST
        CMP AL,'9'
        JG CHECK_ALPHABET
        
        INC DIGIT
        JMP LAST
    CHECK_ALPHABET:
        CMP AL,'A'
        JL LAST
        CMP AL,'z'
        JG LAST
        CMP AL,'a'
        JGE CHECK_VOWEL
        CMP AL,'Z'
        JLE CONVERT
        JMP LAST
    CONVERT:
        XOR AL,20H
    CHECK_VOWEL:
        CMP Al,'a'
        JE INC_VOWEL
        CMP Al,'e'
        JE INC_VOWEL
        CMP Al,'i'
        JE INC_VOWEL
        CMP Al,'o'
        JE INC_VOWEL
        CMP Al,'u'
        JE INC_VOWEL 
        JMP INC_CONSONANT
        
   INC_VOWEL:
        INC VOWEL
        JMP LAST
   INC_CONSONANT:
        INC CONSONANT
        
   LAST:   
        MOV BL,AL
        JMP SCAN
   BREAK:
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        
        MOV AH,2
        MOV DL,WORD 
        ADD DL,48
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        
        MOV AH,2
        MOV DL,VOWEL
        ADD DL,48
        INT 21H  
        
        MOV AH,9
        LEA DX,MSG3
        INT 21H
        
        MOV AH,2
        MOV DL,CONSONANT 
        ADD DL,48
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG4
        INT 21H
        
        MOV AH,2
        MOV DL,DIGIT
        ADD DL,48
        INT 21H
        
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
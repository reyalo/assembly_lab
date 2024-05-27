
.MODEL SMALL
.STACK 100H
.DATA
    
      OUTPUT DB 255 DUP("$")   
      
.CODE
     
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
        
        
        XOR CX,CX
        XOR BX,BX 
        MOV SI,OFFSET OUTPUT          
             
        MOV AH,1
   LOOP1: 
        ;taking input     
        INT 21H
        CMP AL,0DH      ;if new line
        JE END_LOOP1        
        CMP AL,20H      ;if space input
        JE  LOOP2
        INC CX
        PUSH AX 
        JMP LOOP1 
        
END_LOOP1: 
        MOV BX,1         ;flag for end input
        JMP LOOP2                  
    
    ;if any space found then loop2 reverse this word    
   LOOP2:  
            
        POP DX
        CMP DL,97
        JG  CAPITAL 
        MOV [SI],DL
        INC SI                 
        JMP END_LOOP2
  ;if input is small letter then cpital convert it capital           
 CAPITAL:  
        CMP DL,101     ;if input is "e"
        JE VOWEL 
        CMP DL,105      ;if input is "i"
        JE VOWEL  
        CMP DL,111       ;if input is "o"
        JE VOWEL 
        CMP DL,117        ;if input is "u"
        JE VOWEL 
        SUB DL, 32        ;converting to capital
        MOV [SI],DL
        INC SI
        JMP END_LOOP2
    ;if vowel found then it unchange                    
   VOWEL: 
        MOV [SI],DL
        INC SI                 
                         
                        
END_LOOP2: 
                 
        LOOP LOOP2 
        MOV [SI],32   ;after end of reversing word a space is taken
        INC SI 
        CMP BX,0      ;check if input end line
        JE LOOP1     
                        
        ;print the full string 
        ;SHOW NEW LINE
        MOV AH,02
        MOV DL,13
        INT 21H
        MOV DL,0AH
        INT 21H  
        
            
        MOV AH,09H
        LEA DX,OUTPUT
        INT 21H

        MOV AH,4CH
        INT 21H     
    
     MAIN ENDP
END MAIN               
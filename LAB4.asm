INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    
      STR DB 255 DUP("$")   
      
.CODE
     
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
        
        PRINT "ENTER A STRING : "
        
        XOR CX,CX
        XOR BX,BX 
        MOV SI,OFFSET STR          
             
           MOV AH,1
        LOOP1: 
             
              INT 21H
              CMP AL,0DH
              JE END_LOOP1        
              CMP AL,20H
              JE  LOOP2
              INC CX
              PUSH AX 
              JMP LOOP1 
        
        END_LOOP1: 
                 MOV BX,1
                 JMP LOOP2                  
         
         LOOP2:  
            
             POP DX
             CMP DL,97
             JG  SMALL_TO_CAPITAL 
             MOV [SI],DL
             INC SI                 
             JMP END_LOOP2
             
    SMALL_TO_CAPITAL:  
                     CMP DL,101
                     JE SMALL_TO_CAPITAL_2 
                     CMP DL,105
                     JE SMALL_TO_CAPITAL_2  
                     CMP DL,111
                     JE SMALL_TO_CAPITAL_2 
                     CMP DL,117
                     JE SMALL_TO_CAPITAL_2 
                     SUB DL, 32  
                     MOV [SI],DL
                     INC SI
                     JMP END_LOOP2
                        
        SMALL_TO_CAPITAL_2: 
                         MOV [SI],DL
                         INC SI                 
                         
                        
        END_LOOP2: 
                 
                 LOOP LOOP2 
                 MOV [SI],32
                 INC SI 
                 CMP BX,0 
                 JE LOOP1     
                        
        PRINTN            
        PRINT "OUTPUT : " 
                    
        MOV AH,09H
        LEA DX,STR
        INT 21H

        MOV AH,4CH
        INT 21H     
    
     MAIN ENDP
END MAIN               
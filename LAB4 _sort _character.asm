INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    
      STR DB 100 DUP("$")   
      
.CODE
     
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
                   
              PRINT "?"
      LOOP1:              
            MOV AH,1
            INT 21H
            
            ;IF ESC INPUT
            CMP AL,27
            JE END_LOOP1 
            
            ;IF NEW LINE INPUT
            CMP AL,0DH
            JE PRINT  
            
            
;-----------------START OF INSERTION SORTING----------------------  
     
         ;si take the 0 index of the array
            MOV SI,OFFSET STR
            
        ;sort: check and compare every value with input value and find correct insertion index  
       SORT:
            CMP [SI],AL
            JL SWAP1
            CMP [SI],36
            JE FUNC1
            INC SI
            JMP SORT
            
      ; func1 execute when input character shoutl be insert at the end of string        
      FUNC1:
            MOV [SI],AL
            JMP LOOP1
            
      ; swap1 execute when a value insert into middle point of array                     
      SWAP1:
            MOV BL,[SI]
            MOV [SI],AL
            MOV AL,BL
            INC SI
            CMP [SI],36
            JE FUNC1
            JMP SWAP1
            
            
;------------------END OF INSERTION SORTING-------------------------         
                                
      PRINT:
      
            ;print new line for show output
            MOV AH,02
            MOV DL,13
            INT 21H
            MOV DL,0AH
            INT 21H
             
                         
            ;print output            
            MOV AH,09H
            LEA DX,STR
            INT 21H 
            
            
            ;print new line for taking new input
            MOV AH,02
            MOV DL,13
            INT 21H
            MOV DL,0AH
            INT 21H
            PRINT "?" 
            JMP LOOP1
            
            
     END_LOOP1:
            MOV AH,4CH
            INT 21H     
    
     MAIN ENDP
END MAIN               
.MODEL SMALL
.STACK 100H
.DATA

   STR DB '1$'
.CODE
    MAIN PROC 
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,01
        INT 21H
        
        
         
        
        MOV BL,AL 
        SUB BL,17 
        
        
        MOV AH,02
        MOV DL,13
        INT 21H
        
        
        MOV DX,OFFSET STR
        MOV AH,09
        INT 21H
        
        
        MOV AH,02H
        MOV DL,BL
        INT 21H
        
        
    MAIN ENDP
    
 END MAIN
 
 
 RET




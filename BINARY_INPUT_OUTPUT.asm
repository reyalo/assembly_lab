.MODEL SMALL
.STACK 100H 
.DATA
    CNT DB 30H
.CODE 
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    ;TAKE FIRST NUMBR BX
    XOR BX,BX
    MOV AH,1
    INT 21H
    
WHILE_LOOP:

    CMP AL,0DH
    JE END_LOOP
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    INT 21H
    JMP WHILE_LOOP
END_LOOP:

    ;SHOW NEW LINE
    MOV AH,02
    MOV DL,13
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    
    ;TAKE SECOND NUMBER IN CX
    XOR CX,CX
    MOV AH,1
    INT 21H
    
WHILE_LOOP2:

    CMP AL,0DH
    JE END_LOOP2
    AND AL,0FH
    SHL CX,1
    OR CL,AL
    INT 21H
    JMP WHILE_LOOP2
END_LOOP2:
   
   
   
   ;SHOWING bINARY OUTPUT
   
   
   
   
    ADD BX,CX
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    ;set increment 0
    MOV CX,0
    OUTPUT:
          CMP CX,16
          JE FINISH
          INC CX
          ROL BX,1
          JC SHOW_1
       
       
          MOV AH,2
          MOV DL,30H
          INT 21H
          JMP OUTPUT
       
    SHOW_1:
        MOV AH,2
        MOV DL,31H
        INT 21H
        JMP OUTPUT
    
    FINISH:
    
    ;SHOWING bINARY OUTPUT IN REVERSE MODE
   
   
   
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;set increment index=0
    MOV CX,0
    
    OUTPUT2:
          CMP CX,16
          JE FINISH2
          INC CX
          ROR BX,1
          JC SHOW_2
       
       
          MOV AH,2
          MOV DL,30H
          INT 21H
          JMP OUTPUT2
       
    SHOW_2:
        INC CNT
        MOV AH,2
        MOV DL,31H
        INT 21H
        JMP OUTPUT2
    
    FINISH2:
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,CNT
    INT 21H  
    
    
    
      
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN
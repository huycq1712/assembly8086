.MODEL SMALL
.STACK 100H
.DATA
        MSG0 DB 'HAY NHAP MOT GIA TRI:$'
        ARR  DW 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
        DEM  DW 15
        X    DW 3
        ID_X DB -1

.CODE
MAIN    PROC
        ;KHOI TAO THANH DS
        MOV AX, @DATA
        MOV DS, AX
        ;GOI CHUONG TRINH CON
        CALL FINDFIRST
        
        
        MOV AH, 4CH
        INT 21H
MAIN    ENDP
FINDFIRST   PROC
            PUSH AX
            PUSH BX
            PUSH CX
            PUSH DX
            ; GAN BIEN DEM VAO THANH GHI CX
            MOV CX, DEM
            DEC CX
            ADD CX, CX
            MOV DX, X
            ; GAN VI TRI PHAN TU DAU CUA BIEN MANG VAO THANH GHI AX
            LEA SI, ARR
            XOR BX, BX
            ADD CX, SI
            ADD SI, BX 
CHUYEN:
            MOV AX, [SI]
            CMP AX, DX
            JE  TIMVITRI
            INC BX
            ADD SI, 2
            CMP SI, CX
            JA  RA
            JMP CHUYEN
TIMVITRI:
            LEA SI, ID_X
            INC BX
            MOV [SI], BX 
RA:
            POP DX
            POP CX
            POP BX
            POP AX
            RET
FINDFIRST   ENDP

END     MAIN
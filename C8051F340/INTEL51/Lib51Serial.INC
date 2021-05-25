

     .LIB51SERIALPROCEDURES ,,û

;-----------------------------------------------------------------------------
; Serial Memory
;-----------------------------------------------------------------------------

        DEFB Lib51Serial_TX_InProgress

Lib51Serial_FIFOIN_WR  EQU @.0+0  ;R0   MOVX @R0
Lib51Serial_FIFOOU_RD  EQU @.0+1  ;R1   MOVX @R1
Lib51Serial_FIFOIN_RD  EQU @.0+2  ;R2
Lib51Serial_FIFOOU_WR  EQU @.0+3  ;R3



SendByteBIN:
        PUSH R0

        MOV R0,#8
SEBIx1  RL A
        PUSH ACC
        ANL A,#1
        ORL A,#'0'
        CALL WriteByte
        POP ACC
        DJNZ R0,SEBIx1

        POP R0
        RET


SendByteHEX:
        CALL ByteToHex
        CALL WriteByte
        MOV A,B
        CALL WriteByte
        RET

ByteToHex:
        MOV B,A
        ANL A,#00001111B
        ADD A,#TBL_HEX+0-$-3
        MOVC A,@A+PC
        XCH A,B
        SWAP A
        ANL A,#00001111B
        ADD A,#TBL_HEX+0-$-3
        MOVC A,@A+PC
        RET



TBL_HEX DB '0123456789ABCDEF'


SendStringDPTR:
SESx2   CLR A
        MOVC A,@A+DPTR
        INC DPTR
        JZ SESx1
        CALL WriteByte
        JMP SESx2

SendStringPC:

        POP DPH
        POP DPL

        CALL SendStringDPTR

        PUSH DPL
        PUSH DPH
SESx1   RET


;----------------------------------------------

Lib51SerialInterrupt:
        PUSH ACC
        PUSH PSW
        MOV PSW,#@.0    ;MPSW_SERIAL
        PUSH EMI0CN

        JNB TI0,SEI0
        CLR TI0
        CLR Lib51Serial_TX_InProgress
        CLR C
        MOV A,R3 ;CALL Serial_FIFO_OUT_SIZE
        SUBB A,R1
        JZ SEI0
        MOV EMI0CN,#@.2 ;1
        MOVX A,@R1
        MOV SBUF0,A
        INC R1
        SETB Lib51Serial_TX_InProgress
SEI0    JNB RI0,SEI1
        MOV EMI0CN,#@.1 ;0
        CLR C
        MOV A,R0 ;CALL Serial_FIFO_IN_SIZE
        SUBB A,R2
        INC A
        JNZ SEI4
        DEC R0
SEI4    MOV A,SBUF0
        MOVX @R0,A
        INC R0
        CLR RI0
        JMP SEI0
SEI1

        POP EMI0CN
        POP PSW
        POP ACC
        RETI


;----------------------------------------------
;A=SIZE
ReadSize EQU Serial_FIFO_IN_SIZE

ReadByte:
        CALL Serial_FIFO_IN_SIZE
        JZ ReadByte

        PUSH DPTR
        MOV DPH,#@.1
        MOV DPL,Lib51Serial_FIFOIN_RD
        MOVX A,@DPTR
        INC Lib51Serial_FIFOIN_RD
        POP DPTR

        RET





WriteEN:PUSH ACC
        MOV A,#13
        CALL WriteByte
        MOV A,#10
        CALL WriteByte
        POP ACC
        RET


WriteWaitFlush:
         JB Lib51Serial_TX_InProgress,WriteWaitFlush
         RET


WriteByte:
        ;CALL WriteWaitFlush
        CALL Serial_FIFO_OUT_FREE_WAIT
        CLR ES0  ;CLR EA
        CALL Serial_FIFO_OUT_ADD
        JB Lib51Serial_TX_InProgress,WRIBYx1
        SETB TI0
        SETB Lib51Serial_TX_InProgress
WRIBYx1 SETB ES0  ;SETB EA
        RET

Serial_FIFO_OUT_FREE_WAIT:
        PUSH ACC
SFOFWx1 CALL Serial_FIFO_OUT_SIZE
        CJNE A,#250,SFOFWx2
SFOFWx2 JNC SFOFWx1
        POP ACC
        RET

;A=SIZE
Serial_FIFO_IN_SIZE:
        CLR C
        MOV A,Lib51Serial_FIFOIN_WR
        SUBB A,Lib51Serial_FIFOIN_RD
        RET

;A=SIZE
Serial_FIFO_OUT_SIZE:
        CLR C
        MOV A,Lib51Serial_FIFOOU_WR
        SUBB A,Lib51Serial_FIFOOU_RD
        RET

Serial_FIFO_OUT_ADD:
        PUSH DPTR
        MOV DPH,#@.2
        MOV DPL,Lib51Serial_FIFOOU_WR
        MOVX @DPTR,A
        INC Lib51Serial_FIFOOU_WR
        POP DPTR
        RET


;-----------------------------------------------------------------------------
; Serial Init
Lib51SerialInit:
;        PUSH PSW
;        MOV PSW,#@.0    ;MPSW_SERIAL

        CLR ES0        ;DISABLE SERIAL INTERRUPT
        CLR TI0
        CLR RI0

        CLR A
        MOV Lib51Serial_FIFOIN_WR,A
        MOV Lib51Serial_FIFOOU_WR,A
        MOV Lib51Serial_FIFOIN_RD,A
        MOV Lib51Serial_FIFOOU_RD,A

        CLR Lib51Serial_TX_InProgress

        SETB ES0        ;ENABLE SERIAL INTERRUPT

;        POP PSW
        RET

      ..

        .MAC_SendSeialString û
         CALL SendStringPC
         DB @.0
         DB 0
        ..




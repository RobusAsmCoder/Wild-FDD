


 ;@.0 = LATCH TIMER COUNTER+0
 ;@.1 = LATCH TIMER COUNTER+1
 ;@.2 = LATCH TIMER COUNTER+2
 ;@.3 = LATCH TIMER COUNTER+3
 ;@.4 = TIMER FRQUENCY

       .MAC_WAIT_TIMER_PROCEDURES ,,,,


WAIT_TMR_CONST_LO       EQU (@.4)/1000000
WAIT_TMR_CONST_HI       EQU (@.4)/256000

        DEFD WAITLATCH.D
WaitTimerLatch:
        CLR EA
        MOV WAITLATCH+0,@.0 ;PCA0L
        MOV WAITLATCH+1,@.1 ;PCA0H
        MOV WAITLATCH+2,@.2 ;PCACNT+0
        MOV WAITLATCH+3,@.3 ;PCACNT+1
        SETB EA
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IN:R0   = POINTER TO TEMP STORAGE 4 BYTES !!!
;    DPTR = DELAY max 65536 mcs
WaitMCS_Start:
        CALL WaitTimerLatch
;        MOV A,DPL
;        ADD A,#-2
;        MOV DPL,A
;        MOV A,DPH
;        ADDC A,#255
;        JC WAMCSx3
;        CLR A
;        MOV DPL,A
;WAMCSx3 MOV DPH,A
        MOV B,#WAIT_TMR_CONST_LO ;48       ;48mHz
        MULW DPL,B
        MOV B,A
        MOV A,WAITLATCH+0
        ADD A,DPL
        MOV @R0,A
        INC R0
        MOV A,WAITLATCH+1
        ADDC A,DPH
        MOV @R0,A
        INC R0
        MOV A,WAITLATCH+2
        ADDC A,B
        MOV @R0,A
        INC R0
        MOV A,WAITLATCH+3
        ADDC A,#0
WAMCSx1 MOV @R0,A
WAMCSx2 DEC R0
        DEC R0
        DEC R0
        RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IN:R0   = POINTER TO TEMP STORAGE 4 BYTES !!!
;    DPTR = DELAY max 65536 ms
WaitMS_Start:
        CALL WaitTimerLatch
        MOV B,#WAIT_TMR_CONST_HI ;188       ;48mHz = 48000/256 = 188
        MULW DPL,B
        MOV B,A
        MOV @R0,WAITLATCH+0
        INC R0
        MOV A,WAITLATCH+1
        ADD A,DPL
        MOV @R0,A
        INC R0
        MOV A,WAITLATCH+2
        ADDC A,DPH
        MOV @R0,A
        INC R0
        MOV A,WAITLATCH+3
        ADDC A,B
        JMP WAMCSx1


; IN:R0   = POINTER TO TEMP STORAGE 4 BYTES !!!
;OUT:CF   = 1-IF OVERFLOW
Wait_Check:
        CALL WaitTimerLatch
        SETB C
        MOV A,@R0
        SUBB A,WAITLATCH+0
        INC R0
        MOV A,@R0
        SUBB A,WAITLATCH+1
        INC R0
        MOV A,@R0
        SUBB A,WAITLATCH+2
        INC R0
        MOV A,@R0
        SUBB A,WAITLATCH+3
        MOV C,ACC.7
        JMP WAMCSx2

; IN:R0   = POINTER TO TEMP STORAGE 4 BYTES !!!
;OUT:CF   = 1-IF NOT ZERRO
Wait_isZerro:
        PUSH ACC
        MOV A,@R0
        INC R0
        ORL A,@R0
        INC R0
        ORL A,@R0
        INC R0
        ORL A,@R0
        CLR C
        JZ WAMCSx4
        SETB C
WAMCSx4 POP ACC
        JMP WAMCSx2
        
; IN:R0   = POINTER TO TEMP STORAGE 4 BYTES !!!
Wait_setZerro:
        PUSH ACC
        CLR A
        MOV @R0,A
        INC R0
        MOV @R0,A
        INC R0
        MOV @R0,A
        INC R0
        MOV @R0,A
        POP ACC
        JMP WAMCSx2


       ..



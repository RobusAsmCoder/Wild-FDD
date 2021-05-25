


        .ADD_EXEC_TABLE ,û
         ORG $EXEC_TABLE_LAST+@.0*4
         JMP @.1
         ORG @.
        ..

        .INIT_EXEC_TABLE û
@.0.EXEC:ANL A,#15                      ;T=13
         RL A
         RL A
         ADD A,#LOW(@.0.TBL)
         PUSH ACC
         MOV A,#HIGH(@.0.TBL)
         PUSH ACC
         RET
         ALIGN 64
         EQU $EXEC_TABLE_LAST=$
@.0.TBL  EQU $
         DS 64,022H
@.0.END  EQU $
        ..


        .ADD_EXEC_TABLE_NOJMP ,û
         ORG $EXEC_TABLE_NOJMP_LAST+@.0
         DB LOW(@.1)
         ORG $EXEC_TABLE_NOJMP_LAST+@.0+16
         DB HIGH(@.1)
         ORG @.
        ..

        .INIT_EXEC_TABLE_NOJMP ,û
         DEFD @.0.BYTE
@.0.EXEC:ANL A,#15                      ;T=16
         MOV @.0.BYTE,A
         ADD A,#LOW(@.0.TBL-@.0.PCO1)
         MOVC A,@A+PC
@.0.PCO1 PUSH ACC
         MOV A,@.0.BYTE
         ADD A,#LOW(@.0.TBL-@.0.PCO2+16)
         MOVC A,@A+PC
@.0.PCO2 PUSH ACC
         RET
         EQU $EXEC_TABLE_NOJMP_LAST=$
@.0.TBL  EQU $
         DS 16,LOW(@.1)
         DS 16,HIGH(@.1)
@.0.END  EQU $
        ..


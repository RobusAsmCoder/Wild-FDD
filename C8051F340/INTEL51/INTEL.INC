
        EQU CSEG$=00000H
        EQU DSEG$=00030H
        EQU DSEGB$=00030H
        EQU BSEG$=20000H
        EQU MSEG$=0000H


        .DEFM .B
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+1
        ..

        .DEFM .W
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+2
        ..

        .DEFM .T
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+3
        ..

        .DEFM .D
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+4
        ..

        .DEFM .Q
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+8
        ..

        .DEFM 
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+1
        ..

        .DEFMS ,û
@.0      EQU MSEG$
         EQU MSEG$=MSEG$+@.1
        ..






        .DEFD .B
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+1
        ..

        .DEFD .W
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+2
        ..

        .DEFD .T
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+3
        ..

        .DEFD .D
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+4
        ..

        .DEFD .Q
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+8
        ..

        .DEFD 
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+1
        ..

        .DEFDS ,û
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+@.1
        ..












        .DEFDB .B
         EQU DSEGB$=DSEGB$-1
@.0      DATA DSEGB$
        ..

        .DEFDB .W
         EQU DSEGB$=DSEGB$-2
@.0      DATA DSEGB$
        ..

        .DEFDB .T
         EQU DSEGB$=DSEGB$-3
@.0      DATA DSEGB$
        ..

        .DEFDB .D
         EQU DSEGB$=DSEGB$-4
@.0      DATA DSEGB$
        ..

        .DEFDB .Q
         EQU DSEGB$=DSEGB$-8
@.0      DATA DSEGB$
        ..

        .DEFDB 
         EQU DSEGB$=DSEGB$-1
@.0      DATA DSEGB$
        ..









        .DEFB 
@.0      EQU BSEG$
         EQU BSEG$=BSEG$+1
        ..





        .CSEG
         PAGE 0
         ORG 0
        ..

        .DSEG
         PAGE 63
         ORG 30H
        ..

        .BSEG
         PAGE 63
         ORG 20000H
        ..



        .PUSH Rû
         XCH A,R@.0
         PUSH ACC
         XCH A,R@.0
        ..

        .POP Rû
         XCH A,R@.0
         POP ACC
         XCH A,R@.0
        ..


        .PUSH DPTR
         PUSH DPL
         PUSH DPH
        ..

        .POP DPTR
         POP DPH
         POP DPL
        ..

        .SUB ,û
         CLR C
         XCH A,@.0+0
         SUBB A,@.1+0
         XCH A,@.0+0
         XCH A,@.0+1
         SUBB A,@.1+1
         XCH A,@.0+1
        ..



        EQU PSEG$=0000H

        .DEFDP .B
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+1
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+1
        ..
        .DEFDP .W
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+2
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+2
        ..
        .DEFDP .D
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+4
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+4
        ..
        .DEFDP 
@.0      EQU DSEG$
         EQU DSEG$=DSEG$+1
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+1
        ..

        .DEFP .B
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+1
        ..
        .DEFP .W
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+2
        ..
        .DEFP .D
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+4
        ..
        .DEFP .Q
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+8
        ..
        .DEFP 
@.0.P    EQU PSEG$
         EQU PSEG$=PSEG$+1
        ..





        .RR A,û
         PUSH @.0
         INC @.0
         RL A
@M2      RR A
         DJNZ @.0,@M2
@M1      POP @.0
        ..

        .RL A,û
         PUSH @.0
         INC @.0
         RR A
@M2      RL A
         DJNZ @.0,@M2
@M1      POP @.0
        ..


        .RL û
         MOV A,@.0
         RL A
         MOV @.0,A
        ..

        .RR û
         MOV A,@.0
         RR A
         MOV @.0,A
        ..

        .RLC û
         MOV A,@.0
         RLC A
         MOV @.0,A
        ..

        .RRC û
         MOV A,@.0
         RRC A
         MOV @.0,A
        ..












        .MOVX DPTR,@DPTR
         PUSH ACC
         MOVX A,@DPTR
         PUSH ACC
         INC DPTR
         MOVX A,@DPTR
         MOV DPH,A
         POP DPL
         POP ACC
        ..

        .MOVX DPTR,@
         PUSH ACC
         MOV DPTR,#@.0
         MOVX A,@DPTR
         PUSH ACC
         INC DPTR
         MOVX A,@DPTR
         MOV DPH,A
         POP DPL
         POP ACC
        ..

        .MOVX @,DPTR
         PUSH ACC
         MOV A,DPL
         PUSH DPH
         MOV DPTR,#@.0
         MOVX @DPTR,A
         INC DPTR
         POP ACC
         MOVX @DPTR,A
         POP ACC
        ..

        .MOVXA DPTR,@DPTR
         MOVX A,@DPTR
         PUSH ACC
         INC DPTR
         MOVX A,@DPTR
         MOV DPH,A
         POP DPL
        ..

        .MOVXA DPTR,@
         MOV DPTR,#@.0
         MOVX A,@DPTR
         PUSH ACC
         INC DPTR
         MOVX A,@DPTR
         MOV DPH,A
         POP DPL
        ..

        .MOVXA @,DPTR
         MOV A,DPL
         PUSH DPH
         MOV DPTR,#@.0
         MOVX @DPTR,A
         INC DPTR
         POP ACC
         MOVX @DPTR,A
        ..

        .MOVX R01,@DPTR
         XCH A,R1
         MOVX A,@DPTR
         INC DPTR
         MOV R0,A
         MOVX A,@DPTR
         INC DPTR
         XCH A,R1
        ..

        .MOVX @DPTR,R01
         XCH A,R0
         MOVX @DPTR,A
         INC DPTR
         MOV A,R1
         MOVX @DPTR,A
         INC DPTR
         XCH A,R0
        ..

















        .WriteFlash
         ANL CCH0CN,#11111110B
         ORL FLSCL,#00000001B
         ORL PSCTL,#00000001B
         MOVX @DPTR,A
         ANL PSCTL,#11111110B
         ANL FLSCL,#11111110B
        ..

        .EraseFlash
         ORL FLSCL,#00000001B
         ORL PSCTL,#00000011B
         MOVX @DPTR,A
         ANL PSCTL,#11111100B
         ANL FLSCL,#11111110B
        ..


;
;Step 1. Disable interrupts.
;Step 2. Clear CHBLKW (CCH0CN.0) to select single-byte write mode.
;Step 3. If writing to bytes in Bank 1, Bank 2, or Bank 3, set the COBANK bits (PSBANK.5-4) for the
;appropriate bank.
;Step 4. If writing to bytes in the Scratchpad area, set the SFLE bit (PSCTL.2).
;Step 5. Set FLWE (FLSCL.0) to enable FLASH writes/erases via user software.
;Step 6. Set PSWE (PSCTL.0) to redirect MOVX commands to write to FLASH.
;Step 7. Use the MOVX instruction to write a data byte to the desired location (repeat as necessary).
;Step 8. Clear the PSWE bit to redirect MOVX commands to the XRAM data space.
;Step 9. Clear the FLWE bit, to disable FLASH writes/erases.
;Step 10. If writing to bytes in the Scratchpad area, clear the SFLE bit.
;Step 11. Re-enable interrupts.
;











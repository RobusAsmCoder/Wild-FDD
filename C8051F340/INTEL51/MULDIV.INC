

    ; dividend in:           R6,R7
    ; divisor in:            R5
    ; uses:                  R0, R1, R3
    ; quotient returned in:  R6,R7
    ; remainder returned in: R4,R5


       .MACPROC_DIV R6R7_R5
;@fast_int_divide:                       ;
                                        ;
        MOV     A,R5                    ;
        JZ      @tiny_divisor_end       ;if divide by zero: terminate.
                                        ;
        MOV     A,PSW                   ;Get the base address of
        ANL     A,#018H                 ; the current register bank.
        ORL     A,#006H                 ;Point to register R6.
        MOV     R0,A                    ;R0 is a pointer to R6.
                                        ;
        MOV     R1,#02                  ;load loop counter.
                                        ;
        MOV     R4,#00                  ;Clear the running remainder.
                                        ;
@fast_int_divide_loop:                  ;
                                        ;
        MOV     A,@R0                   ;Get the MS nibble of the dividend
        SWAP    A                       ; into the accumulator.
        ANL     A,#00FH                 ;
        ORL     A,R4                    ;
                                        ;
        MOV     B,R5                    ;Divide MS nibble by the divisor.
        DIV     AB                      ;
                                        ;
        SWAP    A                       ;Save partial result (which must be in
        MOV     R3,A                    ; the range 0...15) shifted 4 bits.
                                        ;
        MOV     A,B                     ;Save remainder (which must be in
        SWAP    A                       ; the range 0...15) shifted 4 bits left.
        MOV     R4,A                    ;
                                        ;
        MOV     A,@R0                   ;Get next nibble of the dividend
        ANL     A,#00FH                 ; into the accumulator.
        ORL     A,R4                    ;Or in the remainder from previous
                                        ; partial division.
        MOV     B,R5                    ;Divide by the divisor.
        DIV     AB                      ;
                                        ;
        ORL     A,R3                    ;Or in the previously saved partial result.
        MOV     @R0,A                   ;Save the MSB of the quotient in R6/R7
                                        ; ready to be returned.
        MOV     A,B                     ;Save remainder shifted 4 bits left.
        SWAP    A                       ;
        MOV     R4,A                    ;
                                        ;
        INC     R0                      ;

        DJNZ    R1,@fast_int_divide_loop

        CLR     A                       ;Put remainder in R4/R5
        XCH     A,R4                    ;
        MOV     R5,A                    ;
                                        ;
@tiny_divisor_end:                      ;
                                        ;
        RET                             ;
       ..











       .MULW @R,B
        MOV A,B
        XCH A,@R@.0
        MUL AB
        XCH A,@R@.0
        XCH A,B
        INC R@.0
        XCH A,@R@.0
        MUL AB
        ADD A,@R@.0
        MOV @R@.0,A
        CLR A
        ADDC A,B
        INC R@.0
        MOV @R@.0,A
        DEC R@.0
        DEC R@.0
        DEC R@.0
       ..

       .MULW ,B
        MOV A,B
        XCH A,@.0+0
        MUL AB
        XCH A,@.0+0
        XCH A,B
        XCH A,@.0+1
        MUL AB
        ADD A,@.0+1
        MOV @.0+1,A
        CLR A
        ADDC A,B
       ..


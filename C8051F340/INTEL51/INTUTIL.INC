


        .ADD_ACC_DWORD û
         ADD A,@.0+0
         MOV @.0+0,A
         CLR A
;         CLR A ;???
         ADDC A,@.0+1
         MOV @.0+1,A
         CLR A
         ADDC A,@.0+2
         MOV @.0+2,A
         CLR A
         ADDC A,@.0+3
         MOV @.0+3,A
        ..




        .ADD_D_W ,û
         MOV A,@.1+0
         ADD A,@.0+0
         MOV @.0+0,A
         MOV A,@.1+1
         ADDC A,@.0+1
         MOV @.0+1,A
         CLR A
         ADDC A,@.0+2
         MOV @.0+2,A
         CLR A
         ADDC A,@.0+3
         MOV @.0+3,A
        ..

        .MOVDACC û
         MOV @.0+0,A
         MOV @.0+1,A
         MOV @.0+2,A
         MOV @.0+3,A
        ..
;
;       Compiler By Rob F.
;
;          CMD Ins : Intel 89C51
;             File : c51.cmd
;         Used EXT : *.ac5
;    Used Compiler : asam.exe v.001.026J
;
;                        3210987654321
; CFG:00000000000000000000100000001110
;                        ³³³³³³³³³³³³ÀÂÄ 0:INT Mode OFF
;                        ³³³³³³³³³³³³ ÀÄ 1:INT Mode ON
;                        ³³³³³³³³³³³³
;                        ³³³³³³³³³³³ÀÄÂÄ 0:NOP
;                        ³³³³³³³³³³³  ÀÄ 1:Change 'DFG' > "DFG"
;                        ³³³³³³³³³³³
;                        ³³³³³³³³³³ÀÄÄÂÄ 0:NOP
;                        ³³³³³³³³³³   ÀÄ 1:Low() & High() Converting
;                        ³³³³³³³³³³
;                        ³³³³³³³³³ÀÄÄÄÂÄ 0:EQU Disabled MACRO-LABLES
;                        ³³³³³³³³³    ÀÄ 1:EQU Work For ALL LABELS
;                        ³³³³³³³³³
;                        ³³³³³³³³ÀÄÄÄÄÂÄ 0:NORMAL HEX FORMAT
;                        ³³³³³³³³     ÃÄ 1:HEX FORMAT FROM ZX-GENS (#ABC0 = 0ABC0H)
;                        ³³³³³³³³     ÀÄ $:HEX FORMAT PASCAL
;                        ³³³³³³³³
;                        ³³³³³³³ÀÄÄÄÄÄÂÄ 0:ONE COMMAND IN LINE
;                        ³³³³³³³      ÀÄ 1:MANY COMMAND "LD HL,16384:LDIR:POP HL"
;                        ³³³³³³³
;                        ³³³³³³ÀÄÄÄÄÄÄÂÄ 0:DUBLICATE WITH SYMBOL "."
;                        ³³³³³³       ÀÄ 1:DUBLICATE WITH SYMBOL "." AND WORD "DUP"
;                        ³³³³³³
;                        ³³³³³ÀÄÄÄÄÄÄÄÂÄ 0:NORMAL CMD MODE
;                        ³³³³³        ÀÄ 1:SYMBOL "XXX"-XXX (ONLY COMMAND)
;                        ³³³³³
;                        ³³³³ÀÄÄÄÄÄÄÄÄÂÄ 0:???
;                        ³³³³         ÀÄ 1:??? MACRO NAME TYPE ???
;                        ³³³³
;                        ³³³ÀÄÄÄÄÄÄÄÄÄÂÄ 0:NOP
;                        ³³³          ÀÄ 1:DELETE DUBLICATE FOR ""
;                        ³³³
;                        ³³ÀÄÄÄÄÄÄÄÄÄÄÂÄ 0:TXT LABEL "%$ZX.R.HL%"
;                        ³³           ÀÄ 1:NOP
;                        ³³
;                        ³ÀÄÄÄÄÄÄÄÄÄÄÄÂÄ 0:PEEK x,x,0 = NOP
;                        ³            ÀÄ 1:PEEK x,x,0 = 1xBYTE - FIXED ERROR !!!
;                        ³
;                        ÀÄÄÄÄÄÄÄÄÄÄÄÄÂÄ 0:Include Path From First File
;                                     ÀÄ 1:Include Path From Current File
;
;
;

MOVEMEMAA nn,mm,s,ss
>51H:nn.mm.s.ss

.MOVEMEMAA ,:,û
 MoveMemAA @.0,@.1,@.2,@.3
..

.MOVEMEMAA ,,û
 MoveMemAA @.0,@.1,256,@.2
..

EMLZX.LOADTRD ,n
>50H:0.n

EMLZX.KEY 
>4FH:0

.EMLZX.KEYCLR
 EmlZX.Key "###"
..

.EMLZX.KEYADD û
 EmlZX.Key @.0
..

MOVEMEMZA nn,n,mm,m
>48H:nn.n.mm.m

.MOVEMEMZA :,,û
 MoveMemZA @.0,@.1,@.2,@.3
..

MOVEMEMAZ nn,n,mm,m
>49H:nn.n.mm.m

.MOVEMEMAZ ,:,û
 MoveMemAZ @.0,@.1,@.2,@.3
..

PEEKZ ,n,mm,m
>4CH:0.n.mm.m

.PEEKZB =(:)û
 PeekZ @.0,@.1,@.2,0
..

.PEEKZW =(:)û
 PeekZ @.0,@.1,@.2,1
..

PEEKA ,n,mm
>4DH:0.n.mm

.PEEKAB =()û
 PeekA @.0,@.1,0
..

.PEEKAW =()û
 PeekA @.0,@.1,1
..

POKEZ nn,n,mm,m
>4AH:nn.n.mm.m

.POKEZB (:)=û
 PokeZ @.0,@.1,@.2,0
..

.POKEZW (:)=û
 PokeZ @.0,@.1,@.2,1
..

POKEA nn,n,mm
>4BH:nn.n.mm

.POKEAB ()=û
 PokeA @.0,@.1,0
..

.POKEAW ()=û
 PokeA @.0,@.1,1
..

RUNEMULZX nn
>4EH:nn

.RUNEMULZX
 RunEmulZX 0
..

.RUNEMULZXNE
 RunEmulZX 1
..


EXECFILE ,nn
>57H:0.nn

OPENLISTFILE ,nn
>56H:0.nn

SETCFGBIT 
>55H:0

INLOCAL ,nn
>54H:0.nn

.LOCALMODULE
 InLocal @.0,46
..

.ENDLOCALMODULE
 InLocal "...",0
..

ASAM.MATH ,nn
>53H:0.nn

IFDBS ,
>42H:0.1

ORGOF nn,mm
>05H:nn 05H:mm 40H:nn.mm

ORG nn
>05H:nn 20H:nn

ORG nn,mm
>05H:nn 17H:nn.nn.mm 20H:nn

.ORG :
 ORG @.0
 PAGE @.1
..

PAGE nn
>09:nn 27H:nn

INTMODE.ON
>07H:A.1 29H:A

INTMODE.OFF
>07H:A.0 29H:A

INCLUDE 
>3FH:0

INCBIN 
>2FH:0

SAVEBIN ,nn,mm
>31H:0.nn.mm

INCBIN ,
>2EH:0.1

INCTRD ,
>2EH:0.1

INCZX$ 
>2DH:0

EQUSIZE 
>18H:A.0 25H:A

EQUSIZEZX$ 
>1AH:A.0 25H:A

EQUSTARTZX$ 
>1CH:A.0 25H:A

EQUSIZETRD ,
>19H:A.0.1 25H:A

EQUSTARTTRD ,
>1BH:A.0.1 25H:A

EQULASTSIZE
>1DH:A 25H:A

EQULASTSTART
>1EH:A 25H:A

LOADTRD ,
>0FH:B 1BH:A.0.1 20H:A 2EH:0.1 20H:B 1FH

LOADZX$ 
>0FH:B 1CH:A.0.1 20H:A 2DH:0 20H:B 1FH

LOAD ,nn
>0FH:B 20H:nn 2FH:0 20H:B 1FH

SAVETRD ,,nn,mm
>37H:0.1.nn.mm

DB "
>21H

DW "
>22H

DD "
>23H

DS nn
>07H:A.0 24H:nn.A 05H:nn

DS nn,mm
>24H:nn.mm 05H:nn

DBIT nn
>05H:nn 0FH:C 17H:nn.C.nn 20H:nn 2AH:nn

EQU nn
>25H:nn

EQU (nn)
>25H:nn

EQU ,nn
>41H:0.nn

.EQU =()
 EQU @.0,@.1
..

.EQU =
 EQU @.0,@.1
..

DATA n
>28H:n

BIT n
>2AH:n

BITB n
>26H:n

SETTEXTXOR "
>32H

RESETTEXTXOR
>2CH:A

LOADTEXTXOR 
>2CH:0

LOADCMD 
>3EH:0

SAVELABELS 
>34H:0

SAVEALLMEM ,
>35H:0.1

SAVEHEX 
>07H:A.0 07H:B.65536 07H:C.16 39H:0.A.B.C

SAVEHEX ,nn,mm
>07H:C.16 39H:0.nn.mm.C

SAVEHEX ,nn,mm,ss
>39H:0.nn.mm.ss

ALIGN nn
>05H:nn 0FH:C 17H:nn.C.nn 0AH:B.nn 0CH:A.B.C 07H:D.0 24H:A.D

ORGALI nn
>05H:nn 0FH:C 17H:nn.C.nn 20H:nn

CALL nn
>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
 00:00010001B 5:nn.3.8 8:nn.8
 T:2

CALL nn
 00:00010010B 8:nn.8.8 16:nn.8.0
 T:2

JMP s
>06H:s 08H:s
 00:10000000B 8:s
 T:2

JMP nn
>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
 00:00000001B 5:nn.3.8 8:nn.8
 T:2

JMP nn
 00:00000010B 8:nn.8.8 16:nn.8.0
 T:2

ACALL nn
>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
 00:00010001B 5:nn.3.8 8:nn.8
 T:2

ADD A,R0
 00:00101000B
 T:1

ADD A,R1
 00:00101001B
 T:1

ADD A,R2
 00:00101010B
 T:1

ADD A,R3
 00:00101011B
 T:1

ADD A,R4
 00:00101100B
 T:1

ADD A,R5
 00:00101101B
 T:1

ADD A,R6
 00:00101110B
 T:1

ADD A,R7
 00:00101111B
 T:1

ADD A,n
 00:00100101B 8:n
 T:1

ADD A,@R0
 00:00100110B
 T:1

ADD A,@R1
 00:00100111B
 T:1

ADD A,#n
 00:00100100B 8:n
 T:1

ADDC A,R0
 00:00111000B
 T:1

ADDC A,R1
 00:00111001B
 T:1

ADDC A,R2
 00:00111010B
 T:1

ADDC A,R3
 00:00111011B
 T:1

ADDC A,R4
 00:00111100B
 T:1

ADDC A,R5
 00:00111101B
 T:1

ADDC A,R6
 00:00111110B
 T:1

ADDC A,R7
 00:00111111B
 T:1

ADDC A,n
 00:00110101B 8:n
 T:1

ADDC A,@R0
 00:00110110B
 T:1

ADDC A,@R1
 00:00110111B
 T:1

ADDC A,#n
 00:00110100B 8:n
 T:1

AJMP nn
>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
 00:00000001B 5:nn.3.8 8:nn.8
 T:2

ANL A,R0
 00:01011000B
 T:1

ANL A,R1
 00:01011001B
 T:1

ANL A,R2
 00:01011010B
 T:1

ANL A,R3
 00:01011011B
 T:1

ANL A,R4
 00:01011100B
 T:1

ANL A,R5
 00:01011101B
 T:1

ANL A,R6
 00:01011110B
 T:1

ANL A,R7
 00:01011111B
 T:1

ANL A,n
 00:01010101B 8:n
 T:1

ANL A,@R0
 00:01010110B
 T:1

ANL A,@R1
 00:01010111B
 T:1

ANL A,#n
 00:01010100B 8:n
 T:1

ANL n,A
 00:01010010B 8:n
 T:1

ANL n,#m
 00:01010011B 8:n 16:m
 T:2

ANL C,s
>14H:s.s
 00:10000010B 8:s
 T:2

ANL C,/s
>14H:s.s
 00:10110000B 8:s
 T:2

CJNE A,n,s
>06H:s 08H:s
 00:10110101B 8:n 16:s
 T:2

CJNE A,#n,s
>06H:s 08H:s
 00:10110100B 8:n 16:s
 T:2

CJNE R0,#n,s
>06H:s 08H:s
 00:10111000B 8:n 16:s
 T:2

CJNE R1,#n,s
>06H:s 08H:s
 00:10111001B 8:n 16:s
 T:2

CJNE R2,#n,s
>06H:s 08H:s
 00:10111010B 8:n 16:s
 T:2

CJNE R3,#n,s
>06H:s 08H:s
 00:10111011B 8:n 16:s
 T:2

CJNE R4,#n,s
>06H:s 08H:s
 00:10111100B 8:n 16:s
 T:2

CJNE R5,#n,s
>06H:s 08H:s
 00:10111101B 8:n 16:s
 T:2

CJNE R6,#n,s
>06H:s 08H:s
 00:10111110B 8:n 16:s
 T:2

CJNE R7,#n,s
>06H:s 08H:s
 00:10111111B 8:n 16:s
 T:2

CJNE @R0,#n,s
>06H:s 08H:s
 00:10110110B 8:n 16:s
 T:2

CJNE @R1,#n,s
>06H:s 08H:s
 00:10110111B 8:n 16:s
 T:2

CLR A
 00:11100100B
 T:1

CLR C
 00:11000011B
 T:1

CLR s
>14H:s.s
 00:11000010B 8:s
 T:1

CPL A
 00:11110100B
 T:1

CPL C
 00:10110011B
 T:1

CPL s
>14H:s.s
 00:10110010B 8:s
 T:1

DA A
 00:11010100B
 T:1

DEC A
 00:00010100B
 T:1

DEC R0
 00:00011000B
 T:1

DEC R1
 00:00011001B
 T:1

DEC R2
 00:00011010B
 T:1

DEC R3
 00:00011011B
 T:1

DEC R4
 00:00011100B
 T:1

DEC R5
 00:00011101B
 T:1

DEC R6
 00:00011110B
 T:1

DEC R7
 00:00011111B
 T:1

DEC n
 00:00010101B 8:n
 T:1

DEC @R0
 00:00010110B
 T:1

DEC @R1
 00:00010111B
 T:1

DIV AB
 00:10000100B
 T:1

DJNZ R0,s
>06H:s 08H:s
 00:11011000B 8:s
 T:2

DJNZ R1,s
>06H:s 08H:s
 00:11011001B 8:s
 T:2

DJNZ R2,s
>06H:s 08H:s
 00:11011010B 8:s
 T:2

DJNZ R3,s
>06H:s 08H:s
 00:11011011B 8:s
 T:2

DJNZ R4,s
>06H:s 08H:s
 00:11011100B 8:s
 T:2

DJNZ R5,s
>06H:s 08H:s
 00:11011101B 8:s
 T:2

DJNZ R6,s
>06H:s 08H:s
 00:11011110B 8:s
 T:2

DJNZ R7,s
>06H:s 08H:s
 00:11011111B 8:s
 T:2

DJNZ n,s
>06H:s 08H:s
 00:11010101B 8:n 16:s
 T:2

INC A
 00:00000100B
 T:1

INC R0
 00:00001000B
 T:1

INC R1
 00:00001001B
 T:1

INC R2
 00:00001010B
 T:1

INC R3
 00:00001011B
 T:1

INC R4
 00:00001100B
 T:1

INC R5
 00:00001101B
 T:1

INC R6
 00:00001110B
 T:1

INC R7
 00:00001111B
 T:1

INC n
 00:00000101B 8:n
 T:1

INC @R0
 00:00000110B
 T:1

INC @R1
 00:00000111B
 T:1

INC DPTR
 00:10100011B
 T:2

JB n,s
>06H:s 08H:s 14H:n.n
 00:00100000B 8:n 16:s
 T:2

JBC n,s
>06H:s 08H:s 14H:n.n
 00:00010000B 8:n 16:s
 T:2

JC s
>06H:s 08H:s
 00:01000000B 8:s
 T:2

JMP @A+DPTR
 00:01110011B
 T:2

JNB n,s
>06H:s 08H:s 14H:n.n
 00:00110000B 8:n 16:s
 T:2

JNC s
>06H:s 08H:s
 00:01010000B 8:s
 T:2

JNZ s
>06H:s 08H:s
 00:01110000B 8:s
 T:2

JZ s
>06H:s 08H:s
 00:01100000B 8:s
 T:2

;JC nn
;>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
; 00:00250H 16:00000001B 21:nn.3.8 24:nn.8
; T:2

;JC nn
; 00:00350H 16:00000010B 24:nn.8.8 32:nn.8.0
; T:2

;JNC nn
;>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
; 00:00240H 16:00000001B 21:nn.3.8 24:nn.8
; T:2

;JNC nn
; 00:00340H 16:00000010B 24:nn.8.8 32:nn.8.0
; T:2

;JZ nn
;>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
; 00:00270H 16:00000001B 21:nn.3.8 24:nn.8
; T:2

;JZ nn
; 00:00370H 16:00000010B 24:nn.8.8 32:nn.8.0
; T:2

;JNZ nn
;>0FH:A 07H:B.2 0BH:A.A.B 16H:nn.A
; 00:00260H 16:00000001B 21:nn.3.8 24:nn.8
; T:2

;JNZ nn
; 00:00360H 16:00000010B 24:nn.8.8 32:nn.8.0
; T:2

LCALL nn
 00:00010010B 8:nn.8.8 16:nn.8.0
 T:2

LJMP nn
 00:00000010B 8:nn.8.8 16:nn.8.0
 T:2

MOV A,R0
 00:11101000B
 T:1

MOV A,R1
 00:11101001B
 T:1

MOV A,R2
 00:11101010B
 T:1

MOV A,R3
 00:11101011B
 T:1

MOV A,R4
 00:11101100B
 T:1

MOV A,R5
 00:11101101B
 T:1

MOV A,R6
 00:11101110B
 T:1

MOV A,R7
 00:11101111B
 T:1

MOV A,n
 00:11100101B 8:n
 T:1

MOV A,@R0
 00:11100110B
 T:1

MOV A,@R1
 00:11100111B
 T:1

MOV A,#n
 00:01110100B 8:n
 T:1

MOV R0,A
 00:11111000B
 T:1

MOV R1,A
 00:11111001B
 T:1

MOV R2,A
 00:11111010B
 T:1

MOV R3,A
 00:11111011B
 T:1

MOV R4,A
 00:11111100B
 T:1

MOV R5,A
 00:11111101B
 T:1

MOV R6,A
 00:11111110B
 T:1

MOV R7,A
 00:11111111B
 T:1

MOV R0,n
 00:10101000B 8:n
 T:2

MOV R1,n
 00:10101001B 8:n
 T:2

MOV R2,n
 00:10101010B 8:n
 T:2

MOV R3,n
 00:10101011B 8:n
 T:2

MOV R4,n
 00:10101100B 8:n
 T:2

MOV R5,n
 00:10101101B 8:n
 T:2

MOV R6,n
 00:10101110B 8:n
 T:2

MOV R7,n
 00:10101111B 8:n
 T:2

MOV R0,#n
 00:01111000B 8:n
 T:1

MOV R1,#n
 00:01111001B 8:n
 T:1

MOV R2,#n
 00:01111010B 8:n
 T:1

MOV R3,#n
 00:01111011B 8:n
 T:1

MOV R4,#n
 00:01111100B 8:n
 T:1

MOV R5,#n
 00:01111101B 8:n
 T:1

MOV R6,#n
 00:01111110B 8:n
 T:1

MOV R7,#n
 00:01111111B 8:n
 T:1

MOV n,A
 00:11110101B 8:n
 T:1

MOV n,R0
 00:10001000B 8:n
 T:2

MOV n,R1
 00:10001001B 8:n
 T:2

MOV n,R2
 00:10001010B 8:n
 T:2

MOV n,R3
 00:10001011B 8:n
 T:2

MOV n,R4
 00:10001100B 8:n
 T:2

MOV n,R5
 00:10001101B 8:n
 T:2

MOV n,R6
 00:10001110B 8:n
 T:2

MOV n,R7
 00:10001111B 8:n
 T:2

MOV n,m
 00:10000101B 8:m 16:n
 T:2

MOV n,@R0
 00:10000110B 8:n
 T:2

MOV n,@R1
 00:10000111B 8:n
 T:2

MOV n,#m
 00:01110101B 8:n 16:m
 T:2

MOV @R0,A
 00:11110110B
 T:1

MOV @R1,A
 00:11110111B
 T:1

MOV @R0,n
 00:10100110B 8:n
 T:2

MOV @R1,n
 00:10100111B 8:n
 T:2

MOV @R0,#n
 00:01110110B 8:n
 T:1

MOV @R1,#n
 00:01110111B 8:n
 T:1

MOV C,n
>14H:n.n
 00:10100010B 8:n
 T:1

MOV n,C
>14H:n.n
 00:10010010B 8:n
 T:2

MOV DPTR,#nn
 00:10010000B 8:nn.8.8 16:nn.8
 T:2

MOVC A,@A+DPTR
 00:10010011B
 T:2

MOVC A,A+DPTR
 00:10010011B
 T:2

MOVC A,@A+PC
 00:10000011B
 T:2

MOVX A,@R0
 00:11100010B
 T:2

MOVX A,@R1
 00:11100011B
 T:2

MOVX A,@DPTR
 00:11100000B
 T:2

MOVX @R0,A
 00:11110010B
 T:2

MOVX @R1,A
 00:11110011B
 T:2

MOVX @DPTR,A
 00:11110000B
 T:2

MUL AB
 00:10100100B
 T:4

NOP
 00:00000000B
 T:1

ORL A,R0
 00:01001000B
 T:1

ORL A,R1
 00:01001001B
 T:1

ORL A,R2
 00:01001010B
 T:1

ORL A,R3
 00:01001011B
 T:1

ORL A,R4
 00:01001100B
 T:1

ORL A,R5
 00:01001101B
 T:1

ORL A,R6
 00:01001110B
 T:1

ORL A,R7
 00:01001111B
 T:1

ORL A,n
 00:01000101B 8:n
 T:1

ORL A,@R0
 00:01000110B
 T:1

ORL A,@R1
 00:01000111B
 T:1

ORL A,#n
 00:01000100B 8:n
 T:1

ORL n,A
 00:01000010B 8:n
 T:1

ORL n,#m
 00:01000011B 8:n 16:m
 T:2

ORL C,s
>14H:s.s
 00:01110010B 8:s
 T:2

ORL C,/s
>14H:s.s
 00:10100000B 8:s
 T:2

POP n
 00:11010000B 8:n
 T:2

PUSH n
 00:11000000B 8:n
 T:2

RET
 00:00100010B
 T:2

RETI
 00:00110010B
 T:2

RET C
 00:220150H
 T:2

RET NC
 00:220140H
 T:2

RET Z
 00:220170H
 T:2

RET NZ
 00:220160H
 T:2

RL A
 00:00100011B
 T:1

RLC A
 00:00110011B
 T:1

RR A
 00:00000011B
 T:1

RRC A
 00:00010011B
 T:1

SETB C
 00:11010011B
 T:1

SETB s
>14H:s.s
 00:11010010B 8:s
 T:1

SJMP s
>06H:s 08H:s
 00:10000000B 8:s
 T:2

SUBB A,R0
 00:10011000B
 T:1

SUBB A,R1
 00:10011001B
 T:1

SUBB A,R2
 00:10011010B
 T:1

SUBB A,R3
 00:10011011B
 T:1

SUBB A,R4
 00:10011100B
 T:1

SUBB A,R5
 00:10011101B
 T:1

SUBB A,R6
 00:10011110B
 T:1

SUBB A,R7
 00:10011111B
 T:1

SUBB A,n
 00:10010101B 8:n
 T:1

SUBB A,@R0
 00:10010110B
 T:1

SUBB A,@R1
 00:10010111B
 T:1

SUBB A,#n
 00:10010100B 8:n
 T:1

SWAP A
 00:11000100B
 T:1

XCH A,R0
 00:11001000B
 T:1

XCH A,R1
 00:11001001B
 T:1

XCH A,R2
 00:11001010B
 T:1

XCH A,R3
 00:11001011B
 T:1

XCH A,R4
 00:11001100B
 T:1

XCH A,R5
 00:11001101B
 T:1

XCH A,R6
 00:11001110B
 T:1

XCH A,R7
 00:11001111B
 T:1

XCH A,n
 00:11000101B 8:n
 T:1

XCH A,@R0
 00:11000110B
 T:1

XCH A,@R1
 00:11000111B
 T:1

XCHD A,@R0
 00:11010110B
 T:1

XCHD A,@R1
 00:11010111B
 T:1

XRL A,R0
 00:01101000B
 T:1

XRL A,R1
 00:01101001B
 T:1

XRL A,R2
 00:01101010B
 T:1

XRL A,R3
 00:01101011B
 T:1

XRL A,R4
 00:01101100B
 T:1

XRL A,R5
 00:01101101B
 T:1

XRL A,R6
 00:01101110B
 T:1

XRL A,R7
 00:01101111B
 T:1

XRL A,n
 00:01100101B 8:n
 T:1

XRL A,@R0
 00:01100110B
 T:1

XRL A,@R1
 00:01100111B
 T:1

XRL A,#n
 00:01100100B 8:n
 T:1








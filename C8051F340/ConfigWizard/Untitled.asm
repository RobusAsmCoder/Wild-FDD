;------------------------------------
;-  Generated Initialization File  --
;------------------------------------

$include (C8051F340.inc)

public  Init_Device

INIT SEGMENT CODE
    rseg INIT

; Peripheral specific initialization functions,
; Called from the Init_Device label
PCA_Init:
    mov  PCA0CN,    #040h
    anl  PCA0MD,    #0BFh
    mov  PCA0MD,    #001h
    mov  PCA0CPM0,  #011h
    mov  PCA0CPM4,  #001h
    mov  PCA0H,     #001h
    mov  PCA0CPH0,  #001h
    mov  PCA0CPH4,  #0C8h
    ret

Timer_Init:
    mov  TCON,      #045h
    mov  TMOD,      #020h
    mov  CKCON,     #008h
    mov  TH1,       #0E6h
    ret

UART_Init:
    mov  SCON0,     #010h
    ret

SPI_Init:
    mov  SPI0CFG,   #040h
    mov  SPI0CN,    #001h
    mov  SPI0CKR,   #002h
    ret

EMI_Init:
    mov  EMI0CF,    #004h
    mov  EMI0TC,    #000h
    ret

Port_IO_Init:
    ; P0.0  -  Skipped,     Open-Drain, Digital
    ; P0.1  -  Skipped,     Open-Drain, Digital
    ; P0.2  -  Skipped,     Push-Pull,  Digital
    ; P0.3  -  Skipped,     Push-Pull,  Digital
    ; P0.4  -  TX0 (UART0), Push-Pull,  Digital
    ; P0.5  -  RX0 (UART0), Push-Pull,  Digital
    ; P0.6  -  Skipped,     Push-Pull,  Digital
    ; P0.7  -  Skipped,     Push-Pull,  Digital

    ; P1.0  -  Skipped,     Open-Drain, Digital
    ; P1.1  -  Skipped,     Open-Drain, Digital
    ; P1.2  -  Skipped,     Open-Drain, Digital
    ; P1.3  -  Skipped,     Push-Pull,  Digital
    ; P1.4  -  Skipped,     Open-Drain, Digital
    ; P1.5  -  Skipped,     Open-Drain, Digital
    ; P1.6  -  Skipped,     Push-Pull,  Digital
    ; P1.7  -  Skipped,     Push-Pull,  Digital

    ; P2.0  -  SCK  (SPI0), Push-Pull,  Digital
    ; P2.1  -  MISO (SPI0), Open-Drain, Digital
    ; P2.2  -  Skipped,     Open-Drain, Digital
    ; P2.3  -  Skipped,     Open-Drain, Digital
    ; P2.4  -  MOSI (SPI0), Push-Pull,  Digital
    ; P2.5  -  Skipped,     Open-Drain, Digital
    ; P2.6  -  CEX0  (PCA), Open-Drain, Digital
    ; P2.7  -  Skipped,     Open-Drain, Digital

    ; P3.0  -  Skipped,     Push-Pull,  Digital
    ; P3.1  -  Skipped,     Open-Drain, Digital
    ; P3.2  -  Skipped,     Push-Pull,  Digital
    ; P3.3  -  Skipped,     Push-Pull,  Digital
    ; P3.4  -  Skipped,     Open-Drain, Digital
    ; P3.5  -  Skipped,     Open-Drain, Digital
    ; P3.6  -  Skipped,     Open-Drain, Digital
    ; P3.7  -  Skipped,     Open-Drain, Digital

    mov  P0MDOUT,   #0FCh
    mov  P1MDOUT,   #0C8h
    mov  P2MDOUT,   #011h
    mov  P3MDOUT,   #00Dh
    mov  P4MDOUT,   #0FFh
    mov  P0SKIP,    #0CFh
    mov  P1SKIP,    #0FFh
    mov  P2SKIP,    #0ACh
    mov  P3SKIP,    #0FFh
    mov  XBR0,      #003h
    mov  XBR1,      #0C1h
    ret

Oscillator_Init:
    orl  OSCLCN,    #083h
    mov  FLSCL,     #090h
    mov  CLKMUL,    #080h
    clr  A                     ; Wait 5us for initialization
    djnz ACC,       $
    orl  CLKMUL,    #0C0h
Osc_Mul_Wait:
    mov  A,         CLKMUL
    jnb  ACC.5,     Osc_Mul_Wait
    mov  CLKSEL,    #003h
    mov  OSCICN,    #083h
    ret

Interrupts_Init:
    mov  IP,        #040h
    mov  EIE1,      #010h
    mov  EIP1,      #010h
    mov  IE,        #005h
    ret

; Initialization function for device,
; Call Init_Device from your main program
Init_Device:
    lcall PCA_Init
    lcall Timer_Init
    lcall UART_Init
    lcall SPI_Init
    lcall EMI_Init
    lcall Port_IO_Init
    lcall Oscillator_Init
    lcall Interrupts_Init
    ret

end

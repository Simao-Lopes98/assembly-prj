; main.s

; define registers
#define __SFR_OFFSET 0x00
#include "avr/io.h"

; global function prototypes
.global start
.global led
.global ledVal


start:
    SBI DDRB, 4         ;set pin (PB5) D12 as output
    RET                 ;return

led:
    CPI R24, 0x00       ;compare the value passed with 0x00
    BREQ ledOff         ;jump if equal to routine ledOff
    SBI PORTB, 4        ;set pin (PB5) D12 to HIGH

    IN R16, PORTB       ;get PORTB register value
    STS ledVal, R16
    RET

ledOff:
    CBI PORTB, 4        ;clear pin (PB5) D12 to LOW
    
    IN R16, PORTB       ;get PORTB register value
    STS ledVal, R16
    RET
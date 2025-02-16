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

 ;
 ; @brief Turns the LED On.
 ;
 ; @param R24 The value to determine LED state 
 ; (0 = OFF, any other value = ON).
 ;  
 ; Sets the 4th bit of PORTB register, thus setting the pin
 ; to HIGH.
 ; Reads the value of PORTB into R16, then sets the value of R16
 ; to the global var ledVal.
 ;

led:
    CPI R24, 0x00       ;compare the value passed with 0x00
    BREQ ledOff         ;jump if equal to routine ledOff
    SBI PORTB, 4        ;set pin (PB5) D12 to HIGH

    IN R16, PORTB       ;get PORTB register value
    STS ledVal, R16     ;store direct to ledVal value in R16
    RET

 ; 
 ; @brief Turns the LED Off.
 ;
 ; Clears the 4th bit of PORTB register, thus setting the pin
 ; to LOW.
 ; Reads the value of PORTB into R16, then sets the value of R16
 ; to the global var ledVal.
 ;

ledOff:
    CBI PORTB, 4        ;clear pin (PB5) D12 to LOW
    
    IN R16, PORTB       ;get PORTB register value
    STS ledVal, R16     ;store direct to ledVal value in R16
    RET
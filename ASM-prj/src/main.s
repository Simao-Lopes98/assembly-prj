; main.s

; define registers
#define __SFR_OFFSET 0x00
#include "avr/io.h"

; global function prototypes
.global ledInit
.global btnInit
.global intrInit
.global ledState

.local shiftDone
.local ledOff

; Setup led GPIO
ledInit:
    LDI R16, 1          ; Number o bits to shift
    MOV R17, R24        ; Load input parameter GPIO number (i.e. bit position)
    RJMP LSL_LOOP
LSL_LOOP:
    CPI R17, 0      ; Check if shifthing is needed
    BREQ shiftDone  ; Jump to shiftDone if previous comparision is TRUE
    LSL R16
    DEC R17
    RJMP LSL_LOOP
shiftDone:
    IN R18, DDRB        ; Load DDRB IO register
    OR R18, R16         ; Perform bitwise-OR to avoid losing bits
    OUT DDRB, R18
    RET

ledState:
    CPI R24, 0          ;compare the value passed with 0x00
    BREQ ledOff         ;jump if equal to routine ledOff
    SBI PORTB, 4        ;set pin (PB5) D12 to HIGH
    RET

ledOff:
    CBI PORTB, 4        ;clear pin (PB5) D12 to LOW
    RET
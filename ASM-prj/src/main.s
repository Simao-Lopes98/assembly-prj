; main.s

; define registers
#define __SFR_OFFSET 0x00
#include "avr/io.h"

.global gpioStart
.global serialStart


gpioStart:
    ; Setup GPIO
    IN R16, DDRB
    ORI R16, (0b00000010)   ;Bitwise-OR with DDRB
    OUT DDRB, R16           ;Set DDRB to R16
    ; Setup USART
    RET

serialStart:
    ; USART setup
    LDI R16, 0x67       ; (16MHz/(16 x 9600) -1)
    LDI R17, 0x00
    STS UBRR0L, R16     ; Set UBRR0L (Low Byte)
    STS UBRR0H, R17     ; Set UBRR0H (High Byte)

    ; Enable RX and TX
    LDI R16, (1 << RXEN0)
    ORI R16, (1 << TXEN0)
    STS UCSR0B, R16
    ; Set frame format: 8data, 2stop bit
    ORI R16, (1 << USBS0)
    ORI R16, (3 << UCSZ00)
    STS UCSR0C, R16
    RET
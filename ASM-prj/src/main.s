; main.s

; define registers
.equ DDRB, 0x24
.equ PORTB, 0x25

; global function prototypes
.global start
.global led

start:
    LDI R16, (1 << 4)   ; Load bit mask for PB4 (D12) into R16
    IN R17, DDRB        ; Read current DDRB state
    OR R17, R16         ; Set bit 4 (PB4) as output
    OUT DDRB, R17       ; Write back to DDRB
    RET                 ; Return to setup()

led:
    CPI R24, 0x00       ; Compare R24 with 0
    BREQ ledOFF         ; Branch to ledOFF if R24 == 0
    IN R17, PORTB       ; Read current PORTB state
    ORI R17, (1 << 4)   ; Set bit 4 (PB4) to HIGH
    OUT PORTB, R17      ; Write back to PORTB
    RET                 ; Return to loop()

ledOFF:
    IN R17, PORTB       ; Read current PORTB state
    ANDI R17, ~(1 << 4) ; Clear bit 4 (PB4) to LOW
    OUT PORTB, R17      ; Write back to PORTB
    RET                 ; Return to loop()
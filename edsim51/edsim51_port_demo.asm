; ================================================================
; EdSim51 Port Demo
; This version is simplified for quick 8051 simulation learning.
; It toggles P2 outputs in sequence so you can observe the appliance lines.
; P2.0 Light, P2.1 Fan, P2.2 Gate, P2.3 Doorbell, P2.4 Alarm, P2.5 Security
; ================================================================

ORG 0000H

MAIN:
    MOV P2, #00H
    ACALL DELAY

    SETB P2.0       ; Light ON
    ACALL DELAY

    SETB P2.1       ; Fan ON
    ACALL DELAY

    SETB P2.2       ; Gate OPEN
    ACALL DELAY

    SETB P2.3       ; Doorbell RING
    ACALL DELAY

    SETB P2.4       ; Alarm ON
    ACALL DELAY

    SETB P2.5       ; Security ON
    ACALL DELAY

    MOV P2, #00H    ; All OFF
    ACALL DELAY

    SJMP MAIN

DELAY:
    MOV R0, #0FFH
D1:
    MOV R1, #0FFH
D2:
    DJNZ R1, D2
    DJNZ R0, D1
    RET

END

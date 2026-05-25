; ================================================================
; Bluetooth Home Automation Using 8051 Microcontroller
; Reconstructed firmware for Keil A51 / Proteus simulation
; Author: FONO PEVETMI JORDAN LOIC
;
; Function:
;   Receives single-character commands over UART/Bluetooth and controls
;   relay outputs through Port 2. LCD messages are represented by subroutine
;   placeholders so the program can be expanded for a full 16x2 LCD interface.
;
; Hardware assumptions:
;   MCU: AT89C51 / AT89S51
;   Crystal: 11.0592 MHz
;   UART baud rate: 9600
;   Bluetooth/Virtual Terminal: connected to RXD/TXD
;   Relay driver: ULN2003A connected to P2.0 - P2.5
;
; Command map:
;   '1' Light ON       -> P2.0 = 1
;   '2' Light OFF      -> P2.0 = 0
;   '3' Fan ON         -> P2.1 = 1
;   '4' Fan OFF        -> P2.1 = 0
;   '5' Gate OPEN      -> P2.2 = pulse/ON
;   '6' Doorbell RING  -> P2.3 = pulse/ON
;   '7' Alarm ON       -> P2.4 = 1
;   '8' Security ON    -> P2.5 = 1
;   '0' All OFF        -> P2 = 00H
; ================================================================

                ORG 0000H
                LJMP START

; ------------------------------------------------
; SFR aliases
; ------------------------------------------------
P0              EQU 080H
P1              EQU 090H
P2              EQU 0A0H
P3              EQU 0B0H
SP              EQU 081H
TMOD            EQU 089H
TCON            EQU 088H
TH1             EQU 08DH
TL1             EQU 08BH
SCON            EQU 098H
SBUF            EQU 099H

RI_BIT          EQU 098H
TI_BIT          EQU 099H
TR1_BIT         EQU 08EH

; ------------------------------------------------
; Reset entry
; ------------------------------------------------
START:
                MOV SP, #70H
                MOV P2, #00H          ; all appliances OFF
                ACALL UART_INIT
                ACALL LCD_INIT
                ACALL LCD_PRINT_READY

MAIN:
                JNB RI_BIT, MAIN      ; wait until serial byte is received
                CLR RI_BIT
                MOV A, SBUF

                CJNE A, #'1', CHECK_2
                SETB P2.0
                ACALL LCD_PRINT_LIGHT_ON
                SJMP MAIN

CHECK_2:
                CJNE A, #'2', CHECK_3
                CLR P2.0
                ACALL LCD_PRINT_LIGHT_OFF
                SJMP MAIN

CHECK_3:
                CJNE A, #'3', CHECK_4
                SETB P2.1
                ACALL LCD_PRINT_FAN_ON
                SJMP MAIN

CHECK_4:
                CJNE A, #'4', CHECK_5
                CLR P2.1
                ACALL LCD_PRINT_FAN_OFF
                SJMP MAIN

CHECK_5:
                CJNE A, #'5', CHECK_6
                SETB P2.2
                ACALL LCD_PRINT_GATE
                SJMP MAIN

CHECK_6:
                CJNE A, #'6', CHECK_7
                SETB P2.3
                ACALL LCD_PRINT_DOORBELL
                SJMP MAIN

CHECK_7:
                CJNE A, #'7', CHECK_8
                SETB P2.4
                ACALL LCD_PRINT_ALARM
                SJMP MAIN

CHECK_8:
                CJNE A, #'8', CHECK_0
                SETB P2.5
                ACALL LCD_PRINT_SECURITY
                SJMP MAIN

CHECK_0:
                CJNE A, #'0', MAIN
                MOV P2, #00H
                ACALL LCD_PRINT_ALL_OFF
                SJMP MAIN

; ------------------------------------------------
; UART setup for 9600 baud with 11.0592 MHz crystal
; ------------------------------------------------
UART_INIT:
                MOV TMOD, #20H        ; Timer1 Mode2 auto reload
                MOV TH1, #0FDH        ; 9600 baud
                MOV TL1, #0FDH
                MOV SCON, #50H        ; 8-bit UART, REN enabled
                SETB TR1_BIT
                RET

; ------------------------------------------------
; LCD placeholder routines
; Replace with full LCD driver if using LM016L in 8-bit mode
; ------------------------------------------------
LCD_INIT:
                RET

LCD_PRINT_READY:
                ; Expected LCD text: HOME AUTOMATION READY
                RET

LCD_PRINT_LIGHT_ON:
                ; Expected LCD text: LIGHT ON
                RET

LCD_PRINT_LIGHT_OFF:
                ; Expected LCD text: LIGHT OFF
                RET

LCD_PRINT_FAN_ON:
                ; Expected LCD text: FAN ON
                RET

LCD_PRINT_FAN_OFF:
                ; Expected LCD text: FAN OFF
                RET

LCD_PRINT_GATE:
                ; Expected LCD text: GATE OPEN
                RET

LCD_PRINT_DOORBELL:
                ; Expected LCD text: DOORBELL RINGING
                RET

LCD_PRINT_ALARM:
                ; Expected LCD text: ALARM ACTIVATED
                RET

LCD_PRINT_SECURITY:
                ; Expected LCD text: SECURITY SYSTEM ON
                RET

LCD_PRINT_ALL_OFF:
                ; Expected LCD text: ALL DEVICES OFF
                RET

                END

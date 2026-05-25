# Proteus Virtual Terminal Test Plan

## Settings

- Baud rate: 9600
- Data bits: 8
- Parity: None
- Stop bits: 1
- Crystal: 11.0592 MHz

## Test Sequence

| Step | Send | Expected Output |
|---|---|---|
| 1 | `1` | Light relay ON |
| 2 | `2` | Light relay OFF |
| 3 | `3` | Fan relay ON |
| 4 | `4` | Fan relay OFF |
| 5 | `5` | Gate relay ON/open |
| 6 | `6` | Doorbell relay ON/ring |
| 7 | `7` | Alarm relay ON |
| 8 | `8` | Security relay ON |
| 9 | `0` | All relays OFF |

## Troubleshooting

- If nothing changes, check that TXD/RXD are crossed.
- If UART does not work, confirm the crystal is 11.0592 MHz.
- If relays do not energize, check ULN2003A GND and COM pin.
- If MCU does not start, check EA/VPP is tied to +5V and reset network is correct.

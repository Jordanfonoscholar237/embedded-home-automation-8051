# Bluetooth Command List

Use a Bluetooth terminal app or the Proteus Virtual Terminal to send one character at a time.

| Command | Action | Output Pin |
|---|---|---|
| `1` | Light ON | P2.0 HIGH |
| `2` | Light OFF | P2.0 LOW |
| `3` | Fan ON | P2.1 HIGH |
| `4` | Fan OFF | P2.1 LOW |
| `5` | Gate OPEN | P2.2 HIGH |
| `6` | Doorbell RING | P2.3 HIGH |
| `7` | Alarm ON | P2.4 HIGH |
| `8` | Security ON | P2.5 HIGH |
| `0` | All OFF | P2 = 00H |

Suggested Proteus test sequence:

```text
1 3 5 6 7 8 0
```

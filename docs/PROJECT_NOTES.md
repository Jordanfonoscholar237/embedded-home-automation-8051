# Project Notes Reconstructed From Report

The final-year report describes a low-cost home automation system based on:

- 8051 microcontroller
- HC-05 Bluetooth module
- LM016L LCD
- ULN2003A / ULN2803A relay driver
- Relay module
- Power supply using transformer, bridge rectifier, LM7805, and LM7812
- Output loads such as light, fan, TV/gate, doorbell, alarm, and security system

The original simulation used Proteus, Keil uVision, and EdSim51.

This package reconstructs the simulation workflow with:

1. Browser-based interactive demo.
2. Keil/Proteus assembly firmware source.
3. Proteus rebuilding guide and wiring map.
4. EdSim51 simplified test program.
5. SPICE-style conceptual power supply netlist.

## Recommended GitHub Upload

Upload the entire package to GitHub. If you later recreate the Proteus `.pdsprj` file, place it inside:

```text
proteus/
```

Then update this note.

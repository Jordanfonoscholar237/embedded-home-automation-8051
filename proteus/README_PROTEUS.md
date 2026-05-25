# Proteus Rebuild Guide

This guide helps you rebuild the lost Proteus simulation from the final-year report.

## 1. Create New Proteus Project

1. Open Proteus ISIS.
2. Create a new project.
3. Add an AT89C51 or AT89S51 microcontroller.
4. Set the crystal frequency to **11.0592 MHz**.

## 2. Add the Core Components

Add these components:

- AT89C51 / AT89S51
- Virtual Terminal
- HC-05 substitute using serial terminal/COMPIM if available
- ULN2003A or ULN2803A
- Relays or relay module
- LM016L LCD
- Lamps/LEDs/motors as loads
- 11.0592 MHz crystal
- Reset RC network
- 7805 and 7812 regulators
- Transformer, bridge rectifier, and filter capacitors

Use `BOM.csv` for the complete component list.

## 3. Wire the Microcontroller

Use `PIN_CONNECTIONS.csv` as the wiring reference.

Important connections:

```text
Virtual Terminal TXD -> 8051 RXD / P3.0
Virtual Terminal RXD -> 8051 TXD / P3.1
P2.0 -> ULN2003A IN1 -> Light relay
P2.1 -> ULN2003A IN2 -> Fan relay
P2.2 -> ULN2003A IN3 -> Gate relay
P2.3 -> ULN2003A IN4 -> Doorbell relay
P2.4 -> ULN2003A IN5 -> Alarm relay
P2.5 -> ULN2003A IN6 -> Security relay
EA/VPP -> +5V
XTAL1/XTAL2 -> 11.0592 MHz crystal
RST -> RC reset network
```

## 4. Compile Firmware

Open Keil uVision and create an 8051 project.

Add:

```text
firmware/home_automation_8051.asm
```

Build the project and generate the HEX file.

Load the HEX file into the Proteus AT89C51 component.

## 5. Test Using Virtual Terminal

Open the Virtual Terminal in Proteus and send these characters:

```text
1 = Light ON
2 = Light OFF
3 = Fan ON
4 = Fan OFF
5 = Gate OPEN
6 = Doorbell RING
7 = Alarm ON
8 = Security ON
0 = All OFF
```

## 6. Expected Result

Relay outputs should follow the received command. You can connect LEDs or lamps to the relay outputs to visually confirm switching.

## 7. Note About LCD

The main firmware includes LCD message placeholders. If you want a working LCD text display, integrate the LCD driver from:

```text
firmware/lcd_test_8051.asm
```

Then route LCD data lines to Port 1 and the control pins to free pins.

## 8. Real Hardware Safety

Never connect household AC appliances directly while testing. Use isolated supplies, relay modules with correct ratings, fuses, and supervision.

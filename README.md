# Bluetooth Home Automation Using 8051 Microcontroller

This repository rebuilds the simulation assets for the final-year project:

**Embedded Systems: Design and Control of a Home Automation System Using 8051 Microcontroller and Integrated Circuits**

The original Proteus simulation files were lost, so this package provides a reconstructed simulation workspace based on the final project report.

## What is Included

browser_simulation/
  index.html                    Interactive browser simulation of the system

firmware/
  home_automation_8051.asm       Main 8051 assembly firmware for Keil/Proteus
  lcd_test_8051.asm              LCD test program
  COMMANDS.md                    Bluetooth command list

proteus/
  README_PROTEUS.md              Step-by-step Proteus rebuild guide
  BOM.csv                        Bill of materials
  PIN_CONNECTIONS.csv            Wiring/pin map
  POWER_SUPPLY_SIMULATION.cir    Simple SPICE-style power supply model
  VIRTUAL_TERMINAL_TEST_PLAN.md  Test commands for Proteus Virtual Terminal

edsim51/
  edsim51_port_demo.asm          Simple 8051 port-output demo for EdSim51
  README.md                      How to test the logic in EdSim51

docs/
  block_diagram.svg              System block diagram
  PROJECT_NOTES.md               Notes reconstructed from the report

report/
  fono_project_final.pdf         Original final-year project report

## System Overview

The simulated system follows this structure:

Android phone / Bluetooth terminal
        ↓
HC-05 Bluetooth module / Proteus virtual terminal
        ↓
8051 microcontroller
        ↓
ULN2003A relay driver
        ↓
Relay module
        ↓
Home appliances: light, fan, gate, doorbell, alarm, security system

## Chapter 3 Extracted Figures

The project report images from Chapter 3 have been extracted and placed in:

docs/images/chapter3/

A complete gallery is available here:

docs/CHAPTER_3_FIGURES.md

These figures include the power supply circuit, 8051 interfaces, HC-05 Bluetooth module, LCD interface, relay driver/load interface, flowchart, and final home automation circuit diagram.

## Browser Simulation

Open this file directly in your browser:

browser_simulation/index.html

It simulates:

- Bluetooth commands
- 8051 decoding logic
- Relay outputs
- LCD status messages
- Appliance states

## Firmware Usage (Assembly)

To compile firmware/home_automation_8051.asm for use in Proteus:

1. Open the file in Keil uVision (or use SDCC with asx8051).
2. Assemble to generate a HEX file (e.g., home_automation_8051.hex).
3. Load the HEX file into the 8051 microcontroller in your Proteus schematic.

Alternatively, use EdSim51 to test the logic:  
- Load edsim51_port_demo.asm to verify port outputs.

## Proteus Rebuild

Open:

proteus/README_PROTEUS.md

Then follow the wiring table in:

proteus/PIN_CONNECTIONS.csv

## Bluetooth Commands

The suggested commands are:

Command | Function
--------|---------
1       | Light ON
2       | Light OFF
3       | Fan ON
4       | Fan OFF
5       | Gate OPEN
6       | Doorbell RING
7       | Alarm ON
8       | Security ON
0       | All OFF

## Software Tools

- Proteus ISIS for circuit simulation
- Keil uVision for compiling 8051 assembly
- EdSim51 for simple 8051 learning/testing
- Browser simulation for demonstration without Proteus

## License

This project is open source (choose a license like MIT). See the LICENSE file for details.

## Author

FONO PEVETMI JORDAN LOIC – project owner.  
For questions, please open a GitHub issue.

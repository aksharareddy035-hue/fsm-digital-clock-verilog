# FSM-Based Digital Clock with Stopwatch and Snooze Alarm
## Overview

This project was built using Verilog HDL to understand sequential logic, FSM design, and waveform-based verification.
The system includes:
- Digital Clock
- Stopwatch with enable control
- Alarm System
- Snooze functionality using FSM logic
The project was simulated using EDA Playground and verified using EPWave waveforms.
During development, several debugging iterations were performed to correctly implement the snooze behavior and alarm re-trigger mechanism.

# Features

## Digital Clock
- Seconds and minutes counting
- Clock divider used for fast simulation

## Stopwatch
- Controlled using enable signal
- Can pause and resume counting

## Alarm System
- Alarm triggers at preset time
- FSM-based state transitions

## Snooze Feature
- User can snooze the alarm
- Alarm turns OFF temporarily
- Alarm rings again after 2 minutes
-----------------
# FSM States

 State - Description 

 0 - IDLE 
 1 - RINGING 
 2 - SNOOZED 
------------------------------------------------------------------------------
# Simulation Waveform

The waveform verifies:
- Stopwatch operation
- Alarm triggering
- Snooze activation
- Alarm re-trigger after snooze delay
<img width="1870" height="328" alt="waveform_output" src="https://github.com/user-attachments/assets/e24aa015-acd6-43dc-9ed7-b9fb11e3f4aa" />

# Tools Used

- Verilog HDL
- EDA Playground
- EPWave

# Files Included

 File - Description 
 design.sv - Main Verilog design 
 testbench.sv - Simulation testbench 
 waveform_output.png - Simulation waveform 

-----------------

# Authors
- Akshara Perumalla
- Bhavani Magasari

# FSM-Based Digital Clock with Stopwatch and Snooze Alarm

## Introduction

This project was developed to understand the fundamentals of digital system design using Verilog HDL.
The system combines multiple sequential logic components including:
- Digital Clock
- Stopwatch
- Alarm System
- FSM-Based Snooze Functionality
The project was designed and verified using simulation waveforms in EDA Playground and EPWave.
During development, several debugging iterations were performed to correctly implement the alarm and snooze behavior.  
Special focus was given to understanding how FSM state transitions control the snooze functionality.
This project helped in gaining practical exposure to:
- Verilog module integration
- Testbench creation
- Signal monitoring
- Simulation analysis
- Debugging sequential logic behavior
----------------------------------------------------------------------------------------------------------------------
# Clock Divider

The original clock signal changes too fast to observe directly in simulation.  
To make the waveform easier to understand, a clock divider module was used.The divider slows down the input clock and generates a slower clock signal (`clk_1hz`) which drives the digital clock, stopwatch, and alarm modules.
The divider was also modified for fast simulation during waveform verification.To speed up simulation, reduced timing values were used instead of real-time 60-second and 60-minute counters.
<img width="1886" height="466" alt="Screenshot 2026-04-05 141850" src="https://github.com/user-attachments/assets/e702d068-f386-481c-8331-df0af2fd4a97" />
<img width="1529" height="796" alt="Screenshot 2026-04-05 142018" src="https://github.com/user-attachments/assets/4a001a40-148c-481f-940a-e4894fc2c36c" />

# Stopwatch Module

A stopwatch module was implemented using sequential logic in Verilog.
For easier simulation and waveform observation, the stopwatch was configured using a reduced counting range:
- Seconds count from 0 to 5
- Minutes count from 0 to 5
This simplified timing approach helped in quickly verifying the functionality without waiting for long simulation times.
The stopwatch operates using an `enable` signal:
- When `enable = 1`, the stopwatch counts
- When `enable = 0`, the stopwatch pauses
The waveform below demonstrates:
- Stopwatch counting
- Stopwatch pause condition
- Stopwatch resume operation
<img width="1593" height="309" alt="Screenshot 2026-05-18 192519(1)" src="https://github.com/user-attachments/assets/13d6830d-cd2c-4b15-ac2c-9d64fe828772" />

# Alarm System

An alarm module was integrated with the digital clock to trigger at a predefined minute value.
Similar to the stopwatch module, reduced timing values were used for simulation:
- Seconds count from 0 to 5
- Minutes count from 0 to 5
This approach allowed faster verification of alarm behavior in the waveform.
The alarm was configured to activate when:
- Current minute matches the preset alarm minute
- Seconds value reaches the trigger condition
During implementation, one major issue observed was that the alarm signal remained continuously HIGH after triggering.This issue was analyzed and corrected by refining the triggering conditions and integrating FSM-based control logic.
The waveform below demonstrates:
- Alarm activation
- Proper alarm triggering condition
- Correct waveform transition behavior
<img width="1501" height="406" alt="Screenshot 2026-05-18 195530(1)" src="https://github.com/user-attachments/assets/329a9916-6ead-491c-ba38-052b6b17897c" />

# FSM-Based Snooze Feature

The snooze functionality was implemented using a Finite State Machine (FSM) to control the alarm behavior.
The FSM was designed using three states:
| State | Description |
|---|---|
| 0 | IDLE |
| 1 | RINGING |
| 2 | SNOOZED |
For simulation purposes, reduced timing values were used so the snooze delay could be verified quickly through waveform analysis.
### Working Principle
1. Alarm enters the RINGING state
2. User presses the snooze signal
3. Alarm turns OFF
4. FSM transitions into the SNOOZED state
5. After a delay of 2 simulated minutes, the alarm rings again
This module helped in understanding:
- FSM state transitions
- Sequential control logic
- Conditional state changes
- Event-driven hardware behavior
- Waveform-based debugging
  
A significant part of the project involved debugging the snooze behavior to ensure:
- Alarm stops correctly after snooze
- FSM transitions properly between states
- Alarm re-triggers after the snooze delay

The waveform below clearly demonstrates:
- Alarm activation
- Snooze signal assertion
- Alarm deactivation
- Alarm re-trigger after delay
<img width="1870" height="328" alt="Screenshot 2026-05-19 181007(1)" src="https://github.com/user-attachments/assets/5f99f5d1-9397-4480-87dd-b7b5f7ba110b" />

# Final Observations

This project provided practical understanding of:
- Verilog HDL module design
- Sequential logic implementation
- FSM-based control systems
- Simulation and waveform analysis
- Debugging timing-related behavior
The most important learning outcome from this project was understanding how FSM logic controls real-time behavioral transitions such as alarm snoozing and re-triggering.
# Tools Used
- Verilog HDL
- EDA Playground
- EPWave
---
# Files Included

| File | Description |
|---|---|
| design.sv | Main Verilog design |
| testbench.sv | Simulation testbench |
| waveform_output.png | Waveform verification |

---
# Authors

- Akshara Perumalla
- Bhavani Magasari
- Soumya Pisupati

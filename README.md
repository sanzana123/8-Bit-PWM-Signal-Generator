# PWM Generator - Verilog

## Overview
This project implements an 8-bit Pulse Width Modulation (PWM) generator in Verilog. The PWM output duty cycle is adjustable via an 8-bit input (`0` to `255`), controlling the ratio of the ON time to the total period.

---

## Features
- 8-bit resolution PWM signal (256 levels)
- Adjustable duty cycle input (`duty_cycle`)
- Synchronous reset support
- Simple and efficient design suitable for FPGA and ASIC implementations
- Includes a comprehensive testbench for functional verification

---

## Module Description

### `pwmProject`
| Port        | Direction | Description                      |
|-------------|------------|--------------------------------|
| `clk`       | input      | Clock input signal              |
| `reset`     | input      | Synchronous reset (active high)|
| `duty_cycle`| input [7:0]| 8-bit duty cycle control (0-255)|
| `pwm_out`   | output reg | PWM output signal               |

- The PWM signal is high when the internal counter is less than the duty cycle value, otherwise low.
- Counter increments every clock cycle and resets on reset.

---

## Testbench Description

### `pwm_tb`
- Simulates the PWM module over various duty cycles:
  - 25%, 50%, 75%, 100%, and 0%
- Generates a 100 MHz clock (10 ns period)
- Dumps waveform to `pwm.vcd` for waveform viewing

---

## How to Run
- Open a project in quartus prime and paste the code
- Build and simulate to see the results

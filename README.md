# VendingMachine_usingHDL
Vending Machine Controller - FPGA (Verilog) A digital design project implementing a finite state machine (FSM) for a vending machine controller. Developed in Verilog HDL using Xilinx Vivado for FPGA synthesis and simulation.

Vending Machine System on FPGA - Digital Design with Verilog
A comprehensive digital design project that models the control logic of a standard vending machine. This implementation focuses on the hardware description of the system's behavior using Verilog, making it suitable for deployment on an FPGA board like those from Xilinx (Artix, Basys, ZedBoard).
The project demonstrates key concepts in digital logic design, including hierarchical design, finite state machines (FSM), data path management, and synchronous timing. The code is thoroughly simulated in Vivado to verify correct functionality under various scenarios.

Design Highlights:
Modular Design: Separate modules for the controller (FSM), data path (registers, arithmetic units), and output logic.
Synchronous Operation: All logic is synchronized to a global clock signal for reliable operation.
Simulation Verified: Includes a comprehensive testbench to validate all functionalities: coin insertion, product selection, dispensing, and error handling (e.g., insufficient funds).

Configurable: Easily adaptable parameters for product prices and coin denominations.

Repository Contents:
src/ - Source Verilog files (.v)
sim/ - Testbench files for simulation
Images/ - Block diagrams, FSM state chart, and documentation

Toolchain: Xilinx Vivado.
Language: Verilog HDL

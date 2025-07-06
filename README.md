# 16-bit CPU in Verilog 🚀

This is a custom 16-bit CPU built entirely from scratch using Verilog. It includes all essential components of a simple processor: an ALU, a Register File, ROM for instruction memory, and a Program Counter.


## 🔧 Features

- 16-bit ALU (supports ADD, SUB, NOT, SHIFT, XOR, OR, AND)
- Custom ROM with opcode+operand instruction format
- Register File with load logic
- Counter acting as Program Counter
- Clean Verilog testbench with hex output
- Instruction execution simulation with `vvp`

## 📂 Modules

- `ALU.v`: Performs operations like ADD/SUB
- `RegisterFile.v`: Handles operand loading
- `ROM.v`: Stores and outputs instruction set
- `Counter.v`: Increments program counter
- `CPU.v`: Top-level module connecting everything
- `TopModule_tb.v`: Testbench for simulation

## 📸 Screenshots

![Screenshot of simulation table](https://github.com/user-attachments/assets/bd5ff214-3831-4c55-9d5d-7b2530b52974)


##Guide
You can simulate this CPU by changing the instructions inside the ROM file. After that run command
iverilog -o TopModuletb.vvp TopModuletb.v
vvp TopModuletb.vvp 

To see output table of the CPU

ROM instruction should be followed in following manner:-
"(3-bit operation)_(1-bit operand)_(2-bit read_address2)_(2-bit read_address1)_(2-bit write_address)_(16-bit Data_in)_(1-bit enabling)".

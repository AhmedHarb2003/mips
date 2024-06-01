# Single-Cycle 32-bit MIPS Processor

## Overview
This project implements a single-cycle 32-bit MIPS processor. The MIPS processor is a Reduced Instruction Set Computer (RISC) that uses a small, highly optimized set of instructions. This processor is suitable for educational purposes to understand the basics of computer architecture and assembly language programming.

## Features
- Implements a single-cycle architecture
- Supports a subset of the MIPS instruction set
- Includes basic arithmetic and logical operations
- Memory access instructions
- Control flow instructions (branching and jumping)

## Requirements
- VHDL/Verilog or a similar HDL (Hardware Description Language)
- Simulator/FPGA tools (such as ModelSim, Xilinx ISE, or Quartus II)
- Basic knowledge of digital design and computer architecture


## Setup Instructions
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/MIPS_SingleCycle_Processor.git
    cd MIPS_SingleCycle_Processor
    ```

2. Open the project in your HDL tool (e.g., ModelSim, Xilinx ISE, Quartus II).

3. Compile the RTL files in the `rtl/` directory.

4. Run the testbenches located in the `testbench/` directory to verify functionality.

## Usage
To use the processor, load a MIPS assembly program into the instruction memory module. The processor will fetch, decode, and execute the instructions in a single cycle.

### Example
1. Write a MIPS assembly program and convert it to machine code.
2. Load the machine code into the `instruction_memory.v` file.
3. Simulate the processor using your HDL simulator.
4. Observe the results in the simulator's waveform viewer or output console.

## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

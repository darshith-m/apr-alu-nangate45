# ALU Synthesis Script Documentation

This document explains the Yosys synthesis script (`synth.ys`) used for synthesizing the ALU design into a gate-level netlist using the NanGate 45nm open-cell library.

## Prerequisites

- [Yosys](https://github.com/YosysHQ/yosys) synthesis tool
- NanGate 45nm OpenCell Library
- SystemVerilog ALU design file

## Directory Structure

```
.
├── 0_pre_synthesis/
│   └── alu.sv
├── NanGate45/
│   └── lib/
│       └── NangateOpenCellLibrary_typical.lib
└── synth.ys
```

## Running the Synthesis

To run the synthesis:

```bash
yosys synth.ys
```

## Script Commands Explained

### Design Reading and Setup

```tcl
read_verilog -sv ../0_pre_synthesis/alu.sv
```
- Reads the SystemVerilog ALU design file
- `-sv` flag enables SystemVerilog features

```tcl
read_liberty -lib ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
```
- Reads the NanGate 45nm cell library
- Contains standard cell definitions and timing information

```tcl
hierarchy -check -top alu
```
- Checks design hierarchy
- Specifies 'alu' as the top-level module
- Verifies there are no undefined modules

### Design Optimization

```tcl
flatten
```
- Flattens the design hierarchy into a single level
- Helps in achieving better optimization

```tcl
proc
```
- Converts processes (always blocks) to multiplexers and flip-flops
- Performs basic optimizations on the design

```tcl
opt
```
- Performs general purpose optimizations

```tcl
synth -top alu
```
- Runs the actual synthesis process
- Converts RTL to gate-level netlist
- Optimizes the design for the target technology

### Post-Synthesis Processing

```tcl
setundef -zero
```
- Sets all undefined values to zero
- Ensures deterministic behavior

```tcl
dfflibmap -liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
```
- Maps flip-flops to the target technology
- Uses cells from the NanGate library

```tcl
hilomap -hicell LOGIC1_X1 Z -locell LOGIC0_X1 Z -singleton
```
- Maps high/low constants to technology cells
- Uses LOGIC1_X1 for logic 1
- Uses LOGIC0_X1 for logic 0

```tcl
abc -liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
```
- Performs technology mapping using ABC
- Maps generic gates to NanGate library cells
- Optimizes for area and timing

### Verification and Output Generation

```tcl
clean
```
- Removes unused cells and wires
- Cleans up the design

```tcl
check -assert -mapped
```
- Verifies the mapped design
- Checks for any assertions
- Ensures all cells are properly mapped

```tcl
stat -liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
```
- Generates statistics about the synthesized design
- Reports cell usage and area information

### Output File Generation

```tcl
write_verilog -noattr synthesized_alu.v
```
- Writes the synthesized netlist in Verilog format
- `-noattr` removes unnecessary attributes

```tcl
write_spice -pos VDD -neg VSS -top alu -big_endian -buf subckt_name -nc_prefix _NC -inames synthesized_alu.sp
```
- Writes the synthesized netlist in SPICE format
- Specifies power (VDD) and ground (VSS) nets
- Uses big-endian bit ordering
- Adds SPICE-specific formatting and naming

## Output Files

The script generates two output files:
1. `synthesized_alu.v` - Synthesized netlist in Verilog format
2. `synthesized_alu.sp` - Synthesized netlist in SPICE format

## Note on Static Timing Analysis

The script includes a commented-out STA (Static Timing Analysis) command:
```tcl
#sta
```
If you want to perform timing analysis, uncomment this line and ensure you have the proper timing constraints set up.
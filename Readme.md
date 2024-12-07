# Memory Mapped IOs for MIPS datapath supporting R, I, and J-type instructions
* A lab project that adds a memory-mapped IO unit to a MIPS datapath VHDL implementation which supports R, I, and J-type instructions. 
This MIPS datapath implementation was cumulatively developed across multiple lab projects to each this stage.
* NOTE: Several screenshots and figures are sourced from lab instructions manual provided by lab instructors at GMU for ECE 445 in December 2020.

## Fully-assembled project with Vivado 2020 provided:
* The "lab6_2020_1Version" directory is the full vivado project. Separate source files are still provided in the "VHDL_Source_Files" directory for convenience.

## Provided files by instructor(s) that may have been modified to achieve project objectives:
1. toplevel.vhd
2. mipsucf.ucf
3. datamem.vhd
4. instmem.vhd
5. alu.vhd
6. MIPS Reference Card.pdf

## MIPS assembly program:
1. lab6.asm
2. lab6MIPSCode.txt (to view #1's src code outside of MARS editor)

## Introduction (Contains figures from ECE lab manual):
* The goal of this lab was to implement the MIPS datapath using the structural VHDL model that incorporates R-type, I-type, and J-type instruction support. This was done by using the toplevel.vhd file to declare and instantiate the datapath wrapper so it could be implemented to the Basys-III board. 
* After the initial implementation, part 8 of this lab focuses on simulating the machine code program that will be used for constructing an infinite integer sequence: [1, 2, 3, 6, 9, 18, 27, 54, 81, ...] using R-type, I-type, and J-type MIPS instructions.

![alt text](<README_Contents/Top-Level block diagram.png>)
![alt text](<README_Contents/Datapath for R-type instructions.png>)

## Problem Logic and solution:
* The component that needed to be coded in VHDL was the MemoryMappedIO block. Toplevel needed to be modified to include a declaration and initiation of the modified datapath wrapper, with the proper input and output signals mapped to the toplevel component. 
* Since the instructions memory and register file components were already provided with the proper instructions and values for part 6 testing, part 6 is simply testing to see if all outputs that were shown in the simulation of the datapath match the outputs being shown on the Basys-III board. As a note, part 6 
* Part 8 involves the use of MARS to code the program to construct an infinite series in hex-machine code to be written to the instruction memory. MARS shows the machine code in hexadecimal, which allowed this task to be completed rather quickly.

## Block Diagram:
![alt text](<README_Contents/Block Diagram.jpg>)

## Table Diagram of MIPS Instructions (From ECE lab manual):
![alt text](<README_Contents/Table of MIPS Instructions.png>)

## Hexadecimal Code from MARS that is executed in Part 8:
![alt text](<README_Contents/Hexidecimal Code from MARS.png>)

## Simulation waveform screenshots:
![alt text](<README_Contents/Memory Mapped IO Simulation.png>)
![alt text](<README_Contents/Datapath Simulation.png>)
![alt text](<README_Contents/Part 8 Datapath Simulation.png>)

## Concluding remarks:
The Memory Mapped IO block was successfully implemented in the MIPS architecture - though the block diagram needed to be adjusted to include the necessary IP for the Memory Mapped IO component. Furthermore, the implementation on the Basys-III board appeared to not match the simulation of the Datapath due to a vivado bug/issue that didn’t simulate correctly, yet the Basys-III board functions properly with the proper outputs.
Lastly, the single cycle MIPS architecture is bottlenecked since it cannot pipeline instructions, which can be a point of improvement for future implementations to improve the effective clocks-per-instruction (CPI).
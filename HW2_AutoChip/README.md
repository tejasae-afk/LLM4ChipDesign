#  AutoChip: LLM-Assisted RTL Generation and Verification

> AI-Driven Hardware Design using Structured LLM Trajectories  
> Course: LLM4ChipDesign  
> Instructors: Prof. Ramesh Karri and Prof. Weihua Xiao  

---

##  Overview

This project explores **LLM-assisted digital hardware design** using the AutoChip framework. The objective is to generate synthesizable Verilog RTL from natural-language specifications and validate correctness through simulation-driven refinement.

Unlike single-shot code generation, AutoChip emphasizes:

- Multi-step trajectory refinement  
- Iterative simulation feedback  
- Structured correction loops  
- Formal reasoning about RTL correctness  

This repository demonstrates how AI models can be integrated into hardware design workflows while maintaining engineering rigor and verification discipline.

---

##  What This Project Demonstrates

- Translating natural language into synthesizable Verilog  
- Iterative refinement using LLM feedback loops  
- FSM modeling with overlap detection  
- Formal correctness reasoning  
- Register-transfer-level (RTL) design principles  
- Binary state encoding optimization  
- Simulation-based validation with Icarus Verilog  
- Manual vs AI-generated RTL comparison  

---

## Project Structure

```text
├── AutoChip_Example1.ipynb        # Combinational logic (GPT-4o-mini)
├── AutoChip_Example2.ipynb        # Sequential FSM (GPT-4o)
├── example1.v                     # Generated combinational RTL (created inside notebook)
├── sequence_detector.v            # Generated FSM RTL (created inside notebook)
├── sequence_detector_manual.v     # Manual FSM implementation (created inside notebook)
├── testbenches/                   # Verification testbenches (generated inside notebooks)
├── AutoChip_Report.pdf            # Formal technical report
└── config.json                    # Model configuration parameters (generated inside notebook)
```

---

## Technologies Used

- Verilog HDL  
- Icarus Verilog (iverilog + vvp)  
- AutoChip Colab Workflow  
- GPT-4o-mini (Combinational Design)  
- GPT-4o (Sequential FSM Design)  
- GTKWave (optional waveform viewing)  

---

##  Implemented Designs

### Combinational Logic Module

Boolean Function:

y = (a ∧ b) ∨ (¬c)

Implemented using continuous assignments.

Key properties:
- Purely combinational
- No inferred latches
- Fully synthesizable
- Verified against full truth table
- Generated using GPT-4o-mini

---

### Sequential FSM – Sequence Detector (Pattern: 1011)

Design features:

- Moore machine architecture  
- Binary state encoding (3 flip-flops)  
- Overlap-aware pattern detection  
- Synchronous reset  
- Fully synthesizable  
- Verified through simulation  

FSM invariant:

State(t) = S_k → longest prefix match of length k

Detection condition:

x(t-3)x(t-2)x(t-1)x(t) = 1011

---

## AutoChip Iterative Workflow

Each design followed this structured process:

1. Natural language specification  
2. Initial RTL generation  
3. Compilation using `iverilog`  
4. Simulation using `vvp`  
5. Error feedback analysis  
6. Iterative refinement  
7. Convergence to passing implementation  

Formal stopping condition:

For all testbench cycles, Observed(t) = Expected(t)

This ensures functional correctness.

---

## Simulation Commands

bash
iverilog -o example1_tb example1.v example1_tb.v
vvp example1_tb

iverilog -o sequence_detector_tb sequence_detector.v sequence_detector_tb.v
vvp sequence_detector_tb 

All test cases passed.

## Manual RTL Design
To compare AI-assisted design with traditional engineering practice, the FSM was manually implemented using:
- Binary state encoding
- Synchronous reset
- Non-blocking sequential assignments
- Explicit next-state combinational logic
The manual design passed the same verification testbench and demonstrates strong foundational RTL design principles.

## Key Insights
1 Combinational Logic
- Lightweight models (GPT-4o-mini) perform effectively for Boolean logic problems.

2 Sequential Logic
- More complex FSM design benefits from larger reasoning models (GPT-4o), especially for:
- Overlap handling
- Reset logic correctness
- Complete state transitions

Verification is Critical
LLMs can generate syntactically valid but functionally incorrect RTL.
Simulation-driven refinement is essential in hardware design workflows.

## Academic Context
Completed as part of:
LLM4ChipDesign

## Instructors: Prof. Ramesh Karri and Prof. Weihua Xiao

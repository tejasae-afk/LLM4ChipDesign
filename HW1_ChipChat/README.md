# LLM4ChipDesign  
## ChipChat Tutorial Assignment

This repository contains my complete submission for the **ChipChat Tutorial Assignment**
in the course **LLM4ChipDesign**. The purpose of this assignment is to explore how
large language models (LLMs) can assist with Verilog RTL generation, and to understand
their limitations through simulation, verification, and debugging.

Rather than assuming that LLM-generated RTL is always correct, this assignment
emphasizes prompt engineering, manual cleanup of generated code, verification using
testbenches, and iterative debugging based on simulation results.

---

## Repository Structure

```text
.
├── chipchat_exampleA.ipynb   # Part I: Combinational example (binary_to_bcd)
├── chipchat_exampleB.ipynb   # Part I: FSM example (sequence_detector)
├── chipchat_extension.ipynb  # Part III: Extended FSM via spec change
├── ChipChat_Report.pdf       # Final written report
└── README.md                 # This file
```

Each notebook is self-contained and can be executed independently.

Assignment Overview
Part I — Tutorial Examples

Two official ChipChat tutorial examples were completed:

Example A (Combinational): binary_to_bcd
A purely combinational module that converts a binary input into its BCD
representation.

Example B (Sequential / FSM): sequence_detector
A finite state machine that detects a specified input sequence and asserts an
output signal when the sequence is observed.

For each example, the corresponding notebook includes:

The final prompt used for RTL generation

The raw LLM-generated output

Cleaned and synthesizable Verilog code

The provided (unchanged) testbench

Compilation and simulation using iverilog and vvp

Programmatic generation of .v files for reproducibility

Part II — Debugging and Iteration

Part II documents an iterative debugging process based on the FSM example from
Part I. Although the design initially compiled successfully, it failed simulation
due to subtle issues related to reset behavior and Verilog scheduling semantics.

This section demonstrates:

Multiple debugging iterations

Identification of simulation failures

Root-cause analysis

Incremental fixes applied only to the DUT

A final passing simulation using the original testbench

This part highlights the importance of verification and debugging when working with
LLM-generated hardware descriptions.

Part III — Prompt-Engineering Extension

For the extension, the tutorial design was modified to introduce additional
functionality beyond the original specification. The extension demonstrates how
prompt engineering can be used to guide an LLM toward generating modified RTL, and
how verification must be adapted accordingly.

This part includes:

A clearly defined extension to the original design specification

Updated RTL reflecting the new behavior

A self-checking testbench written to verify the extension

Successful simulation results demonstrating correctness

Tools and Environment

Environment: Google Colab

LLM Access: OpenAI API (via the Chat Completions interface)

Simulation: Icarus Verilog (iverilog -g2012, vvp)

All dependencies are installed within the notebooks. The only required manual step
to rerun the notebooks is inserting an OpenAI API key in the designated cell.

Reproducibility

Each notebook is designed to run from top to bottom on a fresh Colab runtime.
Running a notebook will:

Install required dependencies

Generate Verilog RTL files

Compile the design using iverilog

Run the simulation using vvp

Display clear pass/fail results

No external files or manual edits are required beyond providing an API key.

Lessons Learned

LLMs can significantly speed up early RTL development, but they are not guaranteed
to produce correct or synthesizable designs

Prompt clarity and specificity strongly influence generated HDL quality

Simulation is essential for validating correctness

Debugging LLM-generated RTL remains a human-driven process

Treating the LLM as an assistant rather than an authority leads to better outcomes

Course Information

Course: LLM4ChipDesign
Instructor: Prof. Dr. Ramesh Karri
Course Assistant: Weihua Xiao

Author

Tejas Attarde
M.S. Electrical & Computer Engineering
NYU Tandon School of Engineering

Notes

This repository is submitted as part of a course assignment.

# Veritas Submission

**Professor:** Prof. Dr. Ramesh Karri  
**Instructor:** Weihua Xiao  
**Student:** Tejas Attarde

## Overview

This repository contains my completed Veritas submission. The project follows the Veritas workflow for correctness-by-construction logic generation:

1. Generate CNF equations for a target design
2. Convert CNF to BENCH
3. Simulate the BENCH netlist to generate truth tables
4. Convert BENCH to Verilog
5. Validate generated truth tables using Python oracles

The submission includes:
- the executed Colab notebook
- the final report PDF
- generated artifacts for each run

---

## Repository Contents

```text
veritas-hw/
├── README.md
├── Veritas_tutorial_Part1.ipynb
├── Veritas_Report_Final.pdf
└── artifacts/
    ├── adder_3-bit/
    │   ├── adder_3-bit.cnf
    │   ├── adder_3-bit.bench
    │   ├── adder_3-bit.csv
    │   ├── adder_3-bit_tab.csv
    │   └── adder_3-bit.v
    ├── decoder_2x4/
    │   ├── decoder_2x4.cnf
    │   ├── decoder_2x4.bench
    │   ├── decoder_2x4.csv
    │   ├── decoder_2x4_tab.csv
    │   └── decoder_2x4.v
    ├── gemini_adder_3-bit/
    │   ├── adder_gemini_3-bit.cnf
    │   ├── adder_3-bit_gemini_raw.cnf
    │   ├── adder_gemini_3-bit.bench
    │   ├── adder_gemini_3-bit.csv
    │   ├── adder_gemini_3-bit_tab.csv
    │   └── adder_gemini_3-bit.v
    └── adder_5-bit/
        ├── adder_5-bit.cnf
        ├── adder_5-bit.bench
        ├── adder_5-bit.csv
        ├── adder_5-bit_tab.csv
        └── adder_5-bit.v
